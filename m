Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976A4CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589C210E541;
	Mon, 27 Oct 2025 18:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgXzNMok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A337910E541
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 18:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761588554; x=1793124554;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kZflJiHKbs4T2KJp75RJmVVqFI0aQBtlq4+pbeEDmvc=;
 b=hgXzNMokJadF9kF8XnJ4jw+y1E3uZt3lx6St5IOZnauYk9H7Ectd/0hE
 t6s/pLGsUE7D7SG7cDND9dsHXHv19RNaZHDd2ljE5REpjH6Q4ggBkN9tW
 GHv99h8p/l40VLODRdzKT9xgQdCoaFOgY6QciyZd/J50RPz1BfK+nrSGQ
 H5CfXIYavyFAjr/RTAyfoud6Ab0eJz6/gOaSBqpdX1NqkBryP9sgM/Zf3
 F80zhQrXv9SwVfVjpLuJU94seFk0AxOytgeI1X/wszfSeeZt2XuLZDiI0
 d04jolQ7pmkCU38nnZ18gOjVKLZXsjpFIdtofqwbjB6r14nO/p7I1Z2t4 w==;
X-CSE-ConnectionGUID: F954JycWTcqFzL2hbLRBWQ==
X-CSE-MsgGUID: OVfX9rIPTSOV5B6SxucHCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67514319"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67514319"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:09:13 -0700
X-CSE-ConnectionGUID: rPb2WkQfTauZ54u8hRx6rg==
X-CSE-MsgGUID: nHjfjmX3QwSnnTr3y9lCEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185580703"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:09:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:09:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 11:09:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dX14x/TnCYkdB1csCtTG67ZbUy0cxQXTedOaf/KLqy9d6ZjpY8e60BZnqQUKdItkwJWAKN3z/ShfpZae2ofwEgFSobH0/WU4WyPxInHjbLSuj3wqaoJOednuRRMZNUGu4a7q4F9p6aR9nh6bbsZ8pvAjz09Vc63VyP5ZA/c8YUSYik3UrGuXk08Xv1plQ78ZM5iK6FZvL/ht8LDPsiOlYYP/SjsnZGGLKzhx5QZsAlyU38FNJj1gZ+gbPz4z58LMgU5e8/NJyWmPIgAy4eWV0w+LVMcTjviWXoddRhoir1YtdU+n34mIQMe4AZxuuDfwQcYN5lS1XdZ4MbLHFHEFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vfek4AESyyKsMdlPyyCMUL9mBmybv52p+55VVZAxWyI=;
 b=nS2Ltfr5F71rrAPjA46XTOR/z9gAArwbbkgXTCzLp255r17ikP4fllqEPRZPDfcNCLjRQh8eKTFJkGkEw9jiyCQyB6987fHBPYJq5zr42j7oNvFypzJDTnHsUO4FA5kzxQ43unc8jkbXAa51KhEVlgwfBY3MeWMkVmQc3t3ly+FNScdLTYhL4DxTwvkyNuegGnHhGU7prBAC9Pj071xjk9EjfVcpJ4qKtYQtEBbBb9AbKIVW+pPRqrw0wY9rN3gwQH64IN82zvD5HEjbV/UiF/ODNiN05XlW78g8FKtkr4CJtGoIZoEd65h1AJwzD/RwnsBlWvd3JBLo1skxuvZ9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Mon, 27 Oct
 2025 18:09:10 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:09:10 +0000
