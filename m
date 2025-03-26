Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5053DC3600D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 06:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EAE10E657;
	Wed, 26 Mar 2025 06:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPYEy6Qf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2F710E655
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 06:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742969761; x=1774505761;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ri48kIxmEzL7pFxjQnOnIYziBQ9o6FyrKw8w1CvDmes=;
 b=KPYEy6Qff/2XCViSoySK4QfrMRAmY8etbQLixK3YQCxjGsweUSeFZ7hT
 /2LZvw8CkRcxzwOk8DdslC9YQ9AEz1yKG3GAy2sYpOs1uoeW8GsCX54lp
 T6LXCbonYqxJtyfCdAHMji4Axhu2tUvtIn8wBLJaDwpCQ7t59KS/vN4DS
 D+/ewA6txfdHHC4PkkuR4gWBClcJBGEwtXiXoyvOvn6Qmob8nRcxOczbN
 Bu8oQWg7R2n9QPpocHsanNq+1SLHDlCftpu0e+ORDeeCZ0K7+2SaBScH+
 OFE5S5gIFvDV8bj+khvEa9VcOyeml3a3W3k5Yiaxe5RG3FXxJrfZg2GOD A==;
X-CSE-ConnectionGUID: AQZA6LvtTq6zkxhXUam0cw==
X-CSE-MsgGUID: A+0slryKRBqpaw7qWby4TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43395824"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="43395824"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 23:15:58 -0700
X-CSE-ConnectionGUID: M4T+fdR6RO6es0vth2xSXQ==
X-CSE-MsgGUID: Y/A6wvAuS7y/u0BNV2IBPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="155554408"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 23:15:58 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Mar 2025 23:15:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 23:15:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 23:15:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+KIqFP7gxdkJ77FwA0KlmkV4/xbHcNY9nNsW7RoOBjwc4/ExEJ4Gpvm/VWjhF/9DPSPiVCWw6sEXzoWhMDc3hYJ+EPg1XGoH1brDaZk7c9atxc+/QSuZhXy/rwGI7Bi2wlobfotOULicb8g8toQRJhPPYEN2Px6zUEad9pHUwk4QlMGPJEfP5vpVSFFIwTln95lwjmI8/y2TGHD1m9We/aFnskXUZbYCfWCEmmrXbZ+6r7JUws9dp2HIx8I5+CaL1X9KVocqCpUh64OIW5GcPWM4Yvggrb3q7O9JsD53p6gvsmU9EhkcnByILl8Ob7bmY3pENYjfVW80LO5yeNvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri48kIxmEzL7pFxjQnOnIYziBQ9o6FyrKw8w1CvDmes=;
 b=uobHMEb+cCZdqbuJfkwO6I0vJFIhxyKzqoyWv7g9edu2EskizDmiVLaAFqjsJOpi3KjdaGjH7rndCBzLQixUbGOjPWKnPWyN4Yosm4gIdYErvj+2pn+jD68jY9fMoIMJ85qXe+a97CFVz9F3QjbXn7mqJrxRl9FpiaMXEKqqHpV6LhKRPIBYLv0vw17IL6kMedOnk47Uot11KgCfhdrEISgW4MaOeIZEqxGceZ2aQQMMXv9B+hLA3xXlJPavQAZcd0VouR4jIDWg6eT6P7W0Ocii+NSqc2YEq+5fhKeZ6nYeaoVwNDnWv1pW2iZbf5jwkHuWrmDXckpsufs8OKUxWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CYYPR11MB8431.namprd11.prod.outlook.com (2603:10b6:930:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 06:15:13 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 06:15:13 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v3 5/8] drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE
Thread-Topic: [PATCH v3 5/8] drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE
Thread-Index: AQHbj47l4XFohz0zFEyrGHMKHFxYRrOFDJ7g
Date: Wed, 26 Mar 2025 06:15:12 +0000
Message-ID: <LV3PR11MB86957A4ED4A4134F55A2B00CF9A62@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250307182856.304850-10-matthew.auld@intel.com>
 <20250307182856.304850-15-matthew.auld@intel.com>
