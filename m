Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C382EC369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 11:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8064610E379;
	Mon, 21 Apr 2025 11:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACD5V+bU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F7B10E379
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 11:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745235075; x=1776771075;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iDixA0S8cDn8Onl15gVgtczztlPcTQNmP5VD6+P2dGc=;
 b=ACD5V+bUbctRnNv0jdmBxas8vW/JNOV+4XTRVQqZpawnoVGSEVklUUy6
 6SYhYdBSAvQ4NERn35BVcEYMJw2Oxh34O/of8NCGPdZJX3Cm4ylwDJ/RN
 c+vkGBbQ5nDoIHNO3QZMQHT6BND/oRegujIbb0QSixEHjVkqDFdY3HilH
 dH0WCWWJ/IRIonglzqKdqSAi8zEDA8fGyvWvlc7HdMMlYknaAW3DvzYHl
 9srbszAn/4zyQwx7HzUZApF4ENPA6at1tB5QuCn0Mtx9CLi5iRPlEFnFI
 x11w8aJgEq8wVEwMSlpTedta6ShlkX/OYEKe0O6iLcYb9NTk5w1L7f+nJ A==;
X-CSE-ConnectionGUID: ZOdrznDYTL6vxqWaPKW2Dg==
X-CSE-MsgGUID: jMyVJVy4R26fqHDfofaXow==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46681609"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="46681609"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 04:31:14 -0700
X-CSE-ConnectionGUID: ZhvFWWJLSgqs+UO1zM5vAQ==
X-CSE-MsgGUID: swLfP3YcRS65LXgOUWCsNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; d="scan'208";a="132577355"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 04:31:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 04:31:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 04:31:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 04:31:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npKM5hWIqvLrqSBR/IEOC2iZz6K/cuqVuN2qBT+nWxrGFuC+Uv1A4ntsuaVBL6LuVjeGi/OBUGXqsqr/DFZPDwg440yeuaAHFK3unYnccYp1+iK2B1vQfkmj+ga5VFSFkPZWswGSEyGeYwKgVirtSzRoxmHpGUcMPgTtJsPAR9kNHwRNR8Bc/ZpTWKv/WsXY+V4MiBrpyl8ZKY2uMavd+Fquzzi8xI05DmiCeOhhauduPsFSWR/h+hFJ68hsoiS53ATGuOaCYY9Fsa8aUb2okDG1bl4++zDTyeFkw5H3ASGZXE4krfMgmQm2pgR3AZEL0Qrt3AnjssSpzn/gs5QhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/goMeFsGA4/j9kYKanu1X54eWgrgEx7bm2VSd49Mvkg=;
 b=pjwshuO7Xneha9BsDMOLGL/7UElUj5wkVoJuPy7Kf7rFSA1OtcnuVWpZq97cgQxDEcnCqaB37bE1nChhKJ4qzcF7MvW+hzc0oMi55NOwg+0x3WcZxQlTBu3nMdxKrx+Gm6hFkrj/Tj4uqwyhAJaIStlqxalntBEQzfXjmado6P/lJrUVTbaGMdTlYfp8uvzpo83PxKEWnu81z/aeEYhrKZLdwShGh6wg+M1gGFMh171pXCfG3aa7Ru2+PRZR8C/RqwfGABV8RZLngm45v5r3gn1NKDMR+yQlcgIM+a8psdepSFo1WEZ/+a45gZJQWKB9207z+IVYa0Tqeiwv9aq5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 11:30:29 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8632.030; Mon, 21 Apr 2025
 11:30:29 +0000
Message-ID: <5e8d58bc-003b-41dc-940c-3d01ca4b82e5@intel.com>
Date: Mon, 21 Apr 2025 17:00:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
References: <20250410110057.2497056-1-karthik.poosa@intel.com>
 <CY5PR11MB62113A236791FC539318DC9695B72@CY5PR11MB6211.namprd11.prod.outlook.com>
 <978a73ec-075d-4e09-816f-8b682a601317@intel.com>
