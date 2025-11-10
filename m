Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F444CCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 19:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFD510E384;
	Mon, 10 Nov 2025 19:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gbq9c1ng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D610C10E384
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 19:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762803947; x=1794339947;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eYxONvKYvzNXgGOurXAQGkN1GuNt1EUFFlul1OB8Msk=;
 b=gbq9c1ngfglw352Tdxr5ou2GsEXbQgAfPEAPVsPWZeh641WeQH0r5+PB
 TyKnB9IOoL8aCWMVkb3n0ELXh8Yqjpr1grxAxJZ1hE0TD/0F/q6XEUVhI
 2vNNBG5cmzdQj7T0Np4uP3hgKijs3hHuUHomtTsNUdrEAF2p/NVFrLx1C
 TQp0vp4ubTsMucX03XPxjj1WOlSr7YN3JhjAELugRbyMY0tbLsc/l19QJ
 zZ1fqDMFjRL0ckRmzMeNkLVn65Scr4ijvv1Pnl/0Fa+EQJ6OObpDnPnlm
 Q5Ihq6Qh+7bdCqCslKlllLaDcoXiybqqcCxzITKZubFIQcd8VcktpG6js Q==;
X-CSE-ConnectionGUID: JQ9JyTLDQl6hb1CRiyI+8g==
X-CSE-MsgGUID: Z0SBZ8/tS8+MiGDE51dW8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="90331856"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="90331856"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 11:45:47 -0800
X-CSE-ConnectionGUID: bY5bk6KzS4G8Qf3cdnEezg==
X-CSE-MsgGUID: 9GP3SMJxTnu5o0yi+0HLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="193138666"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 11:45:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 11:45:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 11:45:46 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 11:45:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atmqYCum+3ts22GWWxZs00wNxqEM/flN3WFSNCxdHFsrogiO3e2+klFUKPXtd5YXHdE5I/l0YJP+0pNHbn39FOte8f2lMG6Fw/UH8t3sAsSwD6q+VepDP7triexue+EqIMDl4vc0Y/XV55874tUk/E3YHRseUUEDxvynf5/gV3mAMfShQHC/HLCR5N1ZVBUBnaKttA+Fu1BdJxS9w9L+AzGKq0YigydujtyP9V3ma8jQjdT31eMIacmJ0/AenX26kiRxYpJtMvhZXIq/9OTTRCeyBatGftXdaHvpcduDnPnjAMaKXKcJ7eyg9HfYED6LF1MDUpoKYOI7vBIDacqTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYxONvKYvzNXgGOurXAQGkN1GuNt1EUFFlul1OB8Msk=;
 b=Hk4pljAam/3Qi8QKQYV+fdMHS1GfXdthfMq+cOKSuOuTyNHoJuVfeX0Q+3aI53GOBxQ4pgsET6kfxMGF1/bhuJnA5Ag4UOpVk1nhCk2rU0cw68cFcB0ePIiqyvykRujdbw7/E2SO1fxKaY1mz2S4tXZIpm9Dnicfdd9x2OAjZFDzyKaJGLe8QpPMUcQ2733fq9HRfxASM0RKK6eeeK3aitZrJxlYl/9lz/BlMy6JIe24zCeKBPCVHps0X9MQqqKH/Md4RLQmJ/43ztH3Y/SRfdL3oFKycOiTfnsCJanUDUsanl7OOxJLT5Iv1M07HmEwd4OaR5Rc4vLj66fsC0S6aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6976.namprd11.prod.outlook.com (2603:10b6:510:223::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 19:45:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 19:45:38 +0000
Date: Mon, 10 Nov 2025 13:45:35 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: Re: [PATCH v3] drm/xe/guc: Fix resource leak in
 xe_guc_ct_init_noalloc()
Message-ID: <6psimf6gkwdel5jhp6ldpa2yfmyjsy4o43isyiccgeqmx52gb4@z3h2l7a76g7u>
References: <20251104221613.795865-2-shuicheng.lin@intel.com>
 <20251110184522.1581001-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251110184522.1581001-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: f16d1133-860d-4ad1-220d-08de2091b8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVFsYldmTjVGYVBTcHlVejFnbG1iaS9OMDYrZk9sU0RnVFVvYjBLeEVyZDJJ?=
 =?utf-8?B?eG95aVBSV0wyMlVkTlRYSmZqdDNEbWN4YWFncmt5MjV2VFI3bEZVTkNqdWY1?=
 =?utf-8?B?R0hDQXMzNUFKZU56bzNZWis4R2h5ZXkzVFAyRW5EZHdhYkNyVnNFYU1CaElU?=
 =?utf-8?B?Q1BsZ3hiTDBqUUMwK1lWZ3dtRW5EWUd0RzErSUx3U2lQYStQTWdoZHIvdEhQ?=
 =?utf-8?B?Yi9jYmxmZ3VEeEYyMGNBV0Z4NVg0KzBXdWU5Mktmc2lwaER5YytPUENUQkZ1?=
 =?utf-8?B?UU1pdUY0dzZ1anBYUGpEVlZJdVpQanIzcXZablhIbDlTK3RKc2xGb25Cd0dN?=
 =?utf-8?B?aXBUNHhmcDM1Skh4UUZmdEplLytzNlJTM0t2Y2t1MEVjSmJ5T2pDUC9UY2Jh?=
 =?utf-8?B?T3loSm9lZ1R6YW5YaGo3NUsrNVZJQkVnMEhjZjlIT0ZHS241cDd4MUhTbnpa?=
 =?utf-8?B?QVVzN3YybU5yMkNJOC9uZnd5ZUJadkJyLzNrL1ZrWUk5d0FjSjFEbWwyOFRW?=
 =?utf-8?B?eDJUaitEM3F1KzhVOVI1L3d0bnJPTWFxU0pwUUVjNVVBOEY0WEJLVjBKenJY?=
 =?utf-8?B?OU5Bb3NDeWlCckhXeU8zclBZbzZxM1ZVOXJ1Wkp1NXRtOXNLL0ZUTWxXTVRn?=
 =?utf-8?B?UDhjRzVtQ2xEK213UzdSd21WMytScHBHRjB4MCswUEJxSE9EdE9rTTV4UUM0?=
 =?utf-8?B?Sk00OUlaQW9hVzJDTVJnSDVyVVR5MC8yYUlDUVJ5Vjd3OUlnOHozcUJQTXZH?=
 =?utf-8?B?dE44VlEzaytIUUdLeCt3TS96TjEvZmRMNVY0dWhmbVNRVGVNcklSTVdhYWVI?=
 =?utf-8?B?Uy91WmZtTXZ1d2szcVRoK3hzaVJYUDVtOXprRTNOYVRnYytSSGM5b052T1VK?=
 =?utf-8?B?ZTNTWmttZFpBVWtYV2xKa2MrWG5YcVpsNkNrdjJ0RVU2MkRWQ0N6cFdlL2lm?=
 =?utf-8?B?Z2VhQmJEZUtob0FWaW0yY3BwVW5yYlBobUlKNHVzdGhBZ0c3T1UzbnVLbnI1?=
 =?utf-8?B?YmpqbEF1eGEzaTl2V2xrZUZKdldyU2pzMDRQWHZKem9aZTYwV0xXVENDWEF4?=
 =?utf-8?B?WUFIMUcra1VGWldDL01XSUg4ZkR6SzRldUZIZ09nS1QvK0M4VFhKdmh4Q3Rm?=
 =?utf-8?B?MHN5ek40WVhTd0djVmR1N29ETEY0b2I1UVBkTFlJNEc0NjRScjZWdTFwMVRY?=
 =?utf-8?B?SmJVRGhFUUYzNFc2aFZhaHZ0eUFrWm9pMy9YcUIrSFp3K2hEZHRHdVk3dXpD?=
 =?utf-8?B?NlRyTE1YRmN6VjZiYUZmS0RrbjNLcVNlTklUTlhncy9jdW52Ty9ycFZjZE9u?=
 =?utf-8?B?Zld5d2FUOHFzODFQSGhtc01ndWZwbzhUdXRXeXZrWmtMUUNLV2l4MDVHZitS?=
 =?utf-8?B?N05LM1NDUjJLa2hUdkRFbTJ5dGtuMGppQzdUK09iYjRBUUczd0hYbEdRdjJz?=
 =?utf-8?B?S3IwQmFPRzgxWFYvdU1uOWEyU0hnbmpOUGJqNTlOdlE2bHAyVDh5Q3NscUVq?=
 =?utf-8?B?MFZyVENSVndHWldRMXk5YytJR2tkdExBNE1yeGtkTUtjU3ZZMmdjN2w0Z1VJ?=
 =?utf-8?B?SlhWV2lDNFlNQ283ZFZXaStBME5QK0FqTitWU1h0VFBEQUVhNjYvRmxDNHhp?=
 =?utf-8?B?UlBYS2NPMGNRL0pmZGNIbVhyYUJrWEIyeVdvRnZaUmhBclE1cHVjd0NTeEpV?=
 =?utf-8?B?U2pEd3FXODdWSU51bEQ1dlcrZEI1bTRicXZKbUNKMUhwUG1kZEVOQ2V0WGxs?=
 =?utf-8?B?dzZNb1hIa0ljWUtSMXR3bVhLS210bjZHSVQwd0hNVkJYRkJyQ0ZHU1YyVEFL?=
 =?utf-8?B?YjV1RzZ5Y1pHQUMzRlFQOWN2WkVqUWxzRUVGek5DRVR2OWZWdVZBTmRDT2Uv?=
 =?utf-8?B?M09td01hNDZGNVp4NkZjajkyZUtFTXRSUnl6a2JwL2prK3JBVzZXQzd5clpH?=
 =?utf-8?Q?rvmrYYj95vFrEyfEJnFAXMf4FapSpFhc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THFQMHQ0V1Vwbys3VnZiaGFWTHFpSzg1ajA3MFlHOTNuVGtHMDYwRndFajcx?=
 =?utf-8?B?T2luR2Vnbm8zV0tLRlZWbFlOLzRnbloycklSRmhkRW1JcXFvY0luUWdzQlVv?=
 =?utf-8?B?d0U4b2dvWjdMYjU1ZDZKUDJrVHJFS0xpd21HeDJoZ1AyMlBZTU1JOHY5TEFS?=
 =?utf-8?B?cUpaZnpYL01KOU94VTlGY0g1bUxFK1g3d3VvZE9NK1kvWXRPb28zM0hzVlI5?=
 =?utf-8?B?eWx1VlVOYWR4cmUwYzJ5YWRXd0NPTElaVWJ5UDBNQjJhSnFWUE5RNi9LVlVa?=
 =?utf-8?B?aXRMSi9teks3djV3TW95QVdoUnM3VjdmMTNIQW45U0piODdON29OZ3d2TFEx?=
 =?utf-8?B?aUNYNTZaQWt0YUFIY2ExakVkbmh1cGlZSkdVaGdOZHUyek9iU3A5aFdHSGZM?=
 =?utf-8?B?YTZOeDhpM0pKZHpsQmZET1JkNDVrT1VvWUNVekNDSE5Gb245akxvcVdGTEtG?=
 =?utf-8?B?eEhIV2VvekZkcXhYbkZXTEhLaWdqM2FFYklPSUR6VFNWZmxKd3RQS2VpM3BI?=
 =?utf-8?B?R3FlV1RxdHEvU3dTUkZTSDNWWm9zeHhJQkF5Mk9vc2k0TXAyWmo3S2RCd1pH?=
 =?utf-8?B?elJDbWVLek5SUC9vY1plYUNwNWJtSTJ1S0UxWUJVWTVkMkZwS2Vsd01XbWZs?=
 =?utf-8?B?ZVExYjVuWFRhR0xQYzhrZW1SNVpReXdMZTYvWjdCeGJrSUhub2VITG5LTzF0?=
 =?utf-8?B?WGRGaGdSRTU0a3dDRUs2WnJwZWpXY1RKcFEzZzhrZjM5ZFJRODduVkd3dkNH?=
 =?utf-8?B?T3AvYjNIWjg3UEdic0VPVStFMTlxSFVpaTVESnFjc3dxZ0h1ZUdPZ3dBYkNF?=
 =?utf-8?B?SC8rbWlZai95SVZFWHdndGhlQ01DWEFJVXU2akhYT2x3eFBuWldjWTFFOWh1?=
 =?utf-8?B?WkpkVk9tYXJLR2NrNFgwK3JpYUI0VXRIMnUzOUZmZzg2R2NESVk4a1Q2TGpQ?=
 =?utf-8?B?K01LVTJycng4OWhPMmpyd2EyaVh4V0VaYWVPZEcxZndLL1ZJdlkwUE1RM1ZP?=
 =?utf-8?B?N0lhVEVscENJYnF0d01ubzVOS0l6QUd3a3ZlaCtKNGJTYjFXemFZZndZNkFM?=
 =?utf-8?B?eEdSRG5Db1hkeVM5VFJUSzhQelJEbk9IYklzNzIrVEdRV0lqcVk0MXRpOWs1?=
 =?utf-8?B?TmhMWlZKU2JSMzlULzlZcXZRRGR6aTFYSmt4bnQ1VVA0dHV2aHQ2ZDhNSXBU?=
 =?utf-8?B?OW1SdW5sSXRiT0kzMG1tNCsvUUtQcE1tR2twcUJzZW94c1pvYzF0SEJ4dzRW?=
 =?utf-8?B?U3U2UStDcGpCeW9CckhxYXFEZkVOWXluNzUwQU9vNDhQNExDUnYzTGIzTnRI?=
 =?utf-8?B?OFpZSDNWdFZDVVN3N0ZqOStKTTdid1hyaEFnUWJCdlROVnc3dEVIZFo3Zlpa?=
 =?utf-8?B?b0cyZG1KdlNEOURkS2FJNzFaM2FOWGV2dTNEUGc2SG44WllrUUJPdVhVMU9q?=
 =?utf-8?B?dlpkUFY3am5aNU52S2x2aWQ4bXVKaUdnS0hzQVJVMWlSSFpxSS8rNE43eEkz?=
 =?utf-8?B?VHI0Rk5oanV4TFVkK1Q5SEZUZnVkZGZuNFk4bEg0anlnQUVkbnc4TlluSkpB?=
 =?utf-8?B?Q3NCNVQzTzZQTHNNaDh6Z2tGZ1lkc3U0U0xnVlV4V0ExNWI2Y0Z4UWdVZVpT?=
 =?utf-8?B?bEY0a0pYaGx4cStRelhBSTUrQmluNjNNbXlKc1pqRUlWZlAyRkVTMkFWMEN3?=
 =?utf-8?B?Rk9ZUHVVT280LzZ3UkVkZ2x6MmlOajdSck02dUdwLy9QQ2FBNTA5NnFSV1Mv?=
 =?utf-8?B?aE9jcW1aMGVidnNYTkNkUTRSVWJsd0lmWUNaMFhqU1JjajhvRm04MWpueUVC?=
 =?utf-8?B?Y2l1WmdlN0xsREMwWUFNS2ZaM0V1RGk1dFJKN1p5YXk2S2p0dXlUVGtPMFV0?=
 =?utf-8?B?eFk2TlFOZUc3N0ZtaDNtaW9ja2xFNGlmcE1xUVlac09kcDRvUTc1ZnNYMnVR?=
 =?utf-8?B?TEVzajRhS1ZFQWlBd3hlYzFsM3QxNTV6RHlpT0l3U1k5TUtobjZ1M1ZnWnZE?=
 =?utf-8?B?YVAxTmQ0MWtqSXNidFRKcFNHMGVzNm1DUitvdVNVY0xWTklUcFZwRlNoOWZj?=
 =?utf-8?B?MWNzdTg4V2lJcUp1alFnK29zZEE5Nyt2Y2dZNFhSWWc5UHdoK3RzRVlkMysx?=
 =?utf-8?B?VXJlaDFjM2Y5NllMMEp4TWVHQzFvT1FIeVh1T25MQ0ZVNEEzSFU1SHNhbkJH?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f16d1133-860d-4ad1-220d-08de2091b8d0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 19:45:38.2252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YSyqIfvnz/GPuvhFbNkhVVZO/pRKQUtV3npIpyue+nlKh6CUm9RvV2+PkrIsjQHp0Sb+btqFLaS3HUmyhn4rr45PD49FudmQoxrDOKb31A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6976
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

On Mon, Nov 10, 2025 at 06:45:23PM +0000, Shuicheng Lin wrote:
>xe_guc_ct_init_noalloc() allocates the CT workqueue and other helpers
>before it tries to initialize ct->lock. If drmm_mutex_init() fails
>we currently bail out without releasing those resources because the
>guc_ct_fini() hasn’t been registered yet.
>
>Since destroy_workqueue() in guc_ct_fini() may flush the workqueue, which
>in turn can take the ct lock, the initialization sequence is restructured
>to first initialize the ct->lock, then set up all CT state, and finally
>register guc_ct_fini().
>
>v2: guc_ct_fini() does take ct lock. (Matt)
>v3: move primelockdep() together with drmm_mutex_init(). (Lucas)
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks,
Lucas De Marchi
