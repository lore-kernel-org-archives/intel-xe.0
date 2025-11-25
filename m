Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F33D0E6C4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 11:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1CC10E3B6;
	Tue, 25 Nov 2025 11:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwdzgMRG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D7010E3B6
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 11:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764069630; x=1795605630;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zr+yMrDoejVimZwkzpA14tLgK6RovpEyHSgRoSz4WOg=;
 b=dwdzgMRGqljz5+N4+c2I8bU+95hZEqNxkTTSjOlo1KAM5h1mYgi5sKSG
 bYya5SygJn4PPFOfTze/o6OD2K722tYvdLcFMHi7LTaaIQB3PP6lLsJaX
 0T8AtnLpprZK3TAzYq6BqK2ZkO6+Qq98r3OEmsVMOnHoajRXm5bLNR9jG
 Glc6IkN6351XQ2w6JYkUZQX3C6LGZ/QKL7WdQijZaf9RSCZ70y5KpVy/3
 /SCWJlJxqO+PCHe8OwbsxnL4gY2qkwefIaSGtz2z9v9QEf5M41XC5cWCH
 iocaolWinmNOmf90mct9YimuvUmbLCSLN0haYBXvSiz6MCYWKw0iEFo4S w==;
X-CSE-ConnectionGUID: DE8IRHzdRuyVWV946WlrCg==
X-CSE-MsgGUID: rmhd4iYPQq2K71BvOmeMLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65268943"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65268943"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:20:29 -0800
X-CSE-ConnectionGUID: 3N4o5CtNTs+uWNH1PnSe7Q==
X-CSE-MsgGUID: dP6oMhVpRrKKBt1SlpnAsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="193044178"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 03:20:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:20:28 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 03:20:28 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 03:20:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIdk52pUBYLCRxoYl59bquJhqkJPd67UrXHw+fzJr7FmTqURW9LVBpJM63sDNALxRK0e3huYPnULXW3nLu+b3dJf1WcGx+Y0YonAYmdiTeQAUQF3e/m0oQxXkMH2oDG+FKhWiXJI3ILqdkWVUJdV0owhM8xsrrM77otfkDXOila3SmFJu8yixuSPf6ndwMWFbK17w6WvE6dN/eXZCjQV+I9TU2U8xHcWgMib+oBvwfzV37jWPMBjs8iKhjtuCnwlz6lE4uqBy911j3zmflzQGS+7+14k6RvCGBdwfi3gYbpc2RhwQAs2cK15y28y9gmcmKPmkhoZnQw7pu+h+RNrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zr+yMrDoejVimZwkzpA14tLgK6RovpEyHSgRoSz4WOg=;
 b=LZi5aoLw0Krm7zVg+aJH/gn+fxh6XL8PlZSanNsspkE61bggFMMtzY2VEbDEpZNvvSNswDDxWS9RRN13uS24pEUkMI8yekkjL6+PSHXeIcmtE0VUNJmm4HsWVMaOfpKDg02a5On7m+XnmK01JU/ntkGD/kXYgwtMzhEIWElpiyCkBobyeZyb5s2FdnWwK4KVLqY5HPq4jol4YytyQV2A3BRNHGkyG8YA9NrHdByk15Zdd8xEvXKae2hZ00v2Q3orwwlPX6kTSXVPKS6bOCSWLj4f1JHsJYmKCOiXbgI7liX7klVTlr7e9q88ocquQvAR/E3vbnDIkqkzpUffmnhW3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by IA4PR11MB9371.namprd11.prod.outlook.com (2603:10b6:208:56a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 11:20:26 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:20:26 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Topic: [PATCH 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Index: AQHcWGqcziKXxPxC+EC9qhGSqcbQhrT+vYyAgAPc9uA=
Date: Tue, 25 Nov 2025 11:20:26 +0000
Message-ID: <SA1PR11MB8839D99D7B9A7306512AA1E4AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-9-brian3.nguyen@intel.com>
 <775a953c-7886-4292-87b4-9ad764609c06@intel.com>
In-Reply-To: <775a953c-7886-4292-87b4-9ad764609c06@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|IA4PR11MB9371:EE_
x-ms-office365-filtering-correlation-id: 5fd21797-b7f6-4c7e-1498-08de2c14a1fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?eHI2WjRxa0ZUYzVFRnZsMVdLNnY2YWE0dEllQ2J0UWZ5dmdOcG5GYVpnTnMy?=
 =?utf-8?B?RUVjek5aaVRSMFB3VXdzZmhUaUZYem1HTUMwUXVNWHBVYVBxaXFVY0pMNzJC?=
 =?utf-8?B?RnFnbkxMbURLRGJSand5SVM0UFd6RXp0WVhDT3RmWUhXQm5nRGVCVWNzazZ1?=
 =?utf-8?B?S2RndS9ZeHowYTM5YWhML0VKcEk4Z2VZM3NXRHBiSmFSd21Bd2FzVGxMdEtn?=
 =?utf-8?B?RHlzUXp2cVVFRmpObHhDcU8yUEQvcHpXek0zR21SdGNPNGd6SmlOc3EwNUVY?=
 =?utf-8?B?cVN4RXZDU20zWGhDNTdTeTRuSGt3aFlNU09HdXYyMlc5UVpON0Y0eUV4MTZR?=
 =?utf-8?B?RnlxS2ltdlMyVXR2S01ZZ2YvbWl4ZmJ1Sk1uWUE5K05DVnpoSURVZ2s0NVZG?=
 =?utf-8?B?WnNrcm5tYnhhRVNOZkRwWld4M3gxRHc4YThaSzJtSnFacGo3OXJqM2lQMFpW?=
 =?utf-8?B?NXJaU1Q0TUFJVkM0Nm02ZFE2SlAydTd5bWtJaVZuR1hETzhJNFZla2pBTnJo?=
 =?utf-8?B?U1hkWDc2Q0dnRFA4UDF4OWVZbityVk5VNS9rUzRESm5RaVdsVmJKcWJFVzQx?=
 =?utf-8?B?em10SjU2SXFtMWVENXBiUjFpQXdCd0swVVpRT1F1UldFZHNHbTdFNUxxNERU?=
 =?utf-8?B?MGk3N3k1YmRQQkVmQlIxaUEwYmlwZXJDaW9IM29md2dDQWlkd3ppdVNJY3do?=
 =?utf-8?B?c2VHWXZmanNLRnRJRitqdnlTYk9sNTcvcFNONTV2emxoc0duNysveGFKb0J4?=
 =?utf-8?B?WThCSkZZd3o2UXpvWHY0WkhpSlBxc3FsQXM3SE83T2tuQmxuTElaTm13eXRa?=
 =?utf-8?B?ZzVNRkgweTJEV2FHZHlCT3hwNEtIRU9QT3cvc2Q5V1ZBV21mVXUwd3VaODdx?=
 =?utf-8?B?SFV0M0RDVHJweVN2ZnBvdTBBSEJyVkM2VzJhTm1jdlZRRHZBZnVTRWQwcVFE?=
 =?utf-8?B?YmVhVURQRW9hNURlVHVWc0lrd0VBbUN4cC9BREpnVm12endneUFIL3NwR05G?=
 =?utf-8?B?ZTNTNVFDeDA5R1RYWjhIb2swZ2ZSSkFaQUpWMGZxUkQrcjBJWGtCNmhtQnRI?=
 =?utf-8?B?Rm80ZTB1WnNlOUppUFZOa1NPeTYyYTVSOWIzOGR6VXl0QUZPaTg1bVZ6SkVB?=
 =?utf-8?B?SWF3MUtaaUJzS2t4V1FDd2taaG5sdk0wZXpIRGY2Mk9qTnBvRmYvR1UwMXhH?=
 =?utf-8?B?d2twWGcxNjRzbFptVXlsRzRKTmNtUmh1eTVIdGhqSURKOUJ0TCtmUUZUNDNL?=
 =?utf-8?B?M3EycnR6ZHdLSmJCT3VSTmpSckJtcWpqNDlEblVsREpSVk5nUVFPczhLdEVN?=
 =?utf-8?B?V2ttcnp3RFVDTGJNMGhkd04xcGJXTXhSQTRWcmNhc0ZjaHR0eFc4Q3o4TEh6?=
 =?utf-8?B?b3BTbXg5UG5WS1QxUmxPMTJvZUcrQ2x0MWxjbG8xZ3lXcHV1cm1XS0hPNjJ1?=
 =?utf-8?B?L1ZGQktBVGxxQklSbXRjTUlOcXZPZ0E0QllDTXRXc01CaEtLK3NNdHFaZFJi?=
 =?utf-8?B?MHl2Vmk4TVAyMXhiUkRFMW9kWklsRU42KzRPOC83ZTc5SkJyMzhhOEYzUEps?=
 =?utf-8?B?OGpFcFBHZ1QyU21xMVRzRFg1MGcrV28xa2lweGhOOVRBMWx0OC9EL2VoNnJX?=
 =?utf-8?B?SG9SUFlGSEp0TmE5WkZXUDNpMU9nbkhsOFdHaUNSMFZTaHBmMzdCRE5RV080?=
 =?utf-8?B?MkFocDRxbXVjbUQ3NTJXZGN1cjV6Mm82bno2UlRYcVdNcWdkdm54SmJUdnZv?=
 =?utf-8?B?cUF0MG51VWdrdmkvZko4N0JtZHBPenhDVmRlb3F4YmYzeWdYVmtQUisxWkpw?=
 =?utf-8?B?dHVvczdaUnFVQzNqbTZoSG9SMk9rWHlqQWhvNkQwdlJVL0ZwL1pPYm9oSkNR?=
 =?utf-8?B?TGhLNmhwMGFNb2VYQ1R6aFlmb1dHeEpkTnBlcFdaUmxpekFpWEpSUVV6SHAr?=
 =?utf-8?B?cG9ORHNYTnBqZ3FNUTI1aUtwQVJMWG00dlhQWE1RaTNzKzlrYThXQU82Z1Q1?=
 =?utf-8?B?d1MyeTA3M28vM3ZIT3dXbVVUN280Z1ZYNUdaV2VvNHRNanY3RDdrZHAxV0RQ?=
 =?utf-8?Q?soXmlZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1gxc2RZazNDQW9iZFhDaG9CcHJiMUtQSkluL2hHTHZ0eCs3MS8zYkdnc2dK?=
 =?utf-8?B?N2F3UktLTFk0T3Fpc3BrVHdJcXZlbklzdVdrSmduWWNyb2hrMlRoRzdUZ2Ex?=
 =?utf-8?B?SURNVWlNUWVkYkcxdFRiTFArRklsd2NBMVVLcVdDS1dPR2kxdXZDckEvTUU1?=
 =?utf-8?B?MGlvMTRhTSsySVJmWU56VHdGaDFMNG9wNmZXazM0OU8wUW1qUW1iYlExU2ZK?=
 =?utf-8?B?RjdxL1BTUlVRbmR5ZHZyVzZKYmpaVW54cFV1NnJlNWp4V1BCUEdrSGhpTk5v?=
 =?utf-8?B?RThzK0Y1N1owM1MyVVJpVXc5MTVuTE04Rml5eG0wVDRXQi9Kcjg3TldhZllr?=
 =?utf-8?B?cWxWRWo5OGI5S2V6Rkl2R1NlVzBCTitVMXV4aXEzbllGVVhpM2pKNG5USW5i?=
 =?utf-8?B?L0ptSzdQVENub0xxNmdQYkI1RVJzVm1FRUQvendpNmt5NDZQN084VTNJdzNp?=
 =?utf-8?B?U1RiNU1TNWNXdUdXRUNReDRUWkVXRVpDMmpRd3h6TElXS3pOdENCbVJad0pP?=
 =?utf-8?B?MHUwOHdGTWxGaXhHcmZDSitkcmRLcURRa0UwMGd4L2x0aHJ6TnhkQUEwSlpr?=
 =?utf-8?B?b2loUVZBS0Nuak81Sk5yb1NEZXQwSE0wWGYvTXZEVHdnRWQ5anpseHpDV3Fl?=
 =?utf-8?B?TG5tZVcvdllQaCtocG5IZEFrdmhSbk5JZXUzNXFzTWxPS1h0THlHZUI2U3Np?=
 =?utf-8?B?WmhycmI0cW9TZkc2OTZCVDNRaE1OTGgwTmdlcURhTWxROERXbldaZ0ZFcHUw?=
 =?utf-8?B?Nk92UUZNb0t2Ym83R29scHpvblRydmluMllINkNScnFPalM0OERHUW90T2dO?=
 =?utf-8?B?UEUvSXppTVYwbWRzU29yV1pkWWxkWlNmVlpVOFMvNjFva3RZcGRWNzBjOTht?=
 =?utf-8?B?RTdGdUZhZENnZzErTGRBYTVBNldUODFUQWJqdW5EekhzMzg4azc1Mmo2VWxz?=
 =?utf-8?B?NW8zbkhOTzF0Zk84cWRnQUQrL0NNZmRBYTNjbkpVYkF1bXBGc2FzZUU2OW5Q?=
 =?utf-8?B?UWtNQit6cGRxenRNRU9ERzQ2ZFpscHFQMDAvNkdkUTNVUG5oNDMxaDlpMU9C?=
 =?utf-8?B?OHJMQStvRnVYNTM3ak1FNXhVK2pnaDZrMitRUnN0eUtYVnlJRmphRDRlbjla?=
 =?utf-8?B?cTAzTVlwYjhUZ244VEN0YTlDbzZnekV1eklQMEE1bFFOalNQUTJ0NzRqQ2Zx?=
 =?utf-8?B?MXZOUWtxSHJlWU44OE9Td0pVYlhqRWZEdnBlRURQTnMvZGVabHZyVXEwUk5F?=
 =?utf-8?B?N0h5bzRrV29NL3I0emQxVXVzdFJ1Z1RtMnhOK2h1MTBIOER2aEsyK2x5Ymtt?=
 =?utf-8?B?M1h2ZUd3MDZIeEZzd1VGbkR3TWora2dCSnQxd0RISmxicjlydVhDOFFKZDZs?=
 =?utf-8?B?Ym9NcVVOY3loU1B1aldkcHo3ZmxvMS9BRFJJekZhZ0w4NGEvanIreGdNTldZ?=
 =?utf-8?B?U0JKMFVQT1hxZ0tuSWd3YVQ3bkZFV2FmSy8yWWNsR3NmQnhFejVDSTIrb3pO?=
 =?utf-8?B?Y29tejROOVh4d004b3ZwQndZMVd1T0pxdUcrMXlHK3R3THp1NVMzMXB4bVVk?=
 =?utf-8?B?aS9UVHk3RDNNYzBXS3VZOElpOTErSFFIWmh5RU1XaXU3S3NwcFd6UWVzRy9a?=
 =?utf-8?B?VjRKUm4xejJONUxkTDBlMlliRkNjd1FOOXNKSWg1MkRLRU1BT29QTHF2NmFo?=
 =?utf-8?B?ZEpKZTUveTdxNHdieXB1MWl6OW14ek5aNWdnNWl4TDNDTXFDRWhXVWpHcy94?=
 =?utf-8?B?THZ1bjVvWXJGYVB2TGJ0NStjZDZ6TW4vTkdPN0tzS2lDTGJWYUdGZXRlUWgv?=
 =?utf-8?B?U2RXNndoeVdKaHZLT0tpR29ieHN6YXpoSXZvUGx0S0o1RWQ0YW5EVTRjNDNW?=
 =?utf-8?B?YkFwTWt4QUhnZmltb0VGeFptOVBTT0J2QS80SkRJQlNuSndKNThzVm1WKzFF?=
 =?utf-8?B?V28yUFRTQzkzYWQzVHFnaWk3ek1nQjFCbldSd2tsZWVpbWI0S2YxNnluaDJM?=
 =?utf-8?B?d2ZtbmpDaUV5ZXdJRXNna1I5UlVDWkVxSlUra0gybERFeXhxbFcrWjdYWU5U?=
 =?utf-8?B?OGJrbzJqUEd5ZVRCOVFBS3NmVEVGKzVrVlplL1MxYkUrdC9BRmhnVWoydTN5?=
 =?utf-8?B?dzhYUVFSOFNXQlk4UEZYZ3RhY1ZpekI5bUFhcWd4NTJuT2JENmVHMGpYd0RK?=
 =?utf-8?Q?jg0n8TVuDf3dAZcc9fJE978V412PdurIMOe+yExsvtI2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd21797-b7f6-4c7e-1498-08de2c14a1fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 11:20:26.1691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bXgOlc36b+nzILH6VImc1Wn6v9EWtS2qZm9jD1lQPXO5MjkUZTAPUFj8Q6ifvW7te0ZQrGPBy0IKoMsugcZksA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9371
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

T24gU2F0dXJkYXksIE5vdmVtYmVyIDIyLCAyMDI1IDU6NTIgQU0sIE1pY2hhbCBXYWpkZWN6a28g
d3JvdGU6DQo+IE9uIDExLzE4LzIwMjUgMTA6MDUgQU0sIEJyaWFuIE5ndXllbiB3cm90ZToNCj4g
PiBVc2UgcGFnZSByZWNsYWltIGxpc3QgYXMgaW5kaWNhdG9yIGlmIHBhZ2UgcmVjbGFpbSBhY3Rp
b24gaXMgZGVzaXJlZA0KPiA+IGFuZCBwYXNzIGl0IHRvIHRsYiBpbnZhbCBmZW5jZSB0byBoYW5k
bGUuDQo+ID4NCj4gPiBKb2Igd2lsbCBuZWVkIHRvIG1haW50YWluIGl0cyBvd24gZW1iZWRkZWQg
Y29weSB0byBlbnN1cmUgbGlmZXRpbWUgb2YNCj4gPiBQUkwgZXhpc3QgdW50aWwgam9iIGhhcyBy
dW4uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBOZ3V5ZW4gPGJyaWFuMy5uZ3V5ZW5A
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiANCj4gLi4uDQo+IA0KPiA+DQo+ID4gKy8qKg0KPiA+ICsg
KiB4ZV90bGJfaW52YWxfam9iX2FkZF9wYWdlX3JlY2xhaW0oKSAtIEVtYmVkIFBSTCBpbnRvIGEg
VExCIGpvYg0KPiA+ICsgKiBAam9iOiBUTEIgaW52YWxpZGF0aW9uIGpvYiB0aGF0IG1heSB0cmln
Z2VyIHJlY2xhbWF0aW9uDQo+ID4gKyAqIEBwcmw6IFBhZ2UgcmVjbGFpbSBsaXN0IHBvcHVsYXRl
ZCBkdXJpbmcgdW5iaW5kDQo+ID4gKyAqDQo+ID4gKyAqIENvcGllcyBAcHJsIGludG8gdGhlIGpv
YiBhbmQgdGFrZXMgYW4gZXh0cmEgcmVmZXJlbmNlIHRvIHRoZSBlbnRyeQ0KPiA+ICtwYWdlIHNv
DQo+ID4gKyAqIG93bmVyc2hpcCBjYW4gdHJhbnNmZXIgdG8gdGhlIFRMQiBmZW5jZSB3aGVuIHRo
ZSBqb2IgaXMgcHVzaGVkLg0KPiA+ICsgKi8NCj4gPiArdm9pZCB4ZV90bGJfaW52YWxfam9iX2Fk
ZF9wYWdlX3JlY2xhaW0oc3RydWN0IHhlX3RsYl9pbnZhbF9qb2IgKmpvYiwNCj4gPiArCQkJCSAg
ICAgICBzdHJ1Y3QgeGVfcGFnZV9yZWNsYWltX2xpc3QgKnBybCkgew0KPiA+ICsJc3RydWN0IHhl
X2RldmljZSAqeGUgPSBndF90b194ZShqb2ItPnEtPmd0KTsNCj4gPiArDQo+ID4gKwlXQVJOX09O
KCF4ZS0+aW5mby5oYXNfcGFnZV9yZWNsYWltX2h3X2Fzc2lzdCk7DQo+IA0KPiB5b3UgY2FuIHVz
ZSBoZXJlIGRlYnVnLW9ubHk6DQo+IA0KPiAJeGVfZ3RfYXNzZXJ0KGpvYi0+cS0+Z3QsIHhlLT5p
bmZvLmhhc19wYWdlX3JlY2xhaW1faHdfYXNzaXN0KTsNCj4gDQo+IG9yIGlmIHlvdSB3YW50IGtl
ZXAgaXQgaW4gcHJvZHVjdGlvbiBidWlsZHM6DQo+IA0KPiAJeGVfZ3RfV0FSTl9PTiguLi4NCj4g
DQoNCldpbGwgdHJhbnNpdGlvbiB0byB4ZV9ndF9XQVJOX09OIHVzYWdlLiBUaGFua3MhIFRoZSBX
QVJOX09OIGhlcmUNCndhcyB1c2VkIG1haW5seSBiZWNhdXNlIG9mIHRoZSBkZWJ1Z2ZzLiBJZiBk
ZWJ1Z2ZzIHRvZ2dsZXMgdGhpcyBmbGFnDQp3aGlsZSBhIFBSTCBoYXMgYWxyZWFkeSBiZWVuIGFs
bG9jYXRlZCBidXQgdGhlIFRMQiBpbnZhbGlkYXRpb24gam9iDQpoYXMgYmVndW4gaXNzdWluZywg
d2UgY291bGQgcG90ZW50aWFsbHkgdHJpZ2dlciB0aGlzIHdoaWNoIGlzIHdoeQ0KSSB3aXNoIHRv
IGtlZXAgdGhlIFdBUk5fT04uDQoNCkluIHByYWN0aWNlIHRoaXMgc2hvdWxkIG5ldmVyIG9jY3Vy
IG91dHNpZGUgZGVidWdmcywganVzdCB3b3J0aHdoaWxlIA0KdG8gd2FybiB1c2VycyB0aGF0IHdl
IHN0aWxsIGhhdmUgcGFnZSByZWNsYW1hdGlvbiBvbmdvaW5nLCBldmVuIGFmdGVyDQptb2RpZmlj
YXRpb24gb2YgZmxhZ3MuDQoNCkJyaWFuDQoNCj4gPiArCWpvYi0+cHJsID0gKnBybDsNCj4gPiAr
CS8qIFBhaXIgd2l0aCBwdXQgYWZ0ZXIgYm8gY3JlYXRpb24gKi8NCj4gPiArCXhlX3BhZ2VfcmVj
bGFpbV9lbnRyaWVzX2dldChqb2ItPnBybC5lbnRyaWVzKTsNCj4gPiArfQ0KPiA+ICsNCg==