Content-Language: en-GB
In-Reply-To: <978a73ec-075d-4e09-816f-8b682a601317@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::30) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SA1PR11MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f013ea1-826d-408f-6acd-08dd80c7eb35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3A4b29sUVBWTWJRVm1WVjlSajZXYWZlcU5WMFZLZjhaNjZzTmFSdlVGMnBm?=
 =?utf-8?B?ZGlwcjUyVnJtVzVXTDAxMDRRQ2lRSGQrZkkyWTNIWHJBRjdsZ3JXZzBGS0JK?=
 =?utf-8?B?anVlQ3lOMTQ3bDc2SkVwSG1ZUmxiTjVvSEhkZ0pxbDNDMlUrWVNaaytKdmRl?=
 =?utf-8?B?WlJDMkZrMlo0ajI2bGozSVdDUzFxZmdJbnNVNTE1ckFjeEhRZlV5clArU3lU?=
 =?utf-8?B?aHg1Vm9QZ29yZUN2YTY5T250bjRvaGFBT1dpMGl5R2doWGl0bzlUZXNIbDcx?=
 =?utf-8?B?MUQzcjZiWGIrZzRucVltZEtjUEF4QXRXem1uOHlzUnJjcStNTmJMVXVOK28y?=
 =?utf-8?B?RnlrdEltV25vd0VOdllLYU4rVU94VEViTFIvY0RXZFhXckJHcGVnam9ncko3?=
 =?utf-8?B?TTV3aDVIZXdPcXBhZnZoa3VyVjFCeHdORWF0MVNUTEZ6ci9GdVIwMHZSVDBk?=
 =?utf-8?B?ZlJKb3RhNmpLK2VEbm1qbm9DQlQyUUtpYWhBMG5odFM4STgxdlgwR28wZTRs?=
 =?utf-8?B?RnpYeWgrb3pQVDdwcmVHNmJlMmVQR3VhL3VrSVZaaFVmZFE2Y3Z5TlZPK0xL?=
 =?utf-8?B?NE1TU3VGY3AzdEU4dDg3b1d0Qjc3a2hBRks2Y0ZJUlZ5OS9SdHlRZHpLejR5?=
 =?utf-8?B?aUVGa0ttK1pwbDk2UWhTblNXOEZVS29nYVM5TnZwSVhIcjIzZjlPclRveHpM?=
 =?utf-8?B?cFozREJTcEVORFFob3EzYTg4Y0U3dWYzN1JsWTFON2NqdC85cXlVdXIwUjRt?=
 =?utf-8?B?YTVveE1DVUx0TmwrMU5PT3lnL3FHalJmb00wRVdIVWhSYjRGekJpYnNEa1o1?=
 =?utf-8?B?c0dKZGFrdXFlRm1YNm8xOXFialJLVEFrblpsK3BhNDFKcVNDV3V2WjM3ZGto?=
 =?utf-8?B?OHZlRGtLQVIvcCtTTlNlZGI3ZUxMTVQ3TG9PbzJSNCttY28zaWsvbDVvY2Zq?=
 =?utf-8?B?bWdMWjV1VzZVNU1MVE5lSWlOWVVyY1R0ZHVPbERyL2RUaEhYRTZab3BhdGc0?=
 =?utf-8?B?U3NsQTVnQXF0ZzlCbXR5VlpJV3lhK1A1aEpsaURZU1M4MVJZaUxSNGNhMU9L?=
 =?utf-8?B?K1BGbTVSeTJDL2pvWE9LTmlQZ1ZRbXZxbEVMakNrRTVJQjd0Z25sd1ZaMXJk?=
 =?utf-8?B?aVozNWpHdHdSd2hxNHcrVnIzb0FXZjhhd0dtbU50S2c4NmtyY3ViRTFGVUtq?=
 =?utf-8?B?NGw5dTNYK0pHWXQ0bTN1WWdycDE3aGZoRHFUeHIyK1VDdjY4ZHRqdDlNRHBy?=
 =?utf-8?B?ZSs3djBMb0c2R0dzQWt3d1huR1p2dGJ6azExMkYraDg0azFTeVBCUHlrVHI0?=
 =?utf-8?B?ZUpGRUxhREtHV3NPYVRPUUFFbGllUTQ0eG5nZUM0K0hnYzUxMFZua0pzUDJa?=
 =?utf-8?B?bUpXbW9NU1FvS0pzVkJXRk1EVEtpWFltaEM0aDNLSnEveGtZaTl4eVVGUTNC?=
 =?utf-8?B?WFliZlVFa2VPMTdjVTJLNDkwd0Z0OVpOTkZGdlFqNmMwTWJxeGttanI5UlRj?=
 =?utf-8?B?eU5zMVZuOWhmd2hxT3lZUHQ3d05ZRUFERmJFOXVWTWN6U1pmV08zVFVqZm12?=
 =?utf-8?B?di9iM1B4bWY2OGY1NitLZmhHWkxqL202REc1TjVCczVDRE9rd0JqV1lGNWpN?=
 =?utf-8?B?dzZFWlhPK2wrZXpobFY2NHEwTkRXZGhhMStFSFRqaHpJWnd6T3dvb2hxK1VK?=
 =?utf-8?B?RnRBam16K1lQb3AyU2J5Qmx0a0JuMlF0NTRDTml0aXdIZVdqR0svMnFGK044?=
 =?utf-8?B?OG82cE11THg3elBTT3kxZ3R4bklNYURzQ0gweHF5TWViQStoNWZKRlA0N0cr?=
 =?utf-8?B?WHY4djk2UkhZL2Z5bWZtZmtycUlkRG00S01WMTZqUkU5QWIveGJUMUpWcEx0?=
 =?utf-8?B?NzlLWHFlYmw1RThtSlV4MGJBaUMzRVRQRDFmYS9Ibys5dGI1dkJ4S1hORUI4?=
 =?utf-8?Q?57hStlnviIc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWZpOG1oLzZqZ1NRMG9TZVRlYWZzMFczd2RHRXpla0RCLzNnbG1LZVAyTVA4?=
 =?utf-8?B?TUt4SkozY3hiVmhPVEJnOWFMaDI3WVZtNnZxZ2tpYnp4eGJYbU9pZjM1aG9x?=
 =?utf-8?B?bTZ4MHlGQ3JUbUppSlBOeFBuakR4UVVkdWtOQ1NSbzJWZmMvZWxzb3R6ZnJG?=
 =?utf-8?B?T0d0Z0x0N0xucTNaQkFLTGV0d1IwV1UzYXpnMERwWlFyV0dWMDAvQjdVR2hP?=
 =?utf-8?B?NUFrTDlqSWczUnZhZDA5c3dXZmJUUkFLcFY1cEV2S2k4TklHMmdMK3prSmU5?=
 =?utf-8?B?bjdkY0lRbE5jOENLNWVNQ01tZjVZMWZiWFFDNm8vTjlCQ0syYlE0QU16aHB5?=
 =?utf-8?B?cnVzeUtKRVcwRFJRWE9hNFRtNlB5b1FnUWQxV2t1d1VDS2FQL05pQjJvNS9O?=
 =?utf-8?B?MnlPUTdrNmFBMWx5eXplOXlhZGFPaldRbUtHaXc2R1B5MDJOdjNJVGRmaXZz?=
 =?utf-8?B?L1JDK1ppNjZVWHppQ2x3ME5JUEU1VURVZ2xZTmNMS2RsZWlxaUdSRTgwZFpO?=
 =?utf-8?B?ZGdqQzIrYk5xMkVYSHplMFZVT1B0MFlVNG5nNUV1elY0a2NoVHd1UVhQeHNr?=
 =?utf-8?B?b0Fwa3NxMDA5clpnOTk5d1NsMmJGbS9OK0VHK244bkRQWHl1Rm1nSFFzKzk0?=
 =?utf-8?B?dW5MYndOSFNNS2JZc05OZXhNa1ZxSVBEVy8venRCMzBaUmxCZXROd28rRWtY?=
 =?utf-8?B?Ym9ZSVNGcDBEeWdUZTkxK21YU2ZWeXhPMTJFdjVtNHI4d3lvd2QzdEo4Y0sv?=
 =?utf-8?B?SmJoemw5b1VQMWJXNzAwTVFmVmVObnIrQkZ4RXkxVlVydjF2dmNTcTlJMHdm?=
 =?utf-8?B?dHlBdGJRbFd6VjNEMFBRUFBqQ3JkUFJXZjAvVmpsTkR5eWFyVGIrNkp2V2dx?=
 =?utf-8?B?ZVVWcG9sb2JkQmc5b3dtRmkrbERydllVRHd5NnhRQ1JkaEM2d2xBM01FZXBs?=
 =?utf-8?B?Nk16Z3V1TFM2V0dXUVcvd3F1VXUyaUh4K0lqbU9YWVBXNVFPN2ZhTnc5WWhD?=
 =?utf-8?B?ay9qSmo2aVRHMFIwT0NwVUJ6Znd4SnNVTzRYT2NaZ0dJTmlNckFFZzZLdlFD?=
 =?utf-8?B?Mk40OGp5YmZEZEEwcEZwVWUyQWdqUlB0c25NZUk4TnZxaEM5WUVSamhpV0lu?=
 =?utf-8?B?a1dLRk5vVTNoNjFjY2JUaWpESmtBMERGOEZFUUNrYTF3b1pQZzRSQWlGSU5N?=
 =?utf-8?B?dkdqd3A2dVlkTUp2RHJ5Z2tmaWd0aUQyaU9ZcWNVWkhFQ3NlQm5DNkFLVE5L?=
 =?utf-8?B?ZisxTEF1T29tTEliRWpFWmduWnBqVmhTNTc1dmU3NkVjcXh4V2k3VWIwSEVr?=
 =?utf-8?B?SWsrSUFta3Q5b0IzV1FLanY4NWI1Z1VuVncvT1hXMW5qZmFUc01OL244bXJS?=
 =?utf-8?B?S0p6bG9xZWsrUXU5aGFVTFVLLzY4RjhPMFE5amJvY3ZmMDFCRndpdHlXd2JU?=
 =?utf-8?B?UDhjNzBONDZLMWlLZSt0YXRJZjVhWnA1ZFBrcnRkdjNTaU4venhTOGRzbmxP?=
 =?utf-8?B?M0drNWdiREV1ZW9Pc1JmT1BoUll1T1NhT1ZnSWd6SWR1N25hSU1wYlN5YzFU?=
 =?utf-8?B?cFdqbHlQSWJkUTN4bjNMTklIMTFYTGNrZW4zNHo2cHo1NnhoSmc3NmsrSXp6?=
 =?utf-8?B?TUd4R1ZzazlVTHUyTVh1WUFDejdzdjAxMFVDZFVUVC85S1hRRG5QMWgzM3h1?=
 =?utf-8?B?M0gza1N2S1ZTTWN5ZW9xQ0FBQlQwODV3ZS9FM1M4Zm1XenkvbXBvdXQ4aEVZ?=
 =?utf-8?B?cE5BMCtTL25HcWZLWTU5SGNORkc1VzdhNFRKOGo3YVhsVVUwU3NrSzhJZGli?=
 =?utf-8?B?L3pRMjBIZXExejBDQnNjZE1uRUJBQ0JhcnliSkVZRWRrWHJES2xiTWVGWjA3?=
 =?utf-8?B?Z1Jldk4yWjh0aTN3WlhpYXhHMjY5aUU3VDRLRmZLR2o1aGtia25nalNqL3d4?=
 =?utf-8?B?bndnNkVIM255czhwclJGeEtLeitSSGZRWGNOdVZXbW13T1dJNCtoM0YwVzAr?=
 =?utf-8?B?b3dZUFc2a1lOMVI5alV0Vng5SW5RWnA0RE9VUXArVUw0OGRPQmF6eTR4WS9X?=
 =?utf-8?B?azd6b1hmdC9lcmZycjNZVDk5Vno3aGhuMEVhT2xMOUhFSkJYRG9pZGprTHJZ?=
 =?utf-8?B?SFRVMUljUDNITXBWOTNwT3hncnc0UDI2ZzBwcU5oRHlRR2lhTnNzdGpGZTFI?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f013ea1-826d-408f-6acd-08dd80c7eb35
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 11:30:29.3224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uu7724QI1cq2IhDW41b39KHRuAxB+l2lz9Im7ysVdokrK6Ft1OHWxyEvvam+0tFURIz7yTll2wef+Xkd6roQHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
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


