Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33861C3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 11:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0510F89322;
	Tue,  6 Aug 2024 11:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Psh9EJHi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3FE89322
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722943163; x=1754479163;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O0UhrDTUr17dOfjCpl8MJhlLNi9NyqjxOMICH41GNiY=;
 b=Psh9EJHivJhvFiFsJMXfXO+2S65whLv5H5InhurXyDOCPrZXG5HR72Ub
 oiv3vGV0HSYNe3tOZWr1NxFE8UE0xflu/5gPVRnmzmd4+a39WCNweZ0WQ
 0yXN2eYQhUAaDgAKP77f/f8cB7pilIAmlJsdsl4Z1+YN6V9LfEJlV6vyS
 fDrjX22l0NPW1nBmsKIPnPu1nZaoxxtn0lfyaVs+P/T+vGzIF6DWcgE0o
 B3YKlcnNRAjcr83bDLXN35ShSxfFoYbxYH2V/WBHcZ2IEUlsBqdHX204J
 UZXUcE1j803720J8tN8t9r9+QUTi06HcDZuIhEWOAm5yC7B2a0nq6PusS w==;
X-CSE-ConnectionGUID: V5LcCA9hQVa93rujW54zGw==
X-CSE-MsgGUID: RxpyZakHR62S7pcB+yk52w==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21073133"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="21073133"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 04:19:22 -0700
X-CSE-ConnectionGUID: dUBQvrlXSROaiu7skVk+bw==
X-CSE-MsgGUID: ld7CvuDnQk6QV1RCtUiO2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="61351947"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 04:19:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 04:19:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 04:19:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 04:19:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 04:18:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGgN2zAhAVuY6J07vzoSkrkmTP/anGRX3cBPHuTsHtQtuAvN8W7isCxDWEIq9nkRWAzBkKcSfe2+CNBiqKEUquftTCYWSoGHQUoVOoqFdqE9Ab6Jjx14FHs/ErfRsBz1fmhJ6+ESHB/7qUEqF8bVsng8xPWnizjVpZhyua3xRsd3Jg8CeAoyfzjA+iXayEYG5B4L1oLLqjTDfn3/iJApMJUoDwCJy3GkPuVWnIRH+7CHeaBqGfdeEjaLgiHKOf9CDEzqpYQ3WWAY1xesvyPaTHhAI2b/L24fNZqp7/ru+0hv+o7L50ACMVGe4EMLfkPtSo6cLJc270QyE13GN1ynaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ4VDMaOXJmOODT76cR7lIYw42Us2Dt8VAKdeSWpvmQ=;
 b=p0LPCcDWBd0krld5HXxiis8dTzMxKQkQbQQUNqAXbP6gbygvCPqcZoYdQ8OTFqT21pL4g4H+/42MZAzUMPYx6ZbgLsNyWqWNLLqSz8vm5C9783YwA3EPQ/nxKkv1ixiBFNMAcCAF1Wfz25V0bInG+GPwL0ECf0MExQRlr2AfJ97CMMAgII4eEQ6SFbui+UuqQNAyITIIXody8DhTErCJsZRZ7eoj98rCCgc+nVGJNaTEETBORKauLt60tF/lhauCIf1fpJzvIisrXv+qg/1zGnQ+YdlVrtxZ9G2l/kvBHdCUpF9nnV5jMiMIf4iD/Z1ARRRvZ0pAEzhzgobBchvpVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7242.namprd11.prod.outlook.com (2603:10b6:930:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 11:18:46 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 11:18:45 +0000
Message-ID: <ab8eb7ed-767c-487a-b566-fb2d501773c8@intel.com>
Date: Tue, 6 Aug 2024 16:48:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/xe_gt_idle: store powergate enable bits in
 gtidle
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240801095305.1209046-1-riana.tauro@intel.com>
 <20240801095305.1209046-2-riana.tauro@intel.com>
 <cfcf0bd5-6f45-4f82-9619-a5ca8dbc5e25@intel.com>
 <fbc79914-d4cd-46bb-be28-7dc49c470467@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <fbc79914-d4cd-46bb-be28-7dc49c470467@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::21) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 33239fca-f11a-4ad8-32d5-08dcb609896a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUZDM0xQTFRaeEg2SUF2WXBJZ2twYWo0V3A3TWMyL3p0bWN3TnlTbWw3MDBp?=
 =?utf-8?B?d09qcitQbDZraWhXd3ZyVWlwY3RzVVNRQ2dMbHVqZU5qOE10NDU5SGZoREdj?=
 =?utf-8?B?MU5YSHdtRDBSb3dFVzFnWS9CMDk2R24walpBbDJmaENwZGtFclFISHNDc08x?=
 =?utf-8?B?dUlDMGxFelFFWDFWTHBiS3JLaTFIV0VnLzlKekRYYlBqd1lJbk0vdjNBTHlF?=
 =?utf-8?B?bCs5M2dBRUx0UFdsQTJNc0xwQU54eWMrNDZWWTlsei9RUmZLTk5WY0M1R09z?=
 =?utf-8?B?QVYzN3FmMG1Ib3ByaE1FeWp1NUpqQ3oxZnpkMVg5U2V2Mmt5aTVMRGNpSVB5?=
 =?utf-8?B?L1AveHpLWWxPQktzajBwaktJZTZxY1BQQmdzOGhkL3BTUjdwU3duRzNPRjBu?=
 =?utf-8?B?UjJtcUZFcmcyVjlyM2JjL2JJdDc5aTlMSFJqcjBiYlEweG9HT2t5R1FYd0da?=
 =?utf-8?B?L0VpNk52d1hWYlRseDFTRlJpUzB5UTllMDRaUjV0Mmc0U2ZYd05aWjQweGth?=
 =?utf-8?B?K2dXUjhOSTEwUEhxejlzdGFNUldXVHd6Smt1TkdKUlVyZ0VDOWZ5Yjk5SjNK?=
 =?utf-8?B?RXZUbG53SURjMWdlNlNncEFEQnpNY0x6Nm1CeHEwUjQ1ZjZBcnpKcGtIckor?=
 =?utf-8?B?Y0tHZGVEdHk1YTA3cHN5VFJ5VThUcVNBMGtZbHpudHNiK21oNVdJUHIxeDBs?=
 =?utf-8?B?dUI2akthb2hiOUg5Z3plVGtaYWJvN0FOZVNMMVBNa2YxSXIxWjZVOGNWNE9F?=
 =?utf-8?B?UWNrVHVxeERrejBORTVMN1ovem41dUF2K2JUbVF1bFE1cDN5Rmx1d3EybjM0?=
 =?utf-8?B?cVlsZHYxNGVMYnA4Y1hRUHh2dVBXZFZpWFlNL1hZczRsMmNQTUxxVE9WNnND?=
 =?utf-8?B?V3E5a2k1TzZKajY1c3lyWEcrakkwTiszYVZWaFRwckZZR1YvRHM0dFVPb3dE?=
 =?utf-8?B?K2xNL2wrTnFMZUExd1laUHo2VUpMRlVoclBoSzZpY1hEQzRkRG5OUjZNZUg5?=
 =?utf-8?B?TDkyNnpZL2kxMHZWNHBVeG56M0ZyN3BHWGFpaVBlT1oybnFDUkpyQnlGVUgr?=
 =?utf-8?B?MVVaQ0ZTUFd5NDR3U01DT0NRaURCY2haNXdyS1ZoRmVEblVzeGZPa3Q2cXdC?=
 =?utf-8?B?QUx3Mk9lejROUW5RdEJBbklocGhXaW40VmNMcWpUSWFwNytJd2RHQ1JXYzBl?=
 =?utf-8?B?dTJaeU9NaHFmQ3ZhckRvMGI0V0JMS0xscFozYjQweHV4N3FOcEN0ak1tNWti?=
 =?utf-8?B?ZHNLcmFuM2xkMTVYSVNSMzcxN2tNTGdPYktCR3EwSUZhZWdaWFFXSWk4NklM?=
 =?utf-8?B?TXZvWW9qQXFuUGx4R05HalJmbHAvdUlQd0hGZ0xnRVJ5YzVVVldGWFo0cUhQ?=
 =?utf-8?B?VU5jMlNsYzUvT3hYT1BGME1wZldEbjd6elRueXFncjVHcHVNK1ZtczJFOHlv?=
 =?utf-8?B?RFp5UmU3UmF4djIyRk01enVtbUhKcUtDOUgyK29Bd1hnemZIVE82d2I3NExO?=
 =?utf-8?B?eSt5d2tUS0oxbmpOa1pHN3p3OXg4VGJFNkg4Qm9jUU5lZjd1eDJ3WjA0MmZa?=
 =?utf-8?B?dmtzcmRDQ2ZFSFN1enZ2eHo5a0RwWTNRMGJVTWdZKzFXa2hkZjI0SEdkY1dF?=
 =?utf-8?B?VmwvSlJsRDNNRTV2cUNiS0VWeEF1d21MaXNVNHlxbUhta1pjWEtlMlVsYXNQ?=
 =?utf-8?B?dnRjUGxqM2IrK1RSL1pHRE16RlBncmpzR01zaUJXdFdIdTZIMkR6bXIwaXNJ?=
 =?utf-8?B?eUxaN3NwKzU4QzB1S0w5UVowV3VDUjE1NjNmY3VwcHBBR2hndGRQazE0R1dR?=
 =?utf-8?B?TDBuMG42VzhGU2RUeU9idz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wll2TjNvRXJCcXlCR25oZFE1NkhhOW5NUDFuY1dCMjhkbUphKytqaEpoTG0v?=
 =?utf-8?B?TktnT3dNcTdOcEJ3ejRLcUhEZkMyaXpiNnA0WWZuaG9pSHdZbmQ5a1RTVitV?=
 =?utf-8?B?R2hVb1RwRThJcXU4ZXR2b2xnRW1IVDVPSXFHMldzam9BWG9NV054bncyUWlz?=
 =?utf-8?B?bXBMNnY4ODhjOWFOcll5aDJnRTJPbWxaL2J0RnhybUpEeUw3aEVlaE9JemZF?=
 =?utf-8?B?S3d6anpneFNQQWV5b3V2SXIvZkZmM0tZdHBiUmEyN1dDbmNDcUNUcDZoWnFi?=
 =?utf-8?B?Rmp4ZTZYcEo1bFpuK1BoN1krVFVpajh2dGo2RDNCUmtBUyt0RVc3NytQSDVI?=
 =?utf-8?B?cW50dUlJQ0U4WG9uc0Z0bTBMaUpwdjl1RUpieVlBTk9tYTVBNC9PNzF1TUt3?=
 =?utf-8?B?cENmRTB1TnFXQ21najJDWFlYRzRLUCtmaE44OXVubUIvSGV3OG93ZkZpTEwv?=
 =?utf-8?B?QzdUdXhCbWFXc05qUEV3V1I1dkQwOVk1djA5aG96VWdmZXNia04xZ25wYzM0?=
 =?utf-8?B?TTdPTk45a0ZDNjRxZkJqN1JES2Fwdjhmd0RvYllocWJlRlUwaEo1aFduZjA2?=
 =?utf-8?B?V0laSWo1RUczRmJTd0RabC9PL21zeDlGcXI4SllKNklRZ2RCZHJrT0pSaHZO?=
 =?utf-8?B?L01ZVTI4RnFSWVhsbk4zdUF3NFlpT04yVjJ5NmZyTi9vVlBJTjVFM3JFRlBC?=
 =?utf-8?B?ZFBkeElyUzFRT1pVYm1mZHZ4alZlZFI2NmZ6WVU5a0lycjJqNjlkM21xWmRy?=
 =?utf-8?B?dUFQYmY3cmNMV2RubzIvVWZzVTk1aklPNzI0L3hSYm56TXNlbjVNOEVUc3Bv?=
 =?utf-8?B?MVNZcnA1eU5xU1FLd1JISjRjRDVmTVRrNjMwVmFYc1o3U2tnY3Qzd0U2Rzla?=
 =?utf-8?B?N1hFcUhSY3V5ek15Y1Q2Y0lCM3U0OE4yMm5KMzh4SmJqcmpwSGVkeUdHU1JQ?=
 =?utf-8?B?bU9tNnpycTlONXdYaWlHRFI5Z3NSSjVYQVN1REExdEloSnQwS2kwMWJqNklU?=
 =?utf-8?B?eUJoQlgzOUU1dE81cXRHQ3pYQTVJOThEM0kwYUpXeGFBbUtIV2lRS1VLcWxw?=
 =?utf-8?B?MDZKbFNHMUZVU0FjZzZrMkpoSjdmZ0JYdy9XM09UaWRIUmxSbko5V3JEQ3R1?=
 =?utf-8?B?cFlqRlJjT1VvUUdHSk1ELzVnRHFETnBvaG5RclMvVnEzdWI3QVNSeXFMRHVJ?=
 =?utf-8?B?SVRmZjkyd0FUWFFrRXBQOWl5d3ZBcG5zZlhlSTJtam5mV1FYeG55ejV2dEZG?=
 =?utf-8?B?dGRXOUYvNEowR09zMGVlVDdJUU41Z0pUTHBlYmZpU0lPc2FXdUlRS01vaVRl?=
 =?utf-8?B?TGdCWVNacHBnTFM5dGRmWkg4ME9VTVRQQU9Yc21UTlZLd2dyT2NsQkhzNGxt?=
 =?utf-8?B?bThEYVNQa25qQlgreGJQdy96UnJIMGxOYnVTMityM3RvWjl2RExxeEJiUitv?=
 =?utf-8?B?d1R0a3NPRi84QU83OXAxSjBSbEk0a1pxTFVuSktiNk5KNmFXUU01MGVHaVBa?=
 =?utf-8?B?bWQrTmpWaUVYT1RZTWRyaEpiM2U0QzYxYUpJS2w3VUszNzdaUHRwSmgzTkp2?=
 =?utf-8?B?MjhQODc0QWt6OHVuejVPN3N2OUVNdXZBbXlBR291ZERjYm1zYnd6R0pjRmwv?=
 =?utf-8?B?YWpXYTVTYVpZbEZPTTBndHQrTmlUQ3lSVjhUTzZudkRsZGZOeDFMT05DYmxN?=
 =?utf-8?B?alIzYkx5U1pMZ2hOaHlkZWhjM1F0Y0pDdmtubzhucGFlMlhGVmFWMWtFNkFN?=
 =?utf-8?B?cW9IMUY0blpUQ3lyeGpNdDV6dEo1Q1BNOHlKRUpaVXZhb1pQSjFsTkNuTVBG?=
 =?utf-8?B?b1AxYzJmUjR5L3k4a1N0UjVMZ0lYazdBNWVCMHVPd1F0dUlTbjl1TDM1S0Ri?=
 =?utf-8?B?SzZCVGlEUmsxYkVnUTBMNUZaQUlud3hPeTNPbWgwQzdNY1M5VUVPZ3pPRmNq?=
 =?utf-8?B?Q21hR2tiNVRoTXpTRUcyTm91RmNuVzZTRFdmTjRzdUNNQnpMYzlpSjNkWlBJ?=
 =?utf-8?B?WHVPZkxHSmszODU5UkhEaHhyR3BzNkRxVHZJUjV3c3VYaGtjbzYwSTZDU0lY?=
 =?utf-8?B?TWo2dDMrckNEQ2pFMWljMEdaWEl0OVd5NkNMMHlWZ2dlZEM2UnpQeFRXeTFr?=
 =?utf-8?Q?9PNngJje8vilgnXshxXTyXE+m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33239fca-f11a-4ad8-32d5-08dcb609896a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 11:18:45.9247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGrvglwMXm8/loreXTg8XA05hKGSrgmkIPae5CEnKbRsFiyZ4ExEck0szM4S5asp99n55gdZYApvrwY0/xYdXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7242
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