Message-ID: <fceef34b-0124-431d-98f1-fcf3149ae333@intel.com>
Date: Mon, 27 Oct 2025 19:09:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-4-michal.wajdeczko@intel.com>
 <ztlryvb6mschuesh5k77i2ldehaa3ed7asriokgnqkajrxzcij@j6lezpryhquk>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ztlryvb6mschuesh5k77i2ldehaa3ed7asriokgnqkajrxzcij@j6lezpryhquk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 1937d29d-ccf5-4d80-b5db-08de1583ed7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1lNMXA2V3AwQngzbDRSUFMwWnhaZVcwa2wwVW5MSzJNck1sdjZoSGlRNXNY?=
 =?utf-8?B?WVFSOXluSEJFR1hDYnVWeTRVMXV6MnNMS051N2prN3VIRWdTdFB0WWlZaThT?=
 =?utf-8?B?S3ppMStpYm5vQUhEZEY2WWQ3ZGU2a0hLWU52RkpsNytPM1ViT1V5ZnNZWEpS?=
 =?utf-8?B?Qlc3NVo5RG9WeDhDdlRScTFqVFZiS3hLVzNLOGlFeXJ3T0x6dlFXMjEvNVdl?=
 =?utf-8?B?VU82YXU0MHVJWVVVZExsOU1PTmE5NEN5dmVYS242T3MxUFJUMkFJS3gwSXZx?=
 =?utf-8?B?QWxrUDdscCsvbVpSV1NmRXU3VHB2NDdyb0FNbTJJb0VNdjY1YStiWGxacnls?=
 =?utf-8?B?eFlPdU1VelEybG5EdDZmWTVkdWJNdWtrcUE0V1FCbGNIU1FvQVdSOGgwdW9Q?=
 =?utf-8?B?MTlnNjRBclRpVWljOVFLUWlxTDlrWm16aUxxSGt6dmNEeG5jenNjNENBVHVY?=
 =?utf-8?B?SmlrRGZoSUU3bmtmRk9YdCtxbTlQWWh3WTlaemZ4ZENiazV1MFlFdG1Rais4?=
 =?utf-8?B?bWNjVTRaZkY4bE1lcnU3RXF4blhaUTFWbUhMaHBtT29aajdxY0RROHRrdXhs?=
 =?utf-8?B?OFdhRDNmQ3ZYdUE5UTYvT1hpVFlHa1ViSGNKTHQ5ODB2S3lMNWtNTzhoak1j?=
 =?utf-8?B?MzRmWFFFMzRYci9Uam12bGx0WkJsVitRSjYwdTNTZU03VzB5ZmdlK3ZzZjJH?=
 =?utf-8?B?aVIwMzZTS1FTK3RIZEI2MWt6QUVlekhhVVN6SEFIU2F4aFBwUWtaNHFBMkk3?=
 =?utf-8?B?cTRVTTNRdVJKbUJrUVo2QU84ZkxVaW4yVm5HeDZ3NEJrYW1nMlBxdG5OZ1dS?=
 =?utf-8?B?ZWx4MGlaWXZGUmZpYVNJelRURFZXYmVIaDlGL3lkWmlGTkVjVjlyOVNwN2Fh?=
 =?utf-8?B?MklFSFFaSGg3a0FzTlZWTm9ROG15Mi9zbm5SVHNpQjJLblZqRy9INUZ2dFZG?=
 =?utf-8?B?RlRNUDVSSWhpb3FjM0wwcW9xUlNMcjh1UVlZbjYrMVIrdTRKMldCQjlWRlF0?=
 =?utf-8?B?TkVHOHlKMnAyZjRvOWwyU3ErUGZEVVRiZi9Wb21scFkzcDVxVzhhRlpPUzlC?=
 =?utf-8?B?OHU2MGFMNnNIRnhrTWtZMW5hRUxtRlAyZnJUOUVJZG83MW94V3ArNkgrdkVq?=
 =?utf-8?B?K1NmOENNcjBGZTcvVERMUmxNSnVTczJwVkh6TGVOeER3ZkF6YVBNU2RmeVBu?=
 =?utf-8?B?SG9KZGEwUHFoc1RaSi9GVmRCOTgwbEhZbjEyQTRpLzBMVFlJamh1MXVid0VW?=
 =?utf-8?B?dng2amhXT3h0M29CaWhYc1pXMURlaDFBY1cxSnhOVlpIUFp5YS9yYmlzNHZs?=
 =?utf-8?B?UzQxV3puM01MbndueUdiaC82VjBGQ0ZJd0tCeTNuZWJDc0YvWHVMTnk2ZExQ?=
 =?utf-8?B?QlZDdFNDZUN1QURPZDc3YzlOT2hhQ1crZEtaekhVWlpnR3pIekVlb3pXUkNT?=
 =?utf-8?B?SFV2TEpRUGJ0dzhoTmtOMDd4NDVaQUN6amg4N00vWEJMV3NkaFkrZm5DYW4w?=
 =?utf-8?B?dkRvQnl5OVVWblhJZzhHeVU5TTJBUXVZYW45VG9DOUN3aFZhUDlzREVpNS8y?=
 =?utf-8?B?a0ZQUExFWXFjNVlWNXBYZkhCbzNneWtOSkIxYXgyY3NhOU1WUTBoTXRzeVlJ?=
 =?utf-8?B?SEpzQ2RyYlBPVEZwUDZzeFZJUm1xaHhGeG5rNEN0N3FPdlBkSWlSQjFpaGVr?=
 =?utf-8?B?WFM0Y3FyYUtUdjIwclhJT2xGVEVtQ200VG1IS01PbU9tZ2pkdzVUelhteDM1?=
 =?utf-8?B?ZzZmLzhQS3I2cGVjaXhZNjREcG9DQ0lVY1Z5NkE0dC9VS2Y4aHQ1MkJURGhR?=
 =?utf-8?B?YlRYYzJtRFp4Rk9iTEF2Y0xNdVRmbFlWZ2xvQmtoKzZsRVUzdWhsengvNFNY?=
 =?utf-8?B?ZXRhN0Zyci9rNFcyS1VlUnRFclV0a1YyN1piUS9LY2MwOS82V0lNUUhvWmhK?=
 =?utf-8?Q?dFDFNN+Zg5Rc6tteq6E93vlO4mlgVadx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW1QRHlXdCsxQTZGK2VVbHYxNUxaZ3hFT0gxYnZxTzBiL1ozWWQzUFRqWk83?=
 =?utf-8?B?Z252U052VXJFS1I3Rk1pMmNNL1hSZXhKN1dXb3ZKRDFyeTQyM3JRRWVISmhN?=
 =?utf-8?B?bVVkb0toS2NsR24vR2RWRVQvOWtIcy9pYkFIK291aGswbUJIYS9pVnFmNmhn?=
 =?utf-8?B?MDQ1MEFlQWc4eTNESXR6NHJGWnQyM3YwRVhlajByOUVwek91UGczczRraDdn?=
 =?utf-8?B?dUpRVDVKZ2hvV3pLZGhkcnd3Tm5ZYUtjempyUXBLNEVkT0VSNlBqV2tzWStD?=
 =?utf-8?B?M1JrUkIwY1dycU0yZk10c3F3TFFMUmkzamU4d01ObFN5RXU4bDB4NHN0VHFR?=
 =?utf-8?B?QkJiYWJhWkpzWXZwa1ZkNXhLVlVsWGZyT1l0SFpyVjVudnNXVkhIMjJZUkdz?=
 =?utf-8?B?UEkzbTU2M1dkS3pEMCt2bmtWYlNsYmFBRnJrb2U4WXhuL0JoYVJQN1BkS3Fi?=
 =?utf-8?B?YSsvYks4UzBaSm1mOGxaVnhJRG53aWhXRjUxdWE3Y3RFMjU1TlJqd0Q4azRU?=
 =?utf-8?B?Ny96bTFObGpQM0c0YVVKeVdQeVJDRXBVREdnY2hJNmhMNkpRY1V6OGErVklP?=
 =?utf-8?B?SGVCVHkwS3ZwUEZvM1R1KzI2NDRCU1N0ZDZNNTd2VlB3YWNXWWI3Mk1oZ2U4?=
 =?utf-8?B?VCtTbGxhWDBuTTdjck1maGExL3hhaUN5Tnl6Y203NU44OEJ0TThIMDBvZ1dB?=
 =?utf-8?B?K1JEMTRibC9CQ1FxTG1CTFZoQzVMS3VaVW5aZmo4QmFQaTZQbEVzWUcyVStj?=
 =?utf-8?B?NVoyZ2xXampWdkM2Tlh6NjhvbG84cDNpQWFLUk5ReXh6Y2FLSUVMTlAyMTZx?=
 =?utf-8?B?cGx1L2F5dmFYeU1uQVg0eXA2WDVYdGhaOWNGbm9aQ3FudVFWa05NaHBZc2pM?=
 =?utf-8?B?K2VIV01WamxVb0VSNWdDMWdnVkk3ZkpKeUpvdFZmYmZwelMxUFZObHlXeFdw?=
 =?utf-8?B?bFJBYWx4MEo5VHBVNFY3UGdKYnF5T2EreWVyU05DUjEzVE83SHE5ZitnNGF2?=
 =?utf-8?B?ZVlnUmh0MmlTUjBOTXNhZjVzakNCeHhrRlNkSDFocG14c0hlbW5xOEcrejh2?=
 =?utf-8?B?alJ5a3dna1VubFlsSldTT2dhd3JkSWVlSG41KzFjclJoWmd3Y3Yyd3V2RG1K?=
 =?utf-8?B?RjRIMWxvQTRTUUZnanlwZ2Fhc2hIM2JEY1NHbnl3UjVsNXQ4OTkyV1NVSVE1?=
 =?utf-8?B?RlZBQXFMN05hd0pJMHVFQzg4aXo2dUVxRXZRbHQ4K1RqTHBLT1VBZFI2RmVv?=
 =?utf-8?B?WkpWZFRKcGhDSVF2c2wvK25Rbk1DRlE2emYzTEV4Nkg5WGNLbnR4SEIybE9D?=
 =?utf-8?B?UTdWMGVwM3o5bHVZamplNEV0NVg2TEgxVnlIMTVHN2pRQVpMYTZYcE5rQ0NJ?=
 =?utf-8?B?TGZLVUlRVzNHeE9uNnNPQ1lGYkhSTWIyZ1RVS3NLTU9lZ3BIU0Vjc1ZDMGFq?=
 =?utf-8?B?RGxaaS9mc203Q0UxV0ZzSTVQaTRpNksrVlYrNm5QN09vMXpBdHlrU21ERkFI?=
 =?utf-8?B?aUkzSFBNMnZNSWdLdWZxTXpOQU1Da3dIUzIxa1BoSDRmWmZKeHNnWFRmbTFZ?=
 =?utf-8?B?S0VmSHJwZnZoSHNybHdXbnV0a0xMRVpsa0Y0ZDI1TDIxemFOVFdjdGVsakhY?=
 =?utf-8?B?SEhTaEVkTTFyUVR1SGhpdTZTRXZhcTFVdmNqaGpNdUVjSmQxK1FWc1Z6Yk9r?=
 =?utf-8?B?UnczSS96UXBmUzl2K3hqRGdSdUV4RjJXSTd0dDRsTkJkQWtZSURWV1Qxdjh1?=
 =?utf-8?B?cVBJaWdlZnBPOFB3MDlwMXNaNnR6YVVoL0R5WlM2amZOWWVDVm1sakdXM1Fv?=
 =?utf-8?B?ZXZhWlFhQ3dycVdpanZhc2VkYXJObHIwYWxuK3h2N1IwTUN2OHE0L2ZFWm8z?=
 =?utf-8?B?NUxTbHNORlVXS2FXZFFBOWdkdjBFZDhZRFhKeGtnTDVFcEZ6bzVXbnZDZTgy?=
 =?utf-8?B?QlBOTUpuRlcvTk1BUEl3Z3ZFenJFZloxdkphUW81WnZlRXBKUTdDR0plRzZt?=
 =?utf-8?B?bUg1UlI1M3BpTy85T3dnZ2R0L3Rra09melRBRXd4cHdaTDFzV2Y2VE85VFVD?=
 =?utf-8?B?U2FaYkEwSjlWY2gwN1lBNnRjMzlXeTUyNnRmblpVV0RHT1FKYytFcERWK0RF?=
 =?utf-8?B?V2ozMmRHOTMwdDU1R3Bnd0h3RVMyMVlSNnJBSUJ3WWNUdk0rMzc2YURiMXZ3?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1937d29d-ccf5-4d80-b5db-08de1583ed7e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:09:10.5685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cfiSMiqeJZzFw65c1f236666Mq+wvDFG375Mubx0bX1IZ0dx0bWCUcEO47VJ/Ubza5ZYpk3Ag9bxSRrNhtYVI/gNPfbt262zcml4eq9Ry4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
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



