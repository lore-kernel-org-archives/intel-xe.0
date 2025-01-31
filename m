Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73D9C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 18:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB7810E41B;
	Fri, 31 Jan 2025 18:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjrB6/T2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8573510E41B
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738348917; x=1769884917;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cBTpuhdVXc5kGk5cQT/lzCRNijgZBkGqTkOoMsl5VHI=;
 b=KjrB6/T25GktjRaYGdE7c9x9dwm8FIKIWYBsa6t1ZStXriV+6RLsRfo/
 Eh5YU3crH+oTJY+Pbsrq3JLH2sHToxJ93NRaRTF6nuCamRJgvVnOXm6wE
 +uiH3TE2YhF4Q99rfNgB8qcskMXtJFIXJ0ZRYRQq2Bnf5dXceplO48v4Q
 4g0eDSmamhV1Pp+d0qoEQRtNShIzO9e1hiZAhmSJGash+IwdBSD42epyp
 RUrSAY5MKvqa/+Y7n0fQa5TTCsohUlb10uu6lMJ6zqSuoW7j2IyH5u43I
 tJXB0RdIKklG8jx0c18LEwaJ01C+GOO7jROpvo72zbPUKxBaKp986YoA4 w==;
X-CSE-ConnectionGUID: Vl/AkXnlQ6inyY7STiuvJQ==
X-CSE-MsgGUID: GmWc5/11S7m3ptiuJN8VQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="26530583"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="26530583"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 10:41:55 -0800
X-CSE-ConnectionGUID: jT9VRyd2Qqe5/Uv/3DPoMA==
X-CSE-MsgGUID: KvHok1tvT0auUxA/vg+Zyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="114699184"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 10:41:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 10:41:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 10:41:54 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 10:41:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuspJFWpkekkTgEsTB2hpAQHAPm3aHEO5/gM9Mfy+73PE6+vH/7okUo0O59E/Llpat75bq6ZoZ2zge+1gLbUJpV56ihOUaIRT2nfr9yn6SC2mRRBihxszviSiNM9MdC05K0IKvdhKMHqJKsQnWkzPSVjIx9TNGtZY5Q/1T3z6EcvmAzJt4GkSufCyN+hn18dBY8HAga/b0+56LRxEE/7m2YJSsg708YjCpj62V/ZcQgisKxjAv1zmQtdgP9UheOzgwH5GY3aLLa6NQeb1aT+al3ROpJVtjdtsdMmOubAY6tNVhQ0TDCi8MTNofYiQUK6evlqZcpwHlwbLn/PJsPe/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBTpuhdVXc5kGk5cQT/lzCRNijgZBkGqTkOoMsl5VHI=;
 b=EMEcOJRk0uvwzIF3Vy+XK/OnKgXMAfh0ys2Ms8fIta4+7le79jaANRV/xuasR8rlzThy/MgZvQKmVXIAiCNk5E2zpQusW+G4kTDjbwIu52Jul+s7dwvOnGS/i+Qm10dKdXp+L8tZpGemT42hlTajhB3myGmz39rAlcoZS7VJ+wwEdnPTEtE9NTGqzxUygfvPnLygahz6CHBfqP0WUWHeBVV+7T62YRU/PzjGPJnXeXeiHBm5ZTZNOtpTXB0Ev2Juzth7bvGQJFmS7OcKgVqpABaWK3rILHAVKNXYf/6NGUZwqs/yCF75MWCW2xW02sShiaCJt/cqJe0Hntni76LHiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4868.namprd11.prod.outlook.com (2603:10b6:303:90::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.23; Fri, 31 Jan 2025 18:41:47 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 18:41:47 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Harrison, John C" <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Add node to dump guc log to dmesg
Thread-Topic: [PATCH] drm/xe/debugfs: Add node to dump guc log to dmesg
Thread-Index: AQHbdAQWInv/pgw4v0iqMuWtpcbpsLMxN4QA
Date: Fri, 31 Jan 2025 18:41:47 +0000
Message-ID: <5d9b7405a997b209125f27b16c29c2cb07f5070c.camel@intel.com>
References: <20250131171716.3998432-1-lucas.demarchi@intel.com>
In-Reply-To: <20250131171716.3998432-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4868:EE_
x-ms-office365-filtering-correlation-id: 3f5c7339-477a-4f36-dc0b-08dd4226eabd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aDNtSXp1cDIzeFcxUXFncUU1QmppSkVDQkI4b3R2S2U3cHR1c2RwV1ZSMzZm?=
 =?utf-8?B?Uzd4NmNhcExOVVFSOC9Bd2N0NlZKWFBIaFFiR01FU01oQ2huNXJKcG1tSlh1?=
 =?utf-8?B?Y2JRay80MDFpTGYra1c3NWZGMmZIaS9ONmJwU3JxYkNtVFFFblhDK1liY0Ez?=
 =?utf-8?B?ZVd3czZJbFowNDdoby9MNWcveUo0QWpvRkE5Q2FSemlqcXA4azZmMTg4WFZD?=
 =?utf-8?B?aVZMWVV2VUxQelVzODd5L1FuMkJ1U0Vvd0xHR3BNZUQwV0c1RkVCVXpaZTdx?=
 =?utf-8?B?V24rTWtaM0JoREJCeCszZTZDZDFicDRNK1UyWks0RTBCeTNHMzlaRzhveCty?=
 =?utf-8?B?Vm1NZm1WR1k0dHFqU2VwYUd1MERHVFU5WTdxTjdKaUxvdlZWaWcvT2M4NXla?=
 =?utf-8?B?cmtCbmhZMHk1SFh5K1lwcFBpWFRYN3M5RHVnVmNtSDFmK29FbElsTHd0NURq?=
 =?utf-8?B?RGdVdFF1b2hrNG5ML3hNVWNTaWlWcVVOT2tRdURuK0ZxemdJQU5WOUtibzln?=
 =?utf-8?B?YzFTbkIzRDBjeU82VldXcjJJWjdHSFB3eGZMZXVlbGRINDRjeDBrU2svbWFP?=
 =?utf-8?B?YlpJbWFXUGV1blpyMWtYaXZ1QlkzN0U2b2dNdDhNemNYcHF1Szl6bWVkS2xV?=
 =?utf-8?B?b0NRcGFxVUUzLzhqRnFMTlkzbFNmS3RQYzVoZVJZZGdlRzlOQ0hTNE5aODFD?=
 =?utf-8?B?Sys5eldjUGJISlZZMkhSRUt6aW9rODRhODM2R0xMaEdLdm1iRXIvSXdhNmht?=
 =?utf-8?B?TkpXTjZGQzk1WWQ2QXVUWnNCU01jS0srRWxNOGh0V0hyT3lGVW95c3BzbTNX?=
 =?utf-8?B?S3BscFNjWVdRUHRHOE5qd29Sck0zNTFGTmRuS3gybVp3SW42MUVnY2pEc0dj?=
 =?utf-8?B?V2xya0ZNWG82NWJIWS9iVDNLNEdGVDMxd0tiV1J2ejJYVzdDVjAyMUFCY0VV?=
 =?utf-8?B?cGdjTTdWZ2FiK1g2WWYwTkxaeUFCRzYvcDN1SjJvYlg4VXFxU3kxbk1HRHEz?=
 =?utf-8?B?OVBkVlR6Vmo3SVltcXErdGN0L0p4NnNZbmV2WkhUMkhzSG5QUW45c0p2K01K?=
 =?utf-8?B?ZDMxdk9Ga1ZCSUljNWNQbHcvRVZhekNJMmFoMkpBUmdyd2JyNSsxcVpxU0xL?=
 =?utf-8?B?QlBDZXJwTmF0MUY2SlFQeTlwNHNlNnI1bDAxU1FyVDFpNHd6VXM0M2dtcDM4?=
 =?utf-8?B?MERtdndWbmFuRS9aNnhPMW9mZjh3MmF1K2V5OFJUdkwrNDc5Q1ZQbEhNcUt2?=
 =?utf-8?B?Si91YzBLWFpicnFoK0w4ZFRQK0d5d1gwcTNieVRPbzFJZ1B6SVVnSXJIRHRy?=
 =?utf-8?B?QUc0ZWIzeTNJN1dlTVZkSjFSNzQ2WjNGamtqU1I0WXBBa3Ard2N5WUllU2kx?=
 =?utf-8?B?YUFhOXkrVnhjUG5DR1ZXMDMxQkg0dzVxZDZGUlAxM2x1SDV6eEhMTXFQN1Fr?=
 =?utf-8?B?eWJWYkVBaHJOOHhTVHRhaXNwZjdyays0TXJkNi9maFlkVnc2T0NuenhxbmpI?=
 =?utf-8?B?S3dKM0YxbERwZFNjT0tRTEs3Q1k2dElOR1NLNjF3U1Nwbmh2ZVFaNFFaL3pn?=
 =?utf-8?B?QmZIeFVmN3g5di8ybGRRQUNXbFhXZXRtSWxvYjV1dVNmaDZmY3dOWW1DeDNI?=
 =?utf-8?B?VGcwcVpUQ05TY0ZFZlFneG5CUmN2VTV0MVQ5VXEwRkQrR1NReDhjWVo0aG1Z?=
 =?utf-8?B?eC9yTUFSelloSmx3Q3ZHaVNTRERyR2g5S0QrQU5GUXFIRkR6dlJPZ0pCN0RJ?=
 =?utf-8?B?SjhLMUs1WnM3dTVXdnlJcVVSM3dMNnZqMnUwSHJmYzA0UjIwM3BOTVBWeDFP?=
 =?utf-8?B?dCtqUFNZaTVYR0xOV0xGczNHbXh3a3hneVVseEllaUh5QURIMy9vbXVTWGM0?=
 =?utf-8?B?UWxmaHVWd3hmNE9oQUZHUHIzL204SEJHY0t3MGFCdlZFWkJQTjdTZnB3UllQ?=
 =?utf-8?Q?G5GX/gjq7dAZ1Yqqm+N1xpA/ts13fU3k?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1BjeEZvTmJMRzBuSEQ4MU1waDROOHdIbmVNa3hBNHIrNURaS3ZYQVRoNU4r?=
 =?utf-8?B?blllOEhUaTBtN280dmRWZmdvSVVPVEQ1ZjREY2RDdnR1Q0YrWWIrNUtWWExS?=
 =?utf-8?B?SnNXS2JhSzJCR1ZwZzN6QW5WNWFZK2gwM08yUnhiNVVtZlMyVnFRaEd2YjJu?=
 =?utf-8?B?ZUV6RFpBZFdMTkhWbG45WDFNRUI1VHhMRDZDTWdhM3A2MVR1M1FrR083d0VZ?=
 =?utf-8?B?UlUrWHdqU2pRN0k3cnFuZTFFNmFPb2hIcUJYUUpJSXVaRFYxV2hKV0xaTmZs?=
 =?utf-8?B?d0ZPL0Y2bW5pd3p0MEJpeUsweG9oY1pUamgvTHNKR1RSeThYYmFYTE43VUky?=
 =?utf-8?B?K0FnVlhWT1FSQXNzY3ZKb09DUjd0S1BCUjZzTjdDMTVadGhFcDdRUWpVcHEx?=
 =?utf-8?B?cWdZbDlCcUZOWkJ4V3dxbXpRdEJZblpKd3kwYVZqTTdXbkVlKzZSdlRHS25s?=
 =?utf-8?B?QmVDa2hUbnA5OXYzKzZzWFFCNmlDMzA4cmE5YkJ1QVYycFdsRFJucXBtakNX?=
 =?utf-8?B?dmVzdEVjSHFLV3dLSDR4M0NXNkltaGJVSmI0NEZIbGl6ZjNuQ3pHaWRyMExw?=
 =?utf-8?B?UGdrUzRTdUxYaHdSYnQrRWZTTDJvbTV3S3MwdThkdDRKTnJMVVFsbWRPaGdG?=
 =?utf-8?B?VTRrU3FjTHZ4YzJYOUU0UkhzVTkvR1g4VVV6RGkyaXJKaU9NTFAraEFETGpD?=
 =?utf-8?B?OUdWNm1yaVdsWk9pUlhpbnF6Y0ZmcXdpTnZObGxYajlGcUZ2eWw4cXZ0ZEQv?=
 =?utf-8?B?N2FvYkpuTkJnWXFtcEl1Znh4SGRqRkpJUnhBSWxSNlY2SFdvaU5kTjFja3Yw?=
 =?utf-8?B?SVBVTjVxaW5PZEZGd1VFYXdkU3JqQldReVg3ZFFYemtBR3JZOFhRMkY1amhF?=
 =?utf-8?B?NUh5TVpGOGtQQUthbHhSWWp5b3NybnJaOG1EblA0K2Z0Q0N5cG1vcXNZVlNS?=
 =?utf-8?B?K09XeHVkdVNldXRGWmMvTVJlTkZvSGFDK0xSSG0xaVZQT050VWFQSis1OG9j?=
 =?utf-8?B?cS9ENEJtdXFDVUdIaTNxdktrM1RmSjlUWHVBc3dtR1d2QVNHeExTcmtQNFdF?=
 =?utf-8?B?L0ttYUs5Sk5hWEdCM3BWOGpSZWZ5N0VCd01DQ2x6WlJldDEydnc5Rmw1dm5X?=
 =?utf-8?B?Skl3RTZ5V0lEd2RrcUpyaGR1TEd3VEZIYk1wd2psNWllZXgxdU9rV2xZSkNK?=
 =?utf-8?B?RStJelNwaFV5MnR0ZEI5cXVvY2tUNGZPTHNoMERkOFVaVjh5KzUxazV0SGdX?=
 =?utf-8?B?UjZqV1pDQVpCa285d2MwR1R5dUdFQ3RzUmhvYzQ2bm5OWHE0b215OGJTdjFu?=
 =?utf-8?B?MXlNTi9vNVZzWTRGaXhEQVdubW1PVHRmVEdVOUxRNnRma3p1WVdmQ0Fqdk1y?=
 =?utf-8?B?WXJmRlRkWVVnNFFjaVZvTFZGblJJdTJEY2ptNnV6VWwxYnZhZHI4d2IxcStQ?=
 =?utf-8?B?Q2h1ZEQxeDRxczJIaG1TNUdkeTFKMS9nWFZqUFQ5R2FxOUdlYXNkYUFnZ1gr?=
 =?utf-8?B?eVN2dC9YbkNJaHFnMStCczhVdmJOZjBRa0FhaFF5dllkQ3l6QXFXN2g5ekkz?=
 =?utf-8?B?YS80L2JSbld2R082bENRSFpZK0ZxRU9qZlBiN2w0NXE0b2paRGM2L2RNMzY4?=
 =?utf-8?B?STJsTVB3UXVLNGlvU2lTK1FkejZCcUxtTHhibnJHSHowTDN2T3N1SU5ORS9M?=
 =?utf-8?B?TW5adHpKUkVqNmNheWJKbUVnNk9lUkx6ZVNubWczTFhQcVVtb2k4WGQ0U09T?=
 =?utf-8?B?clFpakZYb2k2dzgvcC9lS1RGQ05BWjhBaWFKRFhHMFVyU2pzMFRxTzg5a3Vr?=
 =?utf-8?B?M2hZalFnSnJHWjR3WE9lWmVPRWd4bFF2akRyd21USjFrQzVCU3JTNGpaeHBy?=
 =?utf-8?B?STZSTmRiOWZwb092aS9kMGZhTTY3UEQxVk9oRFdzYW5WNjFJWkVwVHlEdldj?=
 =?utf-8?B?L20wc2dFUEo4cVZCblBwMUNVbGtZZ0hGTG91VC9yT2t3Z25XYXJvQ1h4amN1?=
 =?utf-8?B?akhGRk13TXNNWmZKOUN3ZWlWRXBpZ2s2eXJTdzRSYjd0elU4SW1VaEhEZjh3?=
 =?utf-8?B?Rk95SllwU3UzcEtFY29OM016Q2MxVVZIYkozVUlUeUt3QXh1VzcvZ2pEQnZ6?=
 =?utf-8?B?UXp1WENMRTFVTTN1VllrOEhYejFidHBhaER0eGhOd0xmelZiUkdxTmJNWSt4?=
 =?utf-8?Q?bEmVv/h64MdnYc4kItnWk4Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E95CB31C80C5F8448723EA5A9C08FBBB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5c7339-477a-4f36-dc0b-08dd4226eabd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 18:41:47.0357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YuBDSz5lApp6MUA7dC2eAuQBhZK2vrCYuNhYrqdCD511UxIBF9gWhEunXWaH5pk+ehH+S4oxicmR0WzfJ6zr6RvlXe46k5fUB7XHVvvFJlImsWESGdS8ANseWE0mMP/X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4868
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

UmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwu
Y29tPg0KDQpPbiBGcmksIDIwMjUtMDEtMzEgYXQgMDk6MTcgLTA4MDAsIEx1Y2FzIERlIE1hcmNo
aSB3cm90ZToNCj4gQ3VycmVudGx5IHhlX2d1Y19sb2dfcHJpbnRfZG1lc2coKSBpcyB1bnVzZWQs
IGFzIGl0J3MgZXhwZWN0ZWQNCj4gZGV2ZWxvcGVycyB0byBhZGQgdGhvc2UgY2FsbHMgd2hlbiBu
ZWVkZWQuIEhvd2V2ZXIgaXQgbWFrZXMgaXQgaGFyZCB0bw0KPiBndWFyYW50ZWUgaXQncyB3b3Jr
aW5nIGFzIG5vdGhpbmcgaXMgdGVzdGluZyBpdC4gQWRkIGEgbm9kZSBpbiBkZWJ1Z2ZzDQo+IHNv
IGl0IGNhbiBiZSB0ZXN0ZWQuIFRoaXMgaXMgcHVyZWx5IGZvciB0ZXN0aW5nIHB1cnBvc2VzIHNp
bmNlIHdpdGggdGhlDQo+IGRldmljZSBwcm9iZWQgYW5kIHdvcmtpbmcsIHRoZSBndWMgbG9nIGNh
biBiZSBvYnRhaW5lZCBieSB0aGUgcmVndWxhcg0KPiBkZWJ1Z2ZzIGZpbGUuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4g
LS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19kZWJ1Z2ZzLmMgfCAxMyArKysrKysr
KysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfZGVidWdmcy5jDQo+IGluZGV4IDBhZmYxZDQ2MmJjMDEuLmM1NjlmZjQ1
NmU3NDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZGVidWdmcy5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZGVidWdmcy5jDQo+IEBAIC00OCw2
ICs0OCwxOCBAQCBzdGF0aWMgaW50IGd1Y19sb2coc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpk
YXRhKQ0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+IMKgfQ0KPiDCoA0KPiArc3RhdGlj
IGludCBndWNfbG9nX2RtZXNnKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkNCj4gK3sN
Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d1YyAqZ3VjID0gbm9kZV90b19ndWMobS0+cHJp
dmF0ZSk7DQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gZ3VjX3RvX3hl
KGd1Yyk7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgeGVfcG1fcnVudGltZV9nZXQoeGUpOw0KPiAr
wqDCoMKgwqDCoMKgwqB4ZV9ndWNfbG9nX3ByaW50X2RtZXNnKCZndWMtPmxvZyk7DQo+ICvCoMKg
wqDCoMKgwqDCoHhlX3BtX3J1bnRpbWVfcHV0KHhlKTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gMDsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyBpbnQgZ3VjX2N0YihzdHJ1Y3Qgc2VxX2Zp
bGUgKm0sIHZvaWQgKmRhdGEpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d1
YyAqZ3VjID0gbm9kZV90b19ndWMobS0+cHJpdmF0ZSk7DQo+IEBAIC03Nyw2ICs4OSw3IEBAIHN0
YXRpYyBpbnQgZ3VjX3BjKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkNCj4gwqBzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9pbmZvX2xpc3QgZGVidWdmc19saXN0W10gPSB7DQo+IMKgwqDC
oMKgwqDCoMKgwqB7Imd1Y19pbmZvIiwgZ3VjX2luZm8sIDB9LA0KPiDCoMKgwqDCoMKgwqDCoMKg
eyJndWNfbG9nIiwgZ3VjX2xvZywgMH0sDQo+ICvCoMKgwqDCoMKgwqDCoHsiZ3VjX2xvZ19kbWVz
ZyIsIGd1Y19sb2dfZG1lc2csIDB9LA0KPiDCoMKgwqDCoMKgwqDCoMKgeyJndWNfY3RiIiwgZ3Vj
X2N0YiwgMH0sDQo+IMKgwqDCoMKgwqDCoMKgwqB7Imd1Y19wYyIsIGd1Y19wYywgMH0sDQo+IMKg
fTsNCg0K
