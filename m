Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1C2CAC583
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 06:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFD910E08A;
	Thu, 11 Sep 2025 06:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhb3klK1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9341810E08A
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 06:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757572711; x=1789108711;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y8MTid3zl9dePzJPmf1fGOwNTW9oCD+zziBDmnus+VI=;
 b=mhb3klK1+H4zUARJbRymJowBFu4KYtqEi5f3UTzAHsk6FaRkJ20tSVwn
 0BImkfUO5gmstcG/PaJkkKd+ajQhflZ1eg5I1zPMe8VGe0+OU+TZR11TS
 VEJv/GiE1hHAKxzcUtX3+NANtHfEgDMIg+2JVpEuEc4lfXA7oyDSgPTln
 wZIgyBIEcMYPSVcV14y1FKbp/HhRf6vNsc4DKtljbide1H2Np1YkEQLIr
 U2pj5rZwpp1dia3WtCw09OHN3pSt31PsqasVICfPR888BDE3wKwgvdsD8
 0RvYqrJVhxmx03gCmDcWaf4+BLtwiPagtS8IrlktmRIdE7ipLfLoUD3dc A==;
X-CSE-ConnectionGUID: 0IHfvWqQTCO3zoYZ/QxNDg==
X-CSE-MsgGUID: bDmiCS6WRCSdGQnWHbCaVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63723883"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63723883"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:38:31 -0700
X-CSE-ConnectionGUID: WOrKqEvjQ12X8aqTY3vuqQ==
X-CSE-MsgGUID: 4a5qJsWWSbaJagFk4ne0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="178809124"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 23:38:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 23:38:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 23:38:30 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.71)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 23:38:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SeMz1AJ8bm9x2wRO1m0ljQtzEnjYnRhLLREkkCUKBJFVgywZHgQpeCcu2p3XsuItI18hCBaofv2pv6ryDpJy3vuen74LuI5Qdpt2vwS+IgLSlQDFMbH9/ss0QVILEyaitLxc1NipuMK1CDmhPYuHLD57P3YNw4e0Jz6TreMVuXH5mdAsF5Z1DSxUAF+Q730O1Ua4O3YeE4wn0ZjhOzIzSLk1e5TzTWwXp/8U3a0MgCBkT2ObVtp/QHhQ2gf48DugD7sfgl8Hqh70dRVTRH/Q2Rw9eYQjB/S6/+5a4dx2HimEzxwXYK0/ZWXOd/pF2Q/ES1yshV8fFwuKQ732Uu26NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8MTid3zl9dePzJPmf1fGOwNTW9oCD+zziBDmnus+VI=;
 b=Mxv4eeUkrEnhNoxcitPatwexVikiwCluQj0MqmahRt02cRPagWObKcz291U/sqEPQfRBvqUxOTOTN27CyDtpROUPnJhbzi0XmmI05JhZ9puxLPa1uljfXtOPrWempB36mvqUED0UNYgxv9/duCrYRA3QMTGm8KQLCr4ZHw6OxNsoT/t9xx7wsw23e3HUqq9XVjLV3Ijss1f/rRKnz6NeMs834E8NJVPr+0ECPsEZn+x4I34gczZ5PcZdmVwhfepkKvfUufTUUJELfAZ5U01FVGu7XyA/SNtPK91Ma/nTsIi0AJxLwbaJZYdz8qRX8cdctLiUuOfuqYDpSLCgQMDlLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM3PPFB7F00E099.namprd11.prod.outlook.com (2603:10b6:f:fc00::f47)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 06:38:28 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 06:38:28 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: RE: [PATCH] drm/xe: Fix uninitialized return values