In-Reply-To: <20250307182856.304850-15-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CYYPR11MB8431:EE_
x-ms-office365-filtering-correlation-id: d7152338-956c-40fb-c577-08dd6c2d91b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?N2k0dkptR1NhMGdTTHpDYlo0ZTlYc3RVcm1UTHhlTXZONTVpNWtQeVZvWkZy?=
 =?utf-8?B?aWd1NjdiaEFHaVpQZzNMUE9ySjhEcTZ1MENVSHB5Zk55NHpySTZaYlJrc1A3?=
 =?utf-8?B?N1dxYk43cDloa1RHYTVVYnVFMzg4QThJa3JqakQ5Z1ZJdnEwTmJITXo5VWFJ?=
 =?utf-8?B?bjN4WDMxdDFrTEJRcE96ZG1iR3FaMHVxZVIyMlFRMDNEZUc2bk9aNXl1MHBX?=
 =?utf-8?B?V1N2Uk8zLzBvQml0ak1MWW9XR2VsK0RVLzg2d3BsVkJwWUt6d3B0MXNlSi9V?=
 =?utf-8?B?cmthbzZKb0VpR2krY0JtWE1xNXM1TzFuRWNpYUl4a2o2dUo4dEFnVlFQRHNF?=
 =?utf-8?B?UzZlcnNYN05KZzUzQlIwUEN4dUVMc1JuUUNOTmEreG5aMzFsMU1PMkIyWEJZ?=
 =?utf-8?B?NUVpcmJhWnVIM2lLNVAyT0N6ZFBWMUg5QmNtU01jTktqcnBxY1N0a25jbUpz?=
 =?utf-8?B?eEZFSkV6NFBwNVhZdXlzeHc0UkhJd1pXOHo4YW01SDVPUXhyV3ZWU1pHUzlX?=
 =?utf-8?B?TDIyaUJ1ZEZ6ZXBiL0NwQzRKL0REZllOT2VVd0duMWVsK09KN3VUa29JNk9p?=
 =?utf-8?B?dWxuSzNHUHhERFpRc2l1Z3N6QjFJSng5aDVuUFBQZnVvVjZUS2xVL1lZL0d1?=
 =?utf-8?B?V0VjNENqWGVSYm4zZWd2RWdyeXI5ZDFRTmVEQkVLRUpvUW91T1o1eGRmVStw?=
 =?utf-8?B?WFJOU2dIUFJOLzd4anhRSTdjeFZqSHk0QVp6Y0gxTzFKS3JjS1pINGYwM1VB?=
 =?utf-8?B?Y1AwbFYvWVZmWUdyNmIwOGJYUXRxRHgxZ01pckRyZDMzYjZ0VnlKbXUwbmV6?=
 =?utf-8?B?TWxBVGZ1U3NWNWdwUFVKM1J1L3NmMXlPZEk5em85MzJmWlZyNENybi9xV1Jr?=
 =?utf-8?B?eGVrNHBsRVF6YnhXUUJ1UkZnOUFNYkoxSTJSOFhMa0swRDB2eURyTFNSNEdB?=
 =?utf-8?B?aDBSdWdoUG0xRmlKb2UxSkdVbEpPUTVZMHFHK0llK0F3UlJleWphVENqMENF?=
 =?utf-8?B?a3pHelhaTTFBWnFtTEovSm1uRlNBS25NNTM1amFCTzNnWkRDd3pvSU15WGEz?=
 =?utf-8?B?b1pkaDRXdkhsWDBqazhRY0RXRy9ibko3ek1BemlTVFZxUEl1a3pWRk5ZM1dx?=
 =?utf-8?B?ZjNYWjN5VHcvcXk5RE1oYjQ2UTNiOWVRbUlBUm1XYXJtM09xKzZQbyswdkVj?=
 =?utf-8?B?Zi91cENGME1aZVdEd3p2MURPbm9MbG5ZNi9QZTR2NkxrMUI5L1pjMmsrbzhp?=
 =?utf-8?B?RUlKZUlpTExkQXpwekNlVmF5bTFZaWNUcStNeEpYaXBUWTF2c2ZCSm1PcDJx?=
 =?utf-8?B?MWVBNmltMWVKa0RHNjFWSml3UzA0ODNiN1Jrak5BbUVtYXdEYk9sQStvaUE1?=
 =?utf-8?B?M2VRaHpzRnkzMm1YR0tLWkkzYnFJNmNzenA2aS80aWozU3JjeTYzRlNoVkFD?=
 =?utf-8?B?UUdabDBhRk1BVmRpWEQ2ajlkKzFIR2xIRmgxd2RSRnZBWDk5dkZzZGEzZ3dS?=
 =?utf-8?B?b0YyelZXUERSWXd3WGk4ZlY3bnlLNmRQNmJRYXNrQ0NZTFk2eTRZWHVJYmNV?=
 =?utf-8?B?eVpEbUxYU3REaU5mT3dJRndEMStNdHBTUlNaT3lyQ1JHT0RRQndWMFh0YnFy?=
 =?utf-8?B?YmhrTllsQ2VxaWdCb1A1TzNOMHNseDZlcG1YSXR3Q0M0N0F2amJnZy9SSDdN?=
 =?utf-8?B?d2E4WVhqb1dLUk5heWU5clJZYlhKOVFwT2p0ODRqSWtSYkYxRTVaQ0VYdlBS?=
 =?utf-8?B?OXpFSHJPQ1FWVFphQ2V4QXJIa2haNERyUE9OUnVaSVRISHdndXFKSjkvTHpx?=
 =?utf-8?B?WEV5a3lYalQwV1U3V0lhbndoVm15TTM0NTVDRXRsdEJRdW9kQnkyU3cwN0ov?=
 =?utf-8?B?MzBCMGFUQW9uYnFsZ0NGcGp6MmFlQ2MyK2UrcVNUaUtrK3Z0RFU4ZVJpaEdz?=
 =?utf-8?B?cEVlaDZPc3E5OXhrLytBSzdsU0c0enFKcGJHOGpuREJHb0F1cFp5MzJCb05L?=
 =?utf-8?Q?Wb35Zl44px0YkMDfKyr6iVJhbmakX4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aC8wQXBjUlJQanFHWVpNUFRZUE52bTRjYkNrczRFa3BVaVZKTnhYT2ZHNGl4?=
 =?utf-8?B?UFFyS21BNkhLTUhVdVdOc3VDdEk0T2ZZR3VKaDVpSE9CRGtuYVg3VmlpcFdJ?=
 =?utf-8?B?Nkh3bzRVMHprRVZlU1VrMkwwQkJmTHJEc3VXM1Bxc04xM0JoQzhuT01JZHNH?=
 =?utf-8?B?N0ZGdk1nUXZYMzRLUkdoL1hsR0ZnOC9mbVBTMitRM21WRnJCUmQyNXp5SGpR?=
 =?utf-8?B?SlIvL05jNWQ2VnJ2bEdGdmx0VXRlaVYrQmRzNFZYa3dHRi91a2VweGh2Nmpn?=
 =?utf-8?B?WE9GNC93ckRXNUNYaGVuMm9CRXVEVlJUb2lHbWJ4cmsyZUgvRk5VbmdSNS8y?=
 =?utf-8?B?eWxRUDVlTUN0V2V3TVFQcUhiNHN4ZU1UZHdMQ2J1SWt3TE44L1NUeFNSb3Yx?=
 =?utf-8?B?WWpKTlQzS0R1UE9RbzdPOTRkWXVSLzMzZ091YWZkaFlRbmRNbWpuZDdFdEY0?=
 =?utf-8?B?Nm5LVGdtZThjbWRSbzVOZ2drSE5QR3psUWNTVWNjaWhKNm52SU9LTEtnSDND?=
 =?utf-8?B?QlZXVDAyZ2F5d0pFcmdEb1h5UjNNT2VkUWxIQ2FIYWpURU5sVDRwb05XQ0lI?=
 =?utf-8?B?eTZIaURDbm5peDlNNTB2REpOSzNBL1NDaWQyaGhSVkZyYmZmY0ZidXBEeUJO?=
 =?utf-8?B?TEFjSW5XWTY0OTJjSkh5SmlGTEtXLzJrUU9mNkZhNEpTc1VXczIxczYwWVRw?=
 =?utf-8?B?dXEweGQ1anI5dVlVMm5oRno4cGJDUmtTeTQ1WGRmOWc3dGZjd2Ivckd1b3Yr?=
 =?utf-8?B?TXE3SEFZT2o2ZWdzbTZoVmNNRVU0SU40WWlPVjBNWXI5eVk0a1BxOVJXN0Fh?=
 =?utf-8?B?eFllYitkWStzU0hoZ0kyanNFVm13L05vcFl4NFJkVEVMbFNwUDkxNCtlMkRa?=
 =?utf-8?B?empLTGl2WXB4eDYxdjV4dTZaN01zUUhLbFhGVyttem9kZEUwTkFqQ1NUcm9B?=
 =?utf-8?B?QzhQQnZYZUVSSjl5UDBDdGJTVE05SEVYOURKcmc5UkxQTjVmUW9qV1E4NVVr?=
 =?utf-8?B?eEptU1dxcExtbjNWbENET1BMYmNlOUVEYjduNG9aTnlOU01URDFiT0x4M3l6?=
 =?utf-8?B?ZnUxTThQLzFpWVVpSlQ2Rk91bXlhNThCQWp2M0NzOWpIZUdkTG1MVjREVmlB?=
 =?utf-8?B?LzV1ZmpFVEpFSU03bFdMZlJGWUZKM3BaOC9NZUVhL3lxRDdYM25jdWZhbXdD?=
 =?utf-8?B?TVByRXNFcmdKTm5LT3k5eWU0aThkNzhqY2UyakVtczBQbFN2KzlFSC8vMzRB?=
 =?utf-8?B?eWpodmRlc0FEMEJIbDdHbnQrOGN3RTR3Y01TUUJYOG5XRzRHV080bmxmZU95?=
 =?utf-8?B?NGlucUFuaS94d0RNeTQzZThBUXArQ2ZPSVJuUmhxNWhPVjR5eTFvcTZ4ZHlw?=
 =?utf-8?B?MFBXK1VuZGNiQ0xVU1lCWjliYndOVVBDNlRlUDBzUy9qamJIWUVWRG04dElp?=
 =?utf-8?B?Q29rUFlmb0svbi9lMGF5LzM2Y1Nma1hIdHRvVG41WkJqa3R1bmdsNExjSlJk?=
 =?utf-8?B?dXdteFcxbWd2N0dEanpmWFl6Wnp3akc2akU5SmJZUzJ1aVZnbEtERWpvZ1cv?=
 =?utf-8?B?cklvZnZsWmwyRmcyUmpQQ3FzWE1tTDJ3MXI4REpNUHBBOHdQVGZmZk1XK3Y4?=
 =?utf-8?B?d25XcE9FcGV1cE1YNFNPbEtPOUtWbTNCWVRidi9oV0Qrcm5OOUwvVC92NHlt?=
 =?utf-8?B?bUJPa0QxamdOMlVrUmkwRDlhc2NidGNtT2dzU2ZncjhZZ0hYYTNFTmo4UGFv?=
 =?utf-8?B?NlZaSHBlRWNSZXJhZHRLa3d3eUkrSGRhUWdNakVJVUNjY2Z1N2tObDF2WnhH?=
 =?utf-8?B?OXN3MzlrWjFIWW1NL1NyMzhwS0p2YzV2NDFuK1pGM2E4QnNmc3BtVzF0bUI5?=
 =?utf-8?B?N25vaGd3dE5mSEhBdVo5RDdrb0hSWDhYQW9lK1h4VWtUVSt3N2lkbzlYWE96?=
 =?utf-8?B?N3BJTzhVZzB3L1JoTzZTKy96Y21iU01ucGpCN0NvVWxLTHVHTUFIN1NEbzhP?=
 =?utf-8?B?YkZMVExkQ0NpNTY3SExjWk5WTG5NK3o1VUZLeEh4YzZYVVpnYnhVeTVEdmp4?=
 =?utf-8?B?ZFF5ZWlnOTFYS3dxUE1ybjRaOUtWcEl0YThqc0t3YkdoRDhkSFpyRkpyMjJQ?=
 =?utf-8?B?b0NaSXU0bFg0NFRkOXU0Q0ZSUWEyaEpCbzFqaStjVVU3VmNONnllMWtaTU04?=
 =?utf-8?B?M1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7152338-956c-40fb-c577-08dd6c2d91b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 06:15:12.9979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EPm6CAlDUQAPLjNeyRH9pAdFIEMmG6vYiWcO+iEGqbrwwkAxmRGXhesMTtYLBqr0naFZvJFTPRoHOu4GYtjLvHjLE+TH9e8XTGGXCVljNwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8431
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