On 10/27/2025 6:27 PM, Lucas De Marchi wrote:
> On Mon, Oct 20, 2025 at 08:24:03PM +0200, Michal Wajdeczko wrote:
>> On current platforms, in SR-IOV virtualization, the GPU is shared
>> between VFs on the time-slice basis. The 'execution quantum' (EQ)
>> and 'preemption timeout' (PT) are two main scheduling parameters
>> that could be set individually per each VF.
>>
>> Add EQ/PT read-write attributes for the PF and all VFs.
>>
>> By exposing those two parameters over sysfs, the admin can change
>> their default values (infinity) and let the GuC scheduler enforce
>> that settings.
>>
>> /sys/bus/pci/drivers/xe/BDF/
>> ├── sriov_admin/
>>     ├── pf/
>>     │   └── profile
>>     │       ├── exec_quantum_ms    [RW] unsigned integer
>>     │       └── preempt_timeout_us    [RW] unsigned integer
>>     ├── vf1/
>>     │   └── profile
>>     │       ├── exec_quantum_ms    [RW] unsigned integer
>>     │       └── preempt_timeout_us    [RW] unsigned integer
>>
>> Writing 0 to these files will set infinity EQ/PT for the VF on all
>> tiles/GTs. This is a default value. Writing non-zero integers to
>> these files will change EQ/PT to new value (in their respective
>> units: msec or usec).
>>
>> Reading from these files will return EQ/PT as previously set on
>> all tiles/GTs. In case of inconsistent values detected, due to
>> errors or low-level configuration done using debugfs, -EUCLEAN
>> error will be returned.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 116 +++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   8 ++
>> drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c     |  54 +++++++++-
>> 3 files changed, 176 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>> index 663fb0c045e9..f2e14103c9aa 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
>> @@ -152,3 +152,119 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
>>     xe->sriov.pf.provision.mode = mode;
>>     return 0;
>> }
>> +
>> +/**
>> + * xe_sriov_pf_provision_apply_vf_eq() - Change VF's execution quantum.
>> + * @xe: the PF &xe_device
>> + * @vfid: the VF identifier
>> + * @eq: execution quantum in [ms] to set
>> + *
>> + * Change VF's execution quantum (EQ) provisioning on all tiles/GTs.
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_sriov_pf_provision_apply_vf_eq(struct xe_device *xe, unsigned int vfid, u32 eq)
>> +{
>> +    struct xe_gt *gt;
>> +    unsigned int id;
>> +    int result = 0;
>> +    int err;
>> +
>> +    for_each_gt(gt, xe, id) {
>> +        err = xe_gt_sriov_pf_config_set_exec_quantum(gt, vfid, eq);
> 
> 
> I find it weird that a race on multiple writes would basically give
> undeterministic results for the device. We are locking/releaseing
> xe_gt_sriov_pf_master_mutex on the gt, but shouldn't we syncronize
> multiple writes at the device level?

but we still expose more granular attributes over debugfs, so even if
we would be successful in this protected round here, the actual
configuration could became "unclean" soon anyway, so I'm not sure there
is any benefit trying to add this extra protection

> 
>> +        result = result ?: err;
>> +    }
>> +
>> +    return result;
>> +}
>> +
>> +/**
>> + * xe_sriov_pf_provision_query_vf_eq() - Query VF's execution quantum.
>> + * @xe: the PF &xe_device
>> + * @vfid: the VF identifier
>> + * @eq: placeholder for the returned execution quantum in [ms]
>> + *
>> + * Query VF's execution quantum (EQ) provisioning from all tiles/GTs.
>> + * If values across tiles/GTs are inconsistent then -EUCLEAN error will be returned.
> 
> or if you had multiple userspace components trying to set the value
> creating the race above.

yes, this "inconsistency" can be mostly introduced by the userspace and
concurrency / race is not only sysfs vs sysfs but also sysfs vs debugfs

> 
> Lucas De Marchi