On 15-04-2025 11:01, Poosa, Karthik wrote:
>
>
> On 10-04-2025 17:36, Gupta, Anshuman wrote:
>>> -----Original Message-----
>>> From: Poosa, Karthik<karthik.poosa@intel.com>
>>> Sent: Thursday, April 10, 2025 4:31 PM
>>> To:intel-xe@lists.freedesktop.org
>>> Cc: Gupta, Anshuman<anshuman.gupta@intel.com>; Nilawar, Badal
>>> <badal.nilawar@intel.com>; Vivi, Rodrigo<rodrigo.vivi@intel.com>; Poosa,
>>> Karthik<karthik.poosa@intel.com>
>>> Subject: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
>>>
>>> Add wait for LMEM ready during system and runtime resume.
>>> This wait is there in probe and is missing during resume.
>>>
>>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c | 2 +-
>>>   drivers/gpu/drm/xe/xe_device.h | 1 +
>>>   drivers/gpu/drm/xe/xe_pm.c     | 8 ++++++++
>>>   3 files changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 75e753e0a682..4c0d9eb51d1f 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -630,7 +630,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
>>>   	return !!val;
>>>   }
>>>
>>> -static int wait_for_lmem_ready(struct xe_device *xe)
>>> +int wait_for_lmem_ready(struct xe_device *xe)
>>>   {
>>>   	unsigned long timeout, start;
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>>> b/drivers/gpu/drm/xe/xe_device.h index 0bc3bc8e6803..60bc92f9ab22
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);  int
>>> xe_device_probe(struct xe_device *xe);  void xe_device_remove(struct
>>> xe_device *xe);  void xe_device_shutdown(struct xe_device *xe);
>>> +int wait_for_lmem_ready(struct xe_device *xe);
>>>
>>>   void xe_device_wmb(struct xe_device *xe);
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c index
>>> 4e112fbacada..2e59670660c1 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -182,6 +182,10 @@ int xe_pm_resume(struct xe_device *xe)
>>>   	if (err)
>>>   		return err;
>>>
>>> +	err = wait_for_lmem_ready(xe);
>> In Xe we are referring this as a vram.
>> Do  we have any spec, that document this ?
I can change the API to wait_for_vram_ready.
Although I didn't find any specific mention of this in any spec, it's 
prudent to include this wait here, as this is done in probe.
>>> +	if (err)
>>> +		goto err;
>>> +
>>>   	xe_display_pm_resume_early(xe);
>>>
>>>   	/*
>>> @@ -478,6 +482,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>   		if (err)
>>>   			goto out;
>>>
>>> +		err = wait_for_lmem_ready(xe);
>>> +		if (err)
>>> +			goto out;
>>> +
>>>   		xe_display_pm_resume_early(xe);
>>>
>>>   		/*
>>> --
>>> 2.25.1