On 01-08-2024 18:40, Riana Tauro wrote:
> 
> 
> On 8/1/2024 3:37 PM, Nilawar, Badal wrote:
>>
>>
>> On 01-08-2024 15:23, Riana Tauro wrote:
>>> Have a copy of the value written to powergate enable
>>> register. No functional changes
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_gt_idle.c       | 18 ++++++++++--------
>>>   drivers/gpu/drm/xe/xe_gt_idle_types.h |  2 ++
>>>   2 files changed, 12 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> index 67aba4140510..7188542aea43 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>> @@ -98,7 +98,7 @@ static u64 get_residency_ms(struct xe_gt_idle 
>>> *gtidle, u64 cur_residency)
>>>   void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>>   {
>>>       struct xe_device *xe = gt_to_xe(gt);
>>> -    u32 pg_enable;
>>> +    struct xe_gt_idle *gtidle = &gt->gtidle;
>>>       int i, j;
>>>       if (IS_SRIOV_VF(xe))
>>> @@ -110,12 +110,12 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>>       xe_device_assert_mem_access(gt_to_xe(gt));
>>> -    pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
>>> +    gtidle->powergate_enable = RENDER_POWERGATE_ENABLE | 
>>> MEDIA_POWERGATE_ENABLE;
>> Here I think we should have platform check. Like on MTL, LNL RPG 
>> applicable for only for GT (GT0) and Media PG is applicable only for 
>> Media GT (GT1) ?
> 
> We cannot have platform check for this as its applicable even for 
> products that do not have a separate media gt
AFAIK platforms below 12.70 doesn't have Stand alone Media. We can 
leverage (GRAPHICS_VERx100(xe) < 1270) check and gt->type field.

if(GRAPHICS_VERx100(xe) < 1270)
	gtidle->powergate_enable = RENDER_POWERGATE_ENABLE |
				   MEDIA_POWERGATE_ENABLE;
else if	(gt->type == GT_MEDIA)
	gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
else
	gtidle->powergate_enable = RENDER_POWERGATE_ENABLE;

Regards,
Badal
> 
> Thanks,
> Riana
>>
>> Regards,
>> Badal
>>>       for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, 
>>> ++j) {
>>>           if ((gt->info.engine_mask & BIT(i)))
>>> -            pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
>>> -                      VDN_MFXVDENC_POWERGATE_ENABLE(j));
>>> +            gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
>>> +                             VDN_MFXVDENC_POWERGATE_ENABLE(j));
>>>       }
>>>       XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>> @@ -128,20 +128,22 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>>           xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
>>>       }
>>> -    xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
>>> +    xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
>>>       XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>   }
>>>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>   {
>>> +    struct xe_gt_idle *gtidle = &gt->gtidle;
>>> +
>>>       if (IS_SRIOV_VF(gt_to_xe(gt)))
>>>           return;
>>>       xe_device_assert_mem_access(gt_to_xe(gt));
>>> -    XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>> -
>>> -    xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>>> +    gtidle->powergate_enable = 0;
>>> +    XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>> +    xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
>>>       XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h 
>>> b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>>> index f99b447534f3..7a8e63f2ebcc 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
>>> @@ -23,6 +23,8 @@ enum xe_gt_idle_state {
>>>   struct xe_gt_idle {
>>>       /** @name: name */
>>>       char name[16];
>>> +    /** powergate_enable: copy of powergate enable bits*/
>>> +    u32 powergate_enable;
>>>       /** @residency_multiplier: residency multiplier in ns */
>>>       u32 residency_multiplier;
>>>       /** @cur_residency: raw driver copy of idle residency */