PiBGcm9tOiBBdWxkLCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBTZW50OiBG
cmlkYXksIE1hcmNoIDcsIDIwMjUgMTE6NTkgUE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogSyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlhbmFyYXlhbmEuay52
LnBAaW50ZWwuY29tPjsgVGhvbWFzIEhlbGxzdHLDtm0NCj4gPHRob21hcy5oZWxsc3Ryb21AbGlu
dXguaW50ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcNCj4gPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjMgNS84XSBkcm0veGU6IGFkZCBYRV9CT19GTEFHX1BJTk5F
RF9MQVRFX1JFU1RPUkUNCj4gDQo+IFdpdGggdGhlIGlkZWEgb2YgaGF2aW5nIG1vcmUgcGlubmVk
IG9iamVjdHMgdXNpbmcgdGhlIGJsaXR0ZXIgZW5naW5lDQo+IHdoZXJlIHBvc3NpYmxlLCBkdXJp
bmcgc3VzcGVuZC9yZXN1bWUsIG1hcmsgdGhlIHBpbm5lZCBvYmplY3RzIHdoaWNoDQo+IGNhbiBi
ZSBkb25lIGR1cmluZyB0aGUgbGF0ZSBwaGFzZSBvbmNlIHN1Ym1pc3Npb24vbWlncmF0aW9uIGhh
cyBiZWVuDQo+IHNldHVwLiBTdGFydCBvdXQgc2ltcGxlIHdpdGggbHJjIGFuZCBwYWdlLXRhYmxl
cyBmcm9tIHVzZXJzcGFjZS4NCj4gDQo+IHYyOg0KPiAgLSBzL2Vhcmx5X3Jlc3RvcmUvbGF0ZV9y
ZXN0b3JlOyBlYXJseSByZXN0b3JlIHdhcyB3YXkgdG9vIGJvbGQgd2l0aCB0b28NCj4gICAgbWFu
eSBwbGFjZXMgYmVpbmcgaW1wYWN0ZWQgYXQgb25jZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1h
dHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gQ2M6IFNhdHlhbmFyYXlhbmEg
SyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiBDYzogVGhvbWFzIEhlbGxz
dHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBC
cm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2JvLmMgICAgICAgfCAgNCArKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8u
aCAgICAgICB8ICA5ICsrKysrLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvX2V2aWN0
LmMgfCAgNiArKysrLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9scmMuYyAgICAgIHwgMTAg
KysrKysrKy0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMgICAgICAgfCAxMyArKysr
KysrKy0tLS0tDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gaW5kZXggZjIyYjAyNzAwNzc4Li5mZTVhMzg2
ZDVkYzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+IEBAIC0xMTAzLDcgKzExMDMsNyBAQCBpbnQg
eGVfYm9fZXZpY3RfcGlubmVkKHN0cnVjdCB4ZV9ibyAqYm8pDQo+ICAJCWdvdG8gb3V0X3VubG9j
a19ibzsNCj4gIAl9DQo+IA0KPiAtCWlmICh4ZV9ib19pc191c2VyKGJvKSkgew0KPiArCWlmICh4
ZV9ib19pc191c2VyKGJvKSB8fCAoYm8tPmZsYWdzICYNCj4gWEVfQk9fRkxBR19QSU5ORURfTEFU
RV9SRVNUT1JFKSkgew0KPiAgCQlzdHJ1Y3QgeGVfbWlncmF0ZSAqbWlncmF0ZTsNCj4gIAkJc3Ry
dWN0IGRtYV9mZW5jZSAqZmVuY2U7DQo+IA0KPiBAQCAtMTE5OCw3ICsxMTk4LDcgQEAgaW50IHhl
X2JvX3Jlc3RvcmVfcGlubmVkKHN0cnVjdCB4ZV9ibyAqYm8pDQo+ICAJCWdvdG8gb3V0X2JhY2t1
cDsNCj4gIAl9DQo+IA0KPiAtCWlmICh4ZV9ib19pc191c2VyKGJvKSkgew0KPiArCWlmICh4ZV9i
b19pc191c2VyKGJvKSB8fCAoYm8tPmZsYWdzICYNCj4gWEVfQk9fRkxBR19QSU5ORURfTEFURV9S
RVNUT1JFKSkgew0KPiAgCQlzdHJ1Y3QgeGVfbWlncmF0ZSAqbWlncmF0ZTsNCj4gIAkJc3RydWN0
IGRtYV9mZW5jZSAqZmVuY2U7DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uaA0KPiBpbmRleCAzOTM3MTExYzJh
ZGIuLmMxOTYxZWViZDBiYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Jv
LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmgNCj4gQEAgLTQwLDEwICs0MCwx
MSBAQA0KPiAgI2RlZmluZSBYRV9CT19GTEFHX05FRURTXzJNCQlCSVQoMTYpDQo+ICAjZGVmaW5l
IFhFX0JPX0ZMQUdfR0dUVF9JTlZBTElEQVRFCUJJVCgxNykNCj4gICNkZWZpbmUgWEVfQk9fRkxB
R19QSU5ORURfTk9SRVNUT1JFCUJJVCgxOCkNCj4gLSNkZWZpbmUgWEVfQk9fRkxBR19HR1RUMCAg
ICAgICAgICAgICAgICBCSVQoMTkpDQo+IC0jZGVmaW5lIFhFX0JPX0ZMQUdfR0dUVDEgICAgICAg
ICAgICAgICAgQklUKDIwKQ0KPiAtI2RlZmluZSBYRV9CT19GTEFHX0dHVFQyICAgICAgICAgICAg
ICAgIEJJVCgyMSkNCj4gLSNkZWZpbmUgWEVfQk9fRkxBR19HR1RUMyAgICAgICAgICAgICAgICBC
SVQoMjIpDQo+ICsjZGVmaW5lIFhFX0JPX0ZMQUdfUElOTkVEX0xBVEVfUkVTVE9SRSBCSVQoMTkp
DQo+ICsjZGVmaW5lIFhFX0JPX0ZMQUdfR0dUVDAgICAgICAgICAgICAgICAgQklUKDIwKQ0KPiAr
I2RlZmluZSBYRV9CT19GTEFHX0dHVFQxICAgICAgICAgICAgICAgIEJJVCgyMSkNCj4gKyNkZWZp
bmUgWEVfQk9fRkxBR19HR1RUMiAgICAgICAgICAgICAgICBCSVQoMjIpDQo+ICsjZGVmaW5lIFhF
X0JPX0ZMQUdfR0dUVDMgICAgICAgICAgICAgICAgQklUKDIzKQ0KPiAgI2RlZmluZSBYRV9CT19G
TEFHX0dHVFRfQUxMICAgICAgICAgICAgIChYRV9CT19GTEFHX0dHVFQwIHwgXA0KPiAgCQkJCQkg
WEVfQk9fRkxBR19HR1RUMSB8IFwNCj4gIAkJCQkJIFhFX0JPX0ZMQUdfR0dUVDIgfCBcDQoNCm5p
dDogQ2FuJ3Qgd2UgZGVmaW5lIFhFX0JPX0ZMQUdfUElOTkVEX0xBVEVfUkVTVE9SRSBhcyBCSVQo
MjMpPyBEbyB3ZSBzZWUgYW55IGlzc3VlIHdpdGggdGhpcz8NCk90aGVyIHRoYW4gdGhpcywgTEdU
TS4NClJldmlld2VkLWJ5OiBTYXR5YW5hcmF5YW5hIEsgViBQIDxzYXR5YW5hcmF5YW5hLmsudi5w
QGludGVsLmNvbT4NCg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvX2V2
aWN0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm9fZXZpY3QuYw0KPiBpbmRleCA0MWE5
NDhkZTM1ODMuLjBjMmNmYTUzNDQ5NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2JvX2V2aWN0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvX2V2aWN0LmMN
Cj4gQEAgLTI0LDcgKzI0LDggQEAgc3RhdGljIGludCB4ZV9ldmljdF9waW5uZWQoc3RydWN0IHhl
X2RldmljZSAqeGUsIGJvb2wNCj4gbWVtY3B5X29ubHkpDQo+ICAJCWlmICghYm8pDQo+ICAJCQli
cmVhazsNCj4gDQo+IC0JCWlmICghbWVtY3B5X29ubHkgJiYgIXhlX2JvX2lzX3VzZXIoYm8pKSB7
DQo+ICsJCWlmICghbWVtY3B5X29ubHkgJiYNCj4gKwkJICAgICEoeGVfYm9faXNfdXNlcihibykg
fHwgKGJvLT5mbGFncyAmDQo+IFhFX0JPX0ZMQUdfUElOTkVEX0xBVEVfUkVTVE9SRSkpKSB7DQo+
ICAJCQlsaXN0X21vdmVfdGFpbCgmYm8tPnBpbm5lZF9saW5rLCAmc2tpcHBlZCk7DQo+ICAJCQlj
b250aW51ZTsNCj4gIAkJfQ0KPiBAQCAtMTM1LDcgKzEzNiw4IEBAIHN0YXRpYyBpbnQgeGVfcmVz
dG9yZV9waW5uZWQoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+IGJvb2wgbWVtY3B5X29ubHkpDQo+
ICAJCWlmICghYm8pDQo+ICAJCQlicmVhazsNCj4gDQo+IC0JCWlmIChtZW1jcHlfb25seSAmJiB4
ZV9ib19pc191c2VyKGJvKSkgew0KPiArCQlpZiAobWVtY3B5X29ubHkgJiYNCj4gKwkJICAgICh4
ZV9ib19pc191c2VyKGJvKSB8fCAoYm8tPmZsYWdzICYNCj4gWEVfQk9fRkxBR19QSU5ORURfTEFU
RV9SRVNUT1JFKSkpIHsNCj4gIAkJCWxpc3RfbW92ZV90YWlsKCZiby0+cGlubmVkX2xpbmssICZz
a2lwcGVkKTsNCj4gIAkJCWNvbnRpbnVlOw0KPiAgCQl9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfbHJjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMNCj4gaW5k
ZXggZGYzY2VkZGVkZTA3Li5mZmEwNzY0ODY5MGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9scmMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbHJjLmMNCj4g
QEAgLTg5Myw2ICs4OTMsNyBAQCBzdGF0aWMgaW50IHhlX2xyY19pbml0KHN0cnVjdCB4ZV9scmMg
KmxyYywgc3RydWN0DQo+IHhlX2h3X2VuZ2luZSAqaHdlLA0KPiAgCXZvaWQgKmluaXRfZGF0YSA9
IE5VTEw7DQo+ICAJdTMyIGFyYl9lbmFibGU7DQo+ICAJdTMyIGxyY19zaXplOw0KPiArCXUzMiBi
b19mbGFnczsNCj4gIAlpbnQgZXJyOw0KPiANCj4gIAlrcmVmX2luaXQoJmxyYy0+cmVmY291bnQp
Ow0KPiBAQCAtOTAxLDE1ICs5MDIsMTggQEAgc3RhdGljIGludCB4ZV9scmNfaW5pdChzdHJ1Y3Qg
eGVfbHJjICpscmMsIHN0cnVjdA0KPiB4ZV9od19lbmdpbmUgKmh3ZSwNCj4gIAlpZiAoeGVfZ3Rf
aGFzX2luZGlyZWN0X3Jpbmdfc3RhdGUoZ3QpKQ0KPiAgCQlscmMtPmZsYWdzIHw9IFhFX0xSQ19G
TEFHX0lORElSRUNUX1JJTkdfU1RBVEU7DQo+IA0KPiArCWJvX2ZsYWdzID0gWEVfQk9fRkxBR19W
UkFNX0lGX0RHRlgodGlsZSkgfCBYRV9CT19GTEFHX0dHVFQgfA0KPiArCQkgICBYRV9CT19GTEFH
X0dHVFRfSU5WQUxJREFURTsNCj4gKwlpZiAodm0gJiYgdm0tPnhlZikgLyogdXNlcnNwYWNlICov
DQo+ICsJCWJvX2ZsYWdzIHw9IFhFX0JPX0ZMQUdfUElOTkVEX0xBVEVfUkVTVE9SRTsNCj4gKw0K
PiAgCS8qDQo+ICAJICogRklYTUU6IFBlcm1hLXBpbm5pbmcgTFJDIGFzIHdlIGRvbid0IHlldCBz
dXBwb3J0IG1vdmluZyBHR1RUDQo+IGFkZHJlc3MNCj4gIAkgKiB2aWEgVk0gYmluZCBjYWxscy4N
Cj4gIAkgKi8NCj4gIAlscmMtPmJvID0geGVfYm9fY3JlYXRlX3Bpbl9tYXAoeGUsIHRpbGUsIHZt
LCBscmNfc2l6ZSwNCj4gIAkJCQkgICAgICAgdHRtX2JvX3R5cGVfa2VybmVsLA0KPiAtCQkJCSAg
ICAgICBYRV9CT19GTEFHX1ZSQU1fSUZfREdGWCh0aWxlKSB8DQo+IC0JCQkJICAgICAgIFhFX0JP
X0ZMQUdfR0dUVCB8DQo+IC0JCQkJICAgICAgIFhFX0JPX0ZMQUdfR0dUVF9JTlZBTElEQVRFKTsN
Cj4gKwkJCQkgICAgICAgYm9fZmxhZ3MpOw0KPiAgCWlmIChJU19FUlIobHJjLT5ibykpDQo+ICAJ
CXJldHVybiBQVFJfRVJSKGxyYy0+Ym8pOw0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wdC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMNCj4gaW5kZXggZmZh
ZjBkMDJkYzdkLi4wNTIwOWYwZmZlNWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5jDQo+IEBAIC0xMDMs
NiArMTAzLDcgQEAgc3RydWN0IHhlX3B0ICp4ZV9wdF9jcmVhdGUoc3RydWN0IHhlX3ZtICp2bSwg
c3RydWN0DQo+IHhlX3RpbGUgKnRpbGUsDQo+ICB7DQo+ICAJc3RydWN0IHhlX3B0ICpwdDsNCj4g
IAlzdHJ1Y3QgeGVfYm8gKmJvOw0KPiArCXUzMiBib19mbGFnczsNCj4gIAlpbnQgZXJyOw0KPiAN
Cj4gIAlpZiAobGV2ZWwpIHsNCj4gQEAgLTExNSwxNCArMTE2LDE2IEBAIHN0cnVjdCB4ZV9wdCAq
eGVfcHRfY3JlYXRlKHN0cnVjdCB4ZV92bSAqdm0sDQo+IHN0cnVjdCB4ZV90aWxlICp0aWxlLA0K
PiAgCWlmICghcHQpDQo+ICAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiANCj4gKwlib19m
bGFncyA9IFhFX0JPX0ZMQUdfVlJBTV9JRl9ER0ZYKHRpbGUpIHwNCj4gKwkJICAgWEVfQk9fRkxB
R19JR05PUkVfTUlOX1BBR0VfU0laRSB8DQo+IFhFX0JPX0ZMQUdfUElOTkVEIHwNCj4gKwkJICAg
WEVfQk9fRkxBR19OT19SRVNWX0VWSUNUIHwgWEVfQk9fRkxBR19QQUdFVEFCTEU7DQo+ICsJaWYg
KHZtLT54ZWYpIC8qIHVzZXJzcGFjZSAqLw0KPiArCQlib19mbGFncyB8PSBYRV9CT19GTEFHX1BJ
Tk5FRF9MQVRFX1JFU1RPUkU7DQo+ICsNCj4gIAlwdC0+bGV2ZWwgPSBsZXZlbDsNCj4gIAlibyA9
IHhlX2JvX2NyZWF0ZV9waW5fbWFwKHZtLT54ZSwgdGlsZSwgdm0sIFNaXzRLLA0KPiAgCQkJCSAg
dHRtX2JvX3R5cGVfa2VybmVsLA0KPiAtCQkJCSAgWEVfQk9fRkxBR19WUkFNX0lGX0RHRlgodGls
ZSkgfA0KPiAtCQkJCSAgWEVfQk9fRkxBR19JR05PUkVfTUlOX1BBR0VfU0laRSB8DQo+IC0JCQkJ
ICBYRV9CT19GTEFHX1BJTk5FRCB8DQo+IC0JCQkJICBYRV9CT19GTEFHX05PX1JFU1ZfRVZJQ1Qg
fA0KPiAtCQkJCSAgWEVfQk9fRkxBR19QQUdFVEFCTEUpOw0KPiArCQkJCSAgYm9fZmxhZ3MpOw0K
PiAgCWlmIChJU19FUlIoYm8pKSB7DQo+ICAJCWVyciA9IFBUUl9FUlIoYm8pOw0KPiAgCQlnb3Rv
IGVycl9rZnJlZTsNCj4gLS0NCj4gMi40OC4xDQoNCg==