Thread-Topic: [PATCH] drm/xe: Fix uninitialized return values
Thread-Index: AQHcImVWEYL64IqtUkavt0BMVY+M7LSNiHpA
Date: Thu, 11 Sep 2025 06:38:27 +0000
Message-ID: <SJ1PR11MB6204BEFBA30136D091D040E68109A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250910151128.49693-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250910151128.49693-1-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM3PPFB7F00E099:EE_
x-ms-office365-filtering-correlation-id: d7d7a002-b26f-4c60-b91f-08ddf0fdd0f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?azdvWS9vbU5wcUFZeGdvN2FhNThib3ZON1M2K2dCejcxb3V5YmhwUVJTYTZF?=
 =?utf-8?B?aDUxRjc3L1h3UHliaUhaZHVjMkpleG90Vko2OGpqdktJT1JyTlBLNSszSFdW?=
 =?utf-8?B?TDdPeE83czUrOTBEMmxJaGIxakdSbnhvbFhaVVluMW8rQzBCQzFSK0NpdTFn?=
 =?utf-8?B?ZndMalVPYmZUeTJxempRcmhPamp1bVpOUGtVeGxmczRGWkpha2Fpc1lxZVhS?=
 =?utf-8?B?SjMweUdsSWMyWDU2c0NOcjkrcjEyR2VBSEFwcGRYc1JpNU1KQzF3TGxmQmJQ?=
 =?utf-8?B?ZmdNZ1pTWmdQT04yL0V3aEJxcEI2RmcwRE00ck9ScHo2dnh0UkIwbVRhazZK?=
 =?utf-8?B?dkJZK1JueVVYRHBlOVgrR3Z4Qm94UE5Za01ucnMzQ0tGQVpwMWM3MkFGYTlL?=
 =?utf-8?B?bWlVempSVURNWG9kWmdrcnM0ZGRnU3M2YStuMThJLzFZdXl1UVh0MEUrekpB?=
 =?utf-8?B?WjJIam5JaDJzT2poTFFYWkw2WnJWaFdhWXFkTDh2ZGVEaWw4ZHJRdVVBRXpV?=
 =?utf-8?B?RjdkMFRnYVUwWVQwdFZWZ2VCeE1GNUJsUjZ2cW4yMzNocGVYcUxSV01pL0s5?=
 =?utf-8?B?NUhJdTZPNkdkYWt3RkV5QkRpaWFlWTgzTE1GNVRRU0hxY0JvVzJ3VjlRK0JJ?=
 =?utf-8?B?bUt2OWhKS0lmVTJEKzhvQWJSdm5DMythRGUvWjd6ZVdnM0VEcVl1THV1NWJq?=
 =?utf-8?B?cnEwUDNLS0FSZUJrdFJtT3ZZNXBZWXRRQ0NKNXQ2by9zTS9qL0pOTHo4ODM2?=
 =?utf-8?B?RkNyeXlONlRtUnVJS3Rpc2dJRUswWlpuRC9hd3daZm1YcVBoNXZiVEYvZ09D?=
 =?utf-8?B?Uit4N25YWnFIeVpWVTVGLzB6MGVwd2FDcXRHRmx5RThBZ3lWVFVlT3hTbzM1?=
 =?utf-8?B?RDVuTThnVmg4V05wOENRcS9sT1A1NWhUSGlSMmtmUS9xQlhmS3puUEY3OGsx?=
 =?utf-8?B?UmkyYURVVnJBSElkRENzSE0vcVFFVXl3bGFDdE9DbE93WjdKcFlzUkkvYXpy?=
 =?utf-8?B?U01CWS9rTXZ6S1lzQWNrZTRSbHdqRnRneGV2azdYUUVhUm9NbEVhL0lzYUta?=
 =?utf-8?B?R01jTlRyclREK2t6ZzZ3cVNDMkVDU3lKK1BQYVVmVk1NR0I4bmpGN3I5SElQ?=
 =?utf-8?B?NzlrRFQ3UGZ0NlBPRmNSMFpkSnVlcTEvLzh3dzYzZi82bC9VYXA1YWhuYk4y?=
 =?utf-8?B?SlBXVGlKeUJyNlNHbjZVNVMvNS9VZkdMcGhZclJ0V0NGOFBOUUJqU1dudG14?=
 =?utf-8?B?amw4S29rU2dsQmVQd1Y4MnRmemF3bGlhTEV0V1hVMkZ1c3hDcG1aTlVnT0Yz?=
 =?utf-8?B?Zy8wbUpTNDVTWWtIaDhPdUVua0JsOTRhSHVKYUtvYnZ6UGdrMSs3QUE5eXNU?=
 =?utf-8?B?SDNEbXh6cGhYS1RCZW5zOVc5SEY3eWRMUlBObUZoUE1ia1pMY1IzWUZEYW5E?=
 =?utf-8?B?UDcrZ1d5ZWVBZFVNTXR0dkw4MDFaYjFpMW5EeU1FanY1czhYZFJIMG11WFZ2?=
 =?utf-8?B?NGoyTW5nazFGaE9MNzhVRWpIYk4zbng0b2FqK3BmbHg3ME9uREFWeU82dTFC?=
 =?utf-8?B?RTBNK2JwVDBiaDc5V1RydXZPVk9BWWlGNlMzVkc1TWc2eHFFcnFWNGU1cndp?=
 =?utf-8?B?OE5FOHI1OTdyT1EyYmlvcEh4V2o1ZkxaWXRrcTVRcHdXYnAybW1MZ09KanpF?=
 =?utf-8?B?bEpPbHh1eWwrS1pxalI4M1UxazlqUGx3WE5ETDFIckFvTitqSHJVbTZIUlo5?=
 =?utf-8?B?cnhHSzg0TXhkTUd2SVNIWnc0Nk9KeEtjZ0pZdEdRNExIQjJQWUFkeUJUY0Nv?=
 =?utf-8?B?T1VyLzRhMlNJTTNhSEhGb1I2K3hwM2dWTE9Iek81ZkloOGJMMFpqMzlEaFkw?=
 =?utf-8?B?aThQL2RwVjBrNmFqVk5ITWpGTVRVZ1k5QTBRWEFiWlQvdVZvNDhBYUk3Zis3?=
 =?utf-8?B?SDhuQ1ZMWENpVThWVmFhaUUyeGJlWFFSY0liWjJrekM1Sm50czRJVE1vbTB4?=
 =?utf-8?Q?LfIOSRh9T6JBzS4zWOtJ+JQumKix6k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0x2OGkzOEpOa2J0QWkydVZNbEUyRHZhbEZZODFIZHM0a1FSRHh2UDVqRy9K?=
 =?utf-8?B?dlRXVmFkcjN2YzBreGxONW5IMkRubXZKdEhuS1ZJdnlvTXBONGlzd1Rsa05O?=
 =?utf-8?B?a1A4NS92a0Nra2NlWWhZbkpjUXF5eERZblRid3pFN2pqS3M2eDlyV0Y3cHMr?=
 =?utf-8?B?ZURWSjBFN3hKZ2N5WkFucElXaGJkK3dSZzRza0pTZXNHTVpGbkd5RTZnNU5l?=
 =?utf-8?B?ajRoa2lBRzJ4UzFRaGdmMWUzVVBWdW0rRVZPc09YOXNpeGljSUFIQ3N0SzRz?=
 =?utf-8?B?aHZhUkoyamZZSjI2YVpCdnN5NGpvZmk2b3F0QzNPRjRqN01lSVhWSENxbHRi?=
 =?utf-8?B?bGttaFNPOUlnVmhGa09XelFBMXliakRYb2x4OC9vaFF4UmVEbEpDbWU0WWFD?=
 =?utf-8?B?dUlVOVdIeCtONGkxa1Jrelp2TnhzRkx2SUFJZy9ESi83L1R0YUtjQjNJdmRN?=
 =?utf-8?B?Qk1ITHBTU1drdWZxcFU5Y3NWNWY3YmZPSXBsdWFpTHVPQ2Q1bUJRUllpVFNI?=
 =?utf-8?B?eDk0TFNpRjQzbjNhU2RKOWgwdUVPR2ZRdWZUVGlKV25hRURSTDViMVBKZ3R5?=
 =?utf-8?B?Nm94SnpibG45b1BrcDNCZ2xuellKYVhudUhyTGRhU1MvbWJGTStyUllPa1pN?=
 =?utf-8?B?Zlk0OXJ0bDZHUGJNTjE1dnl1UUorODRvNE1oUkpveDlBTFZOR0oyT3hqSHRM?=
 =?utf-8?B?SVpwY2doTHdLOWllUGQ2Vi83QldFUEtleXJVaWlWa0F4N1RpRU5DdzE4VmRs?=
 =?utf-8?B?Y2lyZ2ppV281SFcxdmdTWU5nSEg0alc2dVJYVHFJUUtyUjIvMWVsaDgvbEZC?=
 =?utf-8?B?czhIeHpodFIwYjlhQytNcXpUZ0FMQlNIYTNCWGJpamM5eWh6T0h6Tk5iemZ2?=
 =?utf-8?B?ZWRZaGpWRjJBTzlRWUhSWGxvZDU4TlBFSWQ3M1FFaU1lTkVVanFXV21BNklq?=
 =?utf-8?B?SDAydzY0ajVjMVFYQms3cEU5ZE9ZRm4zZVNnOTFEZHRTeWdTL3FneXVpYStj?=
 =?utf-8?B?U0NpM1dxOTloczk1QnlNU0xsZjdDN1pVdnlOZFBPMWFUTXdRSTdWZWNTRGRW?=
 =?utf-8?B?d3lmd2M2WnJKNENDaVZGMnZaODJPY3NyQ0NUeHFoMG9pU2Uwdk4ybHFpWWhR?=
 =?utf-8?B?VUZKb0dwL2FFV1dYNDBncjdvMCtvNndrWW92OVB6RVUrVFZiSUNweStOdSs3?=
 =?utf-8?B?dHk2eDcySGwxbHlBSkljR0VTWFNIdDZNSkpyclU4RlR0dXZnQXAzbE42Q3dL?=
 =?utf-8?B?blIxYlF6UnpUSmQycWh1SnU0bGlodnZramdhUXdGa091NzlabG1GbnZmNzd0?=
 =?utf-8?B?cEZxZVFyS3dXbzEwSnFUY2dFb0JTMGsrTEhLbjg2eVhzcDZNWTd3Z0NXRldS?=
 =?utf-8?B?SUV2SDJOSm0xTVRnaURIR1VRUW1Vc0YxTUltaHFRM2NCK21RMlFITEI3Y3RX?=
 =?utf-8?B?aWdTUFZFb1UxSnFyMzhGNkd1RzdreWRVaUhvRnFaWWpYRVBkbnBYem1rRTVB?=
 =?utf-8?B?dWMraFlaem5ZMXhWRTcvVDdtbHBGcHl4Z3dVUHNGS1drM1pHa2E4WStYWVFG?=
 =?utf-8?B?S1FnbnBzSm1sRDJmZ3FTK1krenRVY1IyQ0IvdXhYTS9VTFhwR1dGTHBMc2lD?=
 =?utf-8?B?NkVEQTMwV2tUdmJielpZYnI5ZkpndmdENXhvdUtUOHptbFhNTGpyaDVzd2VW?=
 =?utf-8?B?d2YzVHdacVFMZEdsbXFPdStTbzFRdmxWeXdMZnprR1JmUVNYUmFwdEVPSzJE?=
 =?utf-8?B?SVVmK3RRNHY5RVZzVVg3OGxsUVRBckVxTlBrN0lFZkorR01tVVU5LzZrSUhi?=
 =?utf-8?B?NHVpNm1sOHpvZnBjVGNnMmFObGgzSzF4SHY2cnQ0RkRVWVVqZ3ZuUmVmL1A3?=
 =?utf-8?B?alRwUzM2WDBnMFhkaTEzaDVZZlMwMG8veVZ2TGp4angwZGFWbWdjN2xJU0FZ?=
 =?utf-8?B?RmI5RWFVS0tGQjFOaUQwaUs2TXUrRm1Sd3pBemNoOVR4ci9Mb0xLZFQvNHdo?=
 =?utf-8?B?MmVla2dTdGcwN0p3RGt4VmY4ampISUZYSG56RXJDTlRObmZTUUl6WU9LY0Jy?=
 =?utf-8?B?M0hPTjZPMHZ4Z2NVVGhRK2YyRXB1YUtHNHFwOFpOcklrTDRHcURKblVtdDFa?=
 =?utf-8?B?ck5IK0tvMUFONGlkOG8vcXEvUlJJektwdlhjYVZBZk5qekV5dXYvOGptR3U2?=
 =?utf-8?Q?ju70+EIJb7fZMxdEPiPkKXsiEBDtX/GgMLhCrt9KOIa3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d7a002-b26f-4c60-b91f-08ddf0fdd0f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 06:38:27.9516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6tU6/Fd0MLHyGrU3qwFXCfV6R2Ii6evASy3q+VP4M/Ne+BB7H9UUvfjCxFITt5R1DjlMtLIUavGdLJmffMY1aaN4MHnlWBB7p+Z9FbvnlHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB7F00E099
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGhvbWFzDQo+
IEhlbGxzdHLDtm0NCj4gU2VudDogMTAgU2VwdGVtYmVyIDIwMjUgMjA6NDENCj4gVG86IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21h
cy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcNCj4gPG1hdHRoZXcu
YnJvc3RAaW50ZWwuY29tPjsgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNv
bT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0veGU6IEZpeCB1bmluaXRpYWxpemVkIHJldHVybiB2
YWx1ZXMNCj4gDQo+IGNsYW5nIHdhcm5lZCBhYm91dCB0d28gdW5pbml0aWFsaXplZCB2YXJpYWJs
ZXMgdXNlZCBhcyByZXR1cm4gdmFsdWVzIGluIHRoZQ0KPiBleGhhdXN0aXZlIGV2aWN0aW9uIHNl
cmllcy4NCj4gDQo+IEZpeCB0aG9zZS4NCj4gDQo+IEZpeGVzOiAxZjE1NDE3MjBmNjUgKCJkcm0v
eGU6IFJld29yayBpbnN0YW5jZXMgb2YgdmFyaWFudHMgb2YNCj4geGVfYm9fY3JlYXRlX2xvY2tl
ZCgpIikNCj4gRml4ZXM6IDdiY2I2ZTM4YzE0ZCAoImRybS94ZS9kaXNwbGF5OiBDb252ZXJ0IF9f
eGVfcGluX2ZiX3ZtYSgpIikNCj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50
ZWwuY29tPg0KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGlu
dXguaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRo
eWF5QGludGVsLmNvbT4NCg0KVGVqYXMNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvY29t
cGF0LWk5MTUtaGVhZGVycy9nZW0vaTkxNV9nZW1fc3RvbGVuLmggfCAyICstDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYyAgICAgICAgICAgICAgICAgICAgICAgfCAy
ICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvY29tcGF0LWk5MTUtDQo+IGhl
YWRlcnMvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1p
OTE1LQ0KPiBoZWFkZXJzL2dlbS9pOTE1X2dlbV9zdG9sZW4uaA0KPiBpbmRleCBhMmQxZjY4NGEz
YTguLmYwOTdmYzZkNTEyNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBh
dC1pOTE1LWhlYWRlcnMvZ2VtL2k5MTVfZ2VtX3N0b2xlbi5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS9jb21wYXQtaTkxNS1oZWFkZXJzL2dlbS9pOTE1X2dlbV9zdG9sZW4uaA0KPiBAQCAt
MjIsNyArMjIsNyBAQCBzdGF0aWMgaW5saW5lIGludA0KPiBpOTE1X2dlbV9zdG9sZW5faW5zZXJ0
X25vZGVfaW5fcmFuZ2Uoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICAJCQkJCQkgICAgICAgdTMy
IHN0YXJ0LCB1MzIgZW5kKQ0KPiAgew0KPiAgCXN0cnVjdCB4ZV9ibyAqYm87DQo+IC0JaW50IGVy
cjsNCj4gKwlpbnQgZXJyID0gMDsNCj4gIAl1MzIgZmxhZ3MgPSBYRV9CT19GTEFHX1BJTk5FRCB8
IFhFX0JPX0ZMQUdfU1RPTEVOOw0KPiANCj4gIAlpZiAoc3RhcnQgPCBTWl80SykNCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4gaW5kZXggMjg3YjBjNDM1NWVmLi4x
ZmQ0YTgxNWU3ODQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hl
X2ZiX3Bpbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5j
DQo+IEBAIC0yODMsNyArMjgzLDcgQEAgc3RhdGljIHN0cnVjdCBpOTE1X3ZtYSAqX194ZV9waW5f
ZmJfdm1hKGNvbnN0DQo+IHN0cnVjdCBpbnRlbF9mcmFtZWJ1ZmZlciAqZmIsDQo+ICAJc3RydWN0
IHhlX2JvICpibyA9IGdlbV90b194ZV9ibyhvYmopOw0KPiAgCXN0cnVjdCB4ZV92YWxpZGF0aW9u
X2N0eCBjdHg7DQo+ICAJc3RydWN0IGRybV9leGVjIGV4ZWM7DQo+IC0JaW50IHJldDsNCj4gKwlp
bnQgcmV0ID0gMDsNCj4gDQo+ICAJaWYgKCF2bWEpDQo+ICAJCXJldHVybiBFUlJfUFRSKC1FTk9E
RVYpOw0KPiAtLQ0KPiAyLjUxLjANCg0K
