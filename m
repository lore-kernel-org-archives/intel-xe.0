Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF221EEC296
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD6B10E317;
	Mon, 23 Feb 2026 21:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbGhXWHY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE1E10E317
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771883818; x=1803419818;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/DK4EdPUjmHyYi7IvFsJFpzQjnX69mG397iJJg/vkXQ=;
 b=FbGhXWHYJiQvYrX0VUFqKTnfDB0hjsr2jBRZ0/XKBbFO6giOZRFRcXzx
 fO7LnlpbOrEIDFyPMDUEdHYKxhz2Gs6DjFutViishTl/kCvi2G1n49mkG
 HtjPFG28rf33HMsyyBLHOWHU2deOcfmGNRM3Rx3GC/Aiswys7qpKQxvY+
 MoPR1VejIyavGkE+H7VmjKR7B2CVfzVtZlX3sD5zLTqFnWOK0w37aYGEN
 /UWNspgtdItFrHv/8HSwL3SbjByycSFb1b6pq6NEWLsyQDnRm3TxzV639
 xTlyhevhSpxySqfLBbzvs9ucFtm70/0uDVhQqu8tmYzr/wUKbrGhaM4mm Q==;
X-CSE-ConnectionGUID: aLoqNRt/TR2cjPQE4Ey6EQ==
X-CSE-MsgGUID: 0M8GirEqQv+XPHmoMDgR3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72794278"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72794278"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:56:57 -0800
X-CSE-ConnectionGUID: JNqCfMKNRBewBp9GKsSdTQ==
X-CSE-MsgGUID: S+j9HgvAS9aZbv4QD8VdFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="243764645"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:56:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:56:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:56:56 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:56:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgkyCo88cTPu0iLPVISkalTYMGL0s1124mrGAjVDXheIOkvgp3fZNropAFbepnEVdlLVO9we3Sv3Td7O+YJ9xJGSQyBAA+8abB3VkrhxPZasNdSgA7PfsA0/g5BvRrHnVM3dGP+6IzZgqL2v0o2e6hTRjiXM/Sy5CunG3VNofha2XEW4iiJ6YhhEZ/nPApcQxwB5HELDg6gVBpKEHNPTCujLNzxK9Art7mAHN5YPKD7xw3zM9c6Wu3vhT2I/0K0c7PgBOMCmTPc7TVEaJEtAMoLu3aorUhSOoRxcN+OobfE0e8R+N9Ut6JTJt2bnbS2kBnv2knzPVCnPnbDho7fPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DK4EdPUjmHyYi7IvFsJFpzQjnX69mG397iJJg/vkXQ=;
 b=bzcyJY41SMo85twnwov2CobSAV27ljVqWhC9OI40wVNjwguiJj953SiuhPivlKh5RLXoKKsQuOIw2ANhEbVYVum82dA8tBFTpHkwDvo5IVoNXXJP6J9KSbfPjObFCWggKv0Yn/0ntUJwNdObSbg/x4QKi2guaTNYCuvJIXp8ewwtFAfEl7E40pYN16BtYNT8UHv6u7S28bNLNjtydZqxJxPqmWD4dSpFWHjqPP1190HJWFAOYT4jgSBjEczS6Zi2QTMEcHMT7WAoliPAtSg34IbtTM5R1PsM3G9YkcS/6Abq58OBa3WUwjgtMUfgwSrFcsZzqzeFPh63V0Zz74Sc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ2PR11MB8403.namprd11.prod.outlook.com (2603:10b6:a03:53c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Mon, 23 Feb 2026 21:56:53 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:56:53 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Charles, Daniel"
 <daniel.charles@intel.com>, "Yang, Fei" <fei.yang@intel.com>, "Mrozek,
 Michal" <michal.mrozek@intel.com>
Subject: Re: [PATCH] drm/xe: Document exec queue priority rules
Thread-Topic: [PATCH] drm/xe: Document exec queue priority rules
Thread-Index: AQHcpQrd01hOiXbwFUuhh0uoascmT7WQz8oAgAAEwAA=
Date: Mon, 23 Feb 2026 21:56:53 +0000
Message-ID: <73fc07785ffc41b2ca598178aa1601c9ba867ee8.camel@intel.com>
References: <20260223212442.8923-1-stuart.summers@intel.com>
 <aZzJJiWLHYn59O1G@lstrano-desk.jf.intel.com>
In-Reply-To: <aZzJJiWLHYn59O1G@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ2PR11MB8403:EE_
x-ms-office365-filtering-correlation-id: 7b4cf0d5-1462-4018-c18c-08de73267451
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SWxTWTQyVUdETHh3TlpEZ0xodFUrN2I3alB1R1BmeFc4allHUHNteFFmT1My?=
 =?utf-8?B?UXdROUpwckpWcmFycUZxdUprc3hscEhBOURaeC8yU2h5N0xNOWEyWEdMNnRE?=
 =?utf-8?B?TytOVWN6QU1KMTBHZ3ZBVDJHWlV6RVFreEpkZHByTit3RmtBWjR4UCtmdXJh?=
 =?utf-8?B?K1g0WGRKbisvdjliZDNJekxLK1ZwbGwwZVdUWVJ2VkJJVERreTFQTnROZTNr?=
 =?utf-8?B?dk9sdk5iR1BsNWhMSm5IRENiSWxDS2pRQ2pOL3pJbE8yUGd3ekE5YkdleHQw?=
 =?utf-8?B?cE1KQmFibERONDRQU1RjV2hOZ05Xa2xCZXBxWjVkcjErSk1JTFRDajBqUnBa?=
 =?utf-8?B?bTE2K3JJeE9wdXNzeVZ3cTJ2SEY0SUFmQnJIbjg0T2o2Yk5URlpLNzJLL0Rw?=
 =?utf-8?B?UGU4NjVPcUVqVVZQRndsdFVyS2xSVHQwYWVhT25nSjFub2toTXpOM3pNTFZz?=
 =?utf-8?B?QnZBV3dtUVF5R0RZbkU2bGw2TXZZMGJzY29YdnV5enFEQ1VaWENWdmw3R0xl?=
 =?utf-8?B?dFdMTXdLN01FUk4xRnpYcWVnUUtPdlZFREorNzAyNEFJcm1HZm91amsveE5K?=
 =?utf-8?B?bjBhWlJWeEdCeHZhOU1RNk9TKzBkVmpsS2dsbjB4MExRcFM5NWNVdEgxbC8v?=
 =?utf-8?B?d2Q2SXZJdnlCamM2QjVsUXBPSWlBVCthdEZVRWdUTllRTTl3dzFzUUhzN2ZV?=
 =?utf-8?B?eDlSSHh1WFZPWCs0UjJaUmpzMjJ2WHloaW14M1ZWZ0krVmtyYmtWL0tuckhG?=
 =?utf-8?B?UkpuWWk4Qk1EelFyNDRaazJYSFVlb0JiS3RXUXdMRHM5RER1d0h5OERPcmJh?=
 =?utf-8?B?ZmdZT1VaaXBGNGVUZFlCWEdwYWZJS1g2OW5WcHFjcm45YTlzdlVnZmU4emJZ?=
 =?utf-8?B?SWJGTXJBVXVpRXR4aGt2a3hzSXNVSDVwNmxhbXlvK2RwWVNXRlU3elBzK1RD?=
 =?utf-8?B?YWdCNmlwcW5SWGpsQm5XYkxMSzJGTHFKei9WMGFVd3RGMkgzN2hRNzMxQUMy?=
 =?utf-8?B?YWZzSHBWdDVUdStUUTZxRlVqdGx0R2tYUXVoZWcwQXVYcjdBNVFnNGNCcyt0?=
 =?utf-8?B?aU1DdHBRdTVMNndTdlM2OUxURDdPQUpPTXZYdWNPOGZZbWJRVFdpYng4SFZZ?=
 =?utf-8?B?ZzE2SUZFUzFrZHVJdWN0QWxHb1hGWGFsQXF5bDlsR2lmeGRUV0NiTklsUkk5?=
 =?utf-8?B?d09sUGJKMk0zUXRCdWpwb0R3UktSb1dIZEk3WVhWNWZtK0RvOGc3R0lxL1pp?=
 =?utf-8?B?bUtUUE10dGUvd096TXA4MUVIY1pyazhJSmFPcmJHQkNjUlBFZzBwOXVCczNF?=
 =?utf-8?B?UWxlbWVXTk9IYnM1N205MjFxKzBFQkYrOTh6RFVIU2E2N25MTGxreFNUVld2?=
 =?utf-8?B?Vml5R2FzY1pvUDljMnV1V1E3NEIxZ3VxZGR4U0MxQzZCblNkK0Ntam5TUnBR?=
 =?utf-8?B?TFgxT090SDBGZHRxanVWVkpVVGZSVTZkVUJPdXdWWWlFYU13NjNlNDBoSW02?=
 =?utf-8?B?K2dkTURkbURiVUtKVUxhYjlYeG8xR0VXMXhBYmk4aWFVOVhZeFdOMFYwaERh?=
 =?utf-8?B?RWdEaGg1dml2cFZzQkRrR2xKTzBTSGlJMW1DTU5leWZxUFJpR0VOL1VuN25D?=
 =?utf-8?B?ZUEwMWgybWI2U2JKdzJyRkJweDNkTXRvL2gzc2l4OVhsYTYrQ1MxYXJ3U1Bl?=
 =?utf-8?B?TnRrRXRXSys2V09YaVZZUDMxeFlxOXBRS0dKSjNWZEJQQVgxYzh5YVJsdVNK?=
 =?utf-8?B?NUcyS0RydWhXajJrVVo5am9ERGhwNnUxcHY2RU9FU3MwcW90bkd0VG95aU1z?=
 =?utf-8?B?dG1SbjNGR2swZjRpUVlmMFNwMXNtdmdkVjhoSFlNZ29RcC9JNE9ZME12TS95?=
 =?utf-8?B?OUhwdVdqM2V3NHMyTlFyMWdVaEI2WW8yNkhVdXZMTWhIMHo2WUtvdWdTTTQr?=
 =?utf-8?B?SnJZZHdUYmJKVFNXU0xUeENZdENmaXNMa0F4ZGYvWHgyQmkvamErMG5HL1dK?=
 =?utf-8?B?QVdNNkpTclg1bklTN29sYnF1TmNTa0FiM3hEbWRMYSs3WTFxSkpMaWowamg3?=
 =?utf-8?B?RGJ1Sk55TmdGQXUybUREdVRlRktOakN2VGJJMElpZXIxUnl3MjhPS0kwRkhD?=
 =?utf-8?B?WGVFT2JNVUZxL0JYVWxhZ2JCNTZTSEdndlpUOVM3VFhvR3AyUURKczM3cFRp?=
 =?utf-8?Q?DyzywQOnesHVKQfzM4aCNHU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZE00THkvaEV6QXlDNkRNUHZQQTA4WUxXb3E2R1dXN0dwRUUzczVYWFovSFJV?=
 =?utf-8?B?L3c3VzdoUTFPWlFsMUloMkhzaDZnMlM4SHNTQURiUEtCRFRpTW0wMlcwLzVv?=
 =?utf-8?B?SVVDOTd6aXUzYm9jZExQR2hUa284R0l6MnpsNkErbVRWaDgrcUVSUDNFODhU?=
 =?utf-8?B?UGVuWU1xblo1NUZsU1hhTU9KU1BHWUV2Q3Y3R25KUHBBM3JEVzg5N2ZHclhP?=
 =?utf-8?B?dWRDQ1IrRWN3QXp2NEZ2c0dsWXpBNHFaU3M1azZkZnlIeGt4bXJrQ0hRanRZ?=
 =?utf-8?B?a1QvVkpST3NlS0s3dUJnZDE5TjJwcVdkcVAyeDRWblJDZjlJQnFwYzlEaHNh?=
 =?utf-8?B?S1BJUTBiYktVRzN3ZTltcEJHdk8rSy9jZ0MvL2hneVhoeWpMWThTSjlNaVN0?=
 =?utf-8?B?blQ0WnFaWDBjRVRCZFB1cEdwUElrMUxYeEZSRFFMVmJFRzlLNlczUW0yUmxh?=
 =?utf-8?B?d1ErT3FTbzg2RElXdGs5K3V6MFEzZ1QyS3U4eWZ3VVlmMU9kV2tVaHIxSmNX?=
 =?utf-8?B?RFJHbWdqR1BDUUt4ZnFwVFFMUEdKaXUvVEs1bldKSWZDWlplWThOa2ZwRGd0?=
 =?utf-8?B?WUVZaThCUzNEampqZ3RsK3p2M2VLeXZEaHNMKzdKbGdVVjhJUkUrM1FLZEN2?=
 =?utf-8?B?dEUwVTZsd3Mrb2pFM2ZzQVU5MzZhTEx2Szdnb3FRZkFmMlhZWVBnUUVFTkw1?=
 =?utf-8?B?MXlzcjRjYktBZUc4T1duTTl0enp6Tk9JTHJnSDJiQWE0aGFqNmpMcGNPejJY?=
 =?utf-8?B?VGF5YVl3eFpINWhEYm0vNWdGTk84RURyS3RnTGY5dFVFRGF1TjMzdXZhSzhy?=
 =?utf-8?B?eTBvMnNMaEU3VTFsOFVFSXdXQlJzYytsbzVTNGdFbk5Rc2UxQmxUV3M4N2ZP?=
 =?utf-8?B?UWZqTFpPTG1uc1hPVFlJaDJrWlVSVHUrR3YxSGhaZkxiQmhWY1JhcXppUTdW?=
 =?utf-8?B?dXFYcGs2UHRCcDUrT0p0ODJvd0pJSkdYRmhCL05vR3lpb0FOMFl2d0F3STQy?=
 =?utf-8?B?WVQvS2FIdnZqVXVSSk42ckVNamJxYnV2dkxYclpab2pZbXJMTC8zU1JJMnpr?=
 =?utf-8?B?eGxVZFUybjBMY2tZTjJ4K3dsS0MxOStNUW00NkdWZlU4ZlpTdFJGbDFSTVhq?=
 =?utf-8?B?Zld5L0YvaUF6YjlDZzlCZWcyNjA1YUZaSWRSSTFaQkdaZnJvcENVeEVpUmZG?=
 =?utf-8?B?cWRzU2VSdUxlMm9GN3ozVytXQUgvRThZSkN2SGZZQnJhSks1T0RxVXkzM2Ra?=
 =?utf-8?B?MGNTQW9kSHA4QTlQRmVkc0l3dXFWeXRUak04RHluSThqaTRTN29SR0tENTN2?=
 =?utf-8?B?eW91NEdNYXNqK29rOVdablNwNjdCTTFqU2xqRzh1aHp4UUtub1A1a0NPalQ2?=
 =?utf-8?B?Wi9KTXo2RFMrVjV0NnJVY3dCWHJuZjFRQmU2aFQ0TXpvbExIMnR2Nmhvb2l2?=
 =?utf-8?B?bnQxc1RBak1UZ1N5UXNDeHI3SHZRMjk3RXFLaWlyT3dxL0h2SnNCUTRqZ2JQ?=
 =?utf-8?B?a2VEQW03bVhDMDR1NXBSNEF0aDhWcEI2N3U0SXVSYVVTUW84V3lrWjdMM3Jx?=
 =?utf-8?B?bUIyZ1dRbEs2d2JNVVZmMEF3MXRzRjBxNHNkS2drOXptTlMwbTluTUUxQVo0?=
 =?utf-8?B?bmpWdzRvRkJtNzhiS2wzcTJqWjBhb25VdU14a0Q2VnlkV1BmR3hnaTBsM1ZH?=
 =?utf-8?B?Y2pDUGJzUzZuZllDNko1RkNBNE1aRXJjZHdLWTRFOE9EckVpc2J1WDJSb1hr?=
 =?utf-8?B?c1JFR0p1cWtyUE5WY3VzN1dxWDlJRE02dk9mMWtjZmxJc2ZMcmNqQVQxU3dQ?=
 =?utf-8?B?VGRGN1FQTU1rMXdRcVZ4NUk0VlhiMUJWUmMvaWtYZnUrVk9Pb3lkMVg5N01l?=
 =?utf-8?B?VzJJbVF0bE5VSi9BbEFSaWlQUzhCVU9HTzZiTUx4UHBFMEdZVEhJcDYrL2tW?=
 =?utf-8?B?T3I3bDM2b2tLMmd2T0VjK3llMVBFK1M2ZkpZQndLV3pYdFB1Nmo1S1R0OVY4?=
 =?utf-8?B?QWNqWmlkV1ZNb3Bhb1ptWHlUUVZwSlR3Sm1sMEF6cGtxUjgyOWp0cWJvcnpM?=
 =?utf-8?B?TjdwN2ZRUXJlSGZSWFowMDdFcnNpWlZWMzUvSUVPajVCT3ZwYStrRkx0S3Vx?=
 =?utf-8?B?c0R1N2ZZRVltckdrdDFjTUJEdWhhUjVrejl5L0NsMTllMkNQKzB5ZXgyRmVM?=
 =?utf-8?B?cS9YOHlOMFNlRE96V21Cd1d1Y1hsRkdvaTRNUHh0N2Z4dVJsekVOMExoVGkr?=
 =?utf-8?B?NE51Q2hldGdhYURUS3V4UFRMZkpKcGE2dmxTRVgydjFURXloZWtOeDFsN3JB?=
 =?utf-8?B?aUI2bnVHVjViM2dqM0FteE1YM2E4aTBqMmhaUkNEWXp3T3FqNkhMb0pEMFFM?=
 =?utf-8?Q?1ohQrH7YSWWRgjIo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED7B322EF2A41B4AA04E9220EFF0D3D9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4cf0d5-1462-4018-c18c-08de73267451
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 21:56:53.0609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMfa7/kEakupOe7u76bMxmosPaSV8xeKaoFzRtlqkoLxZwwo6OiT9YEP2huDEtXkrmqzOB/ViGBn077q8yfDVjKrCdmHvMFkkDYk5YYga/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8403
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI2LTAyLTIzIGF0IDEzOjM5IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBNb24sIEZlYiAyMywgMjAyNiBhdCAwOToyNDo0MlBNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBBZGQgc29tZSBkb2N1bWVudGF0aW9uIGFyb3VuZCBob3cgdGhlIEd1QyB3
aWxsIGVtcGxveQ0KPiA+IHRoZSB4ZV9leGVjX3F1ZXVlIHByaW9yaXRpZXMgcHJvdmlkZWQgYnkg
dXNlcnNwYWNlDQo+ID4gYXBwbGljYXRpb24uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU3R1
YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmggfCAyNA0KPiA+ICsrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVf
dHlwZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0K
PiA+IGluZGV4IDM3OTFmZWQzNGZmYS4uYWVmZWJmYzY5OTZlIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZV90eXBlcy5oDQo+ID4gQEAgLTIyLDYgKzIyLDMwIEBA
IHN0cnVjdCB4ZV9ndWNfZXhlY19xdWV1ZTsNCj4gPiDCoHN0cnVjdCB4ZV9od19lbmdpbmU7DQo+
ID4gwqBzdHJ1Y3QgeGVfdm07DQo+ID4gwqANCj4gPiArLyoqDQo+ID4gKyAqIGVudW0geGVfZXhl
Y19xdWV1ZV9wcmlvcml0eSAtIEV4ZWMgUXVldWUgcHJpb3JpdHkgdmFsdWVzDQo+ID4gKyAqDQo+
ID4gKyAqIFhlS01EIHVzZXMgR3VDIGFzIHRoZSBwcmltYXJ5IHN1Ym1pc3Npb24gdmVoaWNsZSB0
byBIVy4NCj4gPiArICogR3VDIGhhcyA0IHByaW9yaXR5IGxldmVscyB0aGF0IHJvdWdobHkgbWFw
IHRvIHRoZSA0IGxldmVscw0KPiA+ICsgKiBzaG93biBoZXJlIGJ1dCBpbiByZXZlcnNlIG9yZGVy
LiBHdUMgc2NoZWR1bGVyIHVzZXMgdGltZQ0KPiA+ICsgKiBzbGljaW5nIHRvIGRldGVybWluZSBo
b3cgbG9uZyBhIHF1ZXVlIHNob3VsZCByZW1haW4gb24gdGhlDQo+ID4gKyAqIGNvbW1hbmQgc3Ry
ZWFtZXIgYmVmb3JlIGlzc3VpbmcgYSBwcmVlbXB0aW9uIHJlcXVlc3QgdG8NCj4gPiArICogYWxs
b3cgZXhlY3V0aW9uIG9mIGFub3RoZXIgcXVldWUuDQo+ID4gKyAqDQo+ID4gKyAqIFRoZSBmb2xs
b3dpbmcgcnVsZXMgc2hvdWxkIGJlIGNvbnNpZGVyZWQgYnkgYXBwbGljYXRpb25zDQo+ID4gKyAq
IGVtcGxveWluZyB0aGVzZSBxdWV1ZSBwcmlvcml0aWVzOg0KPiANCj4gSSBkb27igJl0IHRoaW5r
IHRoaXMgaXMgY29ycmVjdCwgYnV0IERhbmllbGUgb3Igc29tZW9uZSBvbiB0aGUgR3VDIHRlYW0N
Cj4gY2FuIGNvcnJlY3QgbWUgaWYgSeKAmW0gd3JvbmcuDQo+IA0KPiBNeSB1bmRlcnN0YW5kaW5n
IGlzOg0KPiANCj4gLSBRdWV1ZXMgYXQgdGhlIHNhbWUgcHJpb3JpdHkgYXJlIHRpbWVzbGljZWQu
IFRoZSB0aW1lc2xpY2UgcXVhbnR1bQ0KPiBjb250cm9scyBob3cgbG9uZyBlYWNoIHF1ZXVlIGdl
dHMgdG8gcnVuIGJlZm9yZSBhIHByZWVtcHQgaXMNCj4gYXR0ZW1wdGVkLg0KPiANCj4gLSBRdWV1
ZXMgd2l0aCBhIGhpZ2hlciBwcmlvcml0eSB0aGFuIHRoZSBvbmUgY3VycmVudGx5IHJ1bm5pbmcN
Cj4gaW1tZWRpYXRlbHkgcHJlZW1wdCB0aGUgbG93ZXIgcHJpb3JpdHkgb25lcy4gVGhlIHByZWVt
cHRpb24gcXVhbnR1bQ0KPiBjb250cm9scyBob3cgbG9uZyB3ZSB3YWl0IGJlZm9yZSB0aGUgbG93
ZXIgcHJpb3JpdHkgcXVldWUgaXMgcmVzZXQgaWYNCj4gaXQgZG9lc27igJl0IHJlc3BvbmQgdG8g
YSBwcmVlbXB0Lg0KPiANCj4gLSBJZiBhIHF1ZXVlIGlzIHJ1bm5pbmcgYXQgYSBoaWdoZXIgcHJp
b3JpdHksIHRob3NlIHdpdGggbG93ZXINCj4gcHJpb3JpdHkNCj4gbmV2ZXIgZ2V0IHNjaGVkdWxl
ZC4NCj4gDQo+IFRoaXMgaXMgd2h5IHNldHRpbmcgSElHSCBpcyBkYW5nZXJvdXMg4oCUIGl0IGNh
biBjb21wbGV0ZWx5IHN0YXJ2ZSBvdXQNCj4gb3RoZXIgcXVldWVzLCB3aGljaCBpcyB3aHkgd2Ug
ZG9u4oCZdCBsZXQgdW5wcml2aWxlZ2VkIHVzZXJzcGFjZSBzZXQNCj4gaXQuDQoNClNvIHRoaXMg
aXMgdGhlIG9ic2VydmVkIGJlaGF2aW9yIGFuZCB3aGF0IHdlIGhhZCBiZWVuIHRvbGQgaXMgdGhl
DQppbnRlbnQgZnJvbSB0aGUgYXJjaGl0ZWN0cy4gQnV0IHlvdSdyZSByaWdodCBJIGRvbid0IHNl
ZSBhbnkgZXhwbGljaXQNCmRvY3VtZW50YXRpb24gb24gdGhlIEd1QyBzaWRlIGFib3V0IHRoaXMu
IExldCBtZSBkaWcgYW5kIGdldCBiYWNrIGhlcmUNCmJlZm9yZSB3ZSBtYWtlIGFueSBjaGFuZ2Vz
IGhlcmUuLi4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IE1hdHQNCj4gDQo+ID4gKyAqwqAg
LSBBIEhJR0ggcHJpb3JpdHkgcmVxdWVzdCB3aWxsIHByZWVtcHQgYSBOT1JNQUwgYW5kIExPVw0K
PiA+ICsgKsKgwqDCoCBwcmlvcml0eSByZXF1ZXN0IHdoZW4gc3VibWl0dGVkIGFuZCBiYXNlZCBv
biB0aGUgdGltZQ0KPiA+ICsgKsKgwqDCoCBzbGljZSBxdWFudHVtLg0KPiA+ICsgKsKgIC0gQSBO
T1JNQUwgcHJpb3JpdHkgcmVxdWVzdCB3aWxsIHByZWVtcHQgYSBMT1cgcHJpb3JpdHkNCj4gPiAr
ICrCoMKgwqAgcmVxdWVzdCB3aGVuIHN1Ym1pdHRlZCBhbmQgYmFzZWQgb24gdGhhdCB0aW1lIHNs
aWNlDQo+ID4gKyAqwqDCoMKgIHF1YW50dW0gYnV0IHdpbGwgbm90IHByZWVtcHQgYSBISUdIIHBy
aW9yaXR5IHJlcXVlc3QNCj4gPiArICrCoMKgwqAgdW50aWwgdGhhdCB0aW1lIHNsaWNlIHF1YW50
dW0gaGFzIGJlZW4gcmVhY2hlZC4NCj4gPiArICrCoCAtIEEgTE9XIHByaW9yaXR5IHJlcXVlc3Qg
d2lsbCBuZXZlciBwcmVlbXB0IGVpdGhlciBhDQo+ID4gKyAqwqDCoMKgIE1FRElVTSBvciBISUdI
IHByaW9yaXR5IGNvbnRleHQuDQo+ID4gKyAqwqAgLSBDdXJyZW50bHkgS0VSTkVMIGxldmVsIHBy
aW9yaXR5IGlzIHJlc2VydmVkLCBhcyB0aGUgbmFtZQ0KPiA+ICsgKsKgwqDCoCBzdWdnZXN0cywg
Zm9yIGtlcm5lbC1zdWJtaXR0ZWQgcXVldWVzIG9ubHkuDQo+ID4gKyAqLw0KPiA+IMKgZW51bSB4
ZV9leGVjX3F1ZXVlX3ByaW9yaXR5IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgWEVfRVhFQ19RVUVV
RV9QUklPUklUWV9VTlNFVCA9IC0yLCAvKiBGb3IgZXhlY2xpc3QgdXNhZ2UNCj4gPiBvbmx5ICov
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoFhFX0VYRUNfUVVFVUVfUFJJT1JJVFlfTE9XID0gMCwNCj4g
PiAtLSANCj4gPiAyLjM0LjENCj4gPiANCg0K
