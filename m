Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E34D3ABD6
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 01:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E2910EAC5;
	Sat,  6 Dec 2025 01:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMqiixVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E295610EAC5
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 01:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764986319; x=1796522319;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jIX96DCGOgXFs5z0hJRxKYKNGtqzVcpaOtmXyq3cHPE=;
 b=UMqiixVyRdv4knxNCEXKaBG/HJFrCBkQDVI57jEsrDd4bfEuMuwbXXZ1
 bZEzES9MRsedAXxuUdRSR6Ns2s1+ICtxLoUQSePTOEAO4+9h5La+J4Z3C
 q8UcFLAFXF8qA1yqu3O3mAhoXjr7DLe/tZFIQKwt0xgYjpkpwCdCIfIBK
 Wnl9f3jdhj8hOrGyOGpeDtBqCdEFnqn2vRHcl0RkQZb1M9YamQ7m1+nc9
 OUiahnAeoje6244I0tD6jdElOffOKbMvWalE2lnKgcqYpXQnE+tdVhsRN
 U6bvycQi1Hh0YzLwJjTCd9z1c1YWlbPOkbQBWLubb8bnnr7AcLsUuZ96N w==;
X-CSE-ConnectionGUID: qjbrXJETS/2+rrEPrgtOJw==
X-CSE-MsgGUID: heTeljFPTMuRwj+EQYgEMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66918189"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="66918189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 17:58:38 -0800
X-CSE-ConnectionGUID: +ao0KnTXTZ29m+nR9hCleg==
X-CSE-MsgGUID: LdFBaAKpToaVpFk1AGlbXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; d="scan'208";a="218792119"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 17:58:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 17:58:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 17:58:37 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 17:58:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9wjbZ9Ie5SiEUvK4lVwwE6szg+FUP53o9V8ca7lZ+HZTxg/7ICBjBghG+Lzhhv57D0cRiHhA+z3WnJYNKPojSKTJkYeIvtLv/CdDVSi+b99MQemjlzFRrBqaQWk0JVKtkOPcBEeTOXTCbULnWz7gDOtLSFrYb1MQfdikZn13WyDu7W+Q20PHIDqmFJYC2jiSbepp2Acc327sQQUqz0WJc1Nt2zlICCum85m3VCwyEG6tk++mUX6DORz6y8Bq5vCuKihkpj/o/a1hV5kGW9LOb3azzS/mbGVSFlBFLBA7oql0nyVZDj2VEZLD1xdBhZCskw1Tfj19WtMhpRcOaMe3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9G/wkx/AYxJ3EW5ia6xh2ASeYxir+qeagMobSSCAOA=;
 b=FXguAT2Htd+62vfxsToCb3Jfx5iJxJoWXY4WMMYWr3vDAxYMf3ROHyhOyPbdDE7vZ+lZQpZvV1WMVN0ZYTC0NFOopw/RYDy8rW1Sb58GdWVdn8dvZUVIBXkGyq8Kzx0iQFBCaketu+QgQsmCVL5IQgMjXl1qTZSsAI9lERANGLjExSh6ws5myO8ZkY3ErTwXKyINSeVa+WO5oIGzEAtFumetKWsykx1livA5QzuZwNoyerylZ8RF1Y29p8XLpjhuvg1j/XSUr9SG2EIUqNZ+rhArEfKKvfQ2vmZ0wQTClDu974RswV24g50oZrI4tgfdO+L00tEu2QcFcY+x5mtFng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Sat, 6 Dec
 2025 01:58:35 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Sat, 6 Dec 2025
 01:58:35 +0000
Message-ID: <292e1a76-7767-4bbb-9624-f13740acc5c9@intel.com>
Date: Fri, 5 Dec 2025 17:58:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] drm/xe/sriov: Add functions to set exec quantums
 for each group
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-20-daniele.ceraolospurio@intel.com>
 <aa947c74-4c12-4d34-ac48-28562d4dbfcd@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aa947c74-4c12-4d34-ac48-28562d4dbfcd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 047c865a-da1f-47eb-f328-08de346af70f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjRRbHg1Z2NIYlYvOXd4bmppZjl0RXd5aUZObGZMOVRyc0ZMYlF3MGNqaWpk?=
 =?utf-8?B?R2dpdlhLdUFJbmtMb2o0dXhCQ29HUWRBMnFsWkdhbUZEb2pzQmpmRnRrZFIy?=
 =?utf-8?B?b3hyYmZZU1NydjZwYjFnU0pYTEJZQXVaSjIyYVNrKzdwcVdHbnpaMnk2dDNM?=
 =?utf-8?B?RlBSSmtWNUl3UExENFpOYm1uNmFqVGVIUUN3dURxM2N2ZDNZZkFtVzFwV3pF?=
 =?utf-8?B?clJNbDJqWUVlSVpiVmhjUkpHY2FaeS92Y0xSN1kvaVIrdi9EVWFUVXV5U2dm?=
 =?utf-8?B?T3dXMjhwVERsR1ZsdFgvQ2RoZ3QzVXVWUGlBeGZkTTNFczVsdkFYMHZBM1F6?=
 =?utf-8?B?TnNRcS82bEt4enkrNEp1ODM5OUZOa2ZoMWh6ZENPUFlqWnV5WmkvckRNZTFN?=
 =?utf-8?B?dEQvVzRFQW5uSDB0bzVZa2RETmV4b1hPa3NLbGVDNTNhWEt1eW9IWmxpdjNm?=
 =?utf-8?B?NEhlT0FlU05iVThweUFJTXpmcVRiWkVEUkxqNXUvbFN4Zk9KTFc2VTFWcUs5?=
 =?utf-8?B?enpzWkZhOTlLVFo0SzZTTE9WV2ZzZjNmZWVTaElTUjBkZWxtQmxNNmVRQ1dX?=
 =?utf-8?B?TFZ6VCtFZ2lUTEpGSEZHcnViOFJTMUY5ajgwMldBS0p0LzhCKy9OQmtKTWZW?=
 =?utf-8?B?d3NNWlZPVmtJaktUSktmMm9RS1BWMmVsZWVRZmRRclRoMEFuRkQza1BMQ0Nj?=
 =?utf-8?B?aXNDV1ZEckZjZ1AxL1p5eFhuNlFFanZPTUJ4cmRLaTBMbDF2RlV3WUExQm9l?=
 =?utf-8?B?YWdjTTVGcE55OWM4YnZuM3RESU94dlFpNFhLOWMwdis4YkdiRGU3SFZ0VkNG?=
 =?utf-8?B?dDZxTHc2T3VKNmhiRVFKU241aE5yMTA0eW9ydnBNakt0VDM1Wk9IaVdkeDlv?=
 =?utf-8?B?eldJV1JrZTkwbWRBelNidklMOVBOMElGdDlpc3BiZENSNER2Z1RsTGsrellH?=
 =?utf-8?B?c0F4MXIyYU1sSlhPclFmN0JUMGN5YnVpejZ0VUpqeDRNWUY0N1RhYW9KOW9s?=
 =?utf-8?B?aDdoNmVKQkZJWUh1WW9kcmtDSHdmeDArcTZFUjhEaHJPaFp3UXBDUEZXT3o4?=
 =?utf-8?B?YnZTYXJQOEh3L0VpWEFZLzNuWjNCREZOcVVhLzlQQk84TXl3WXNRSDQwSlJm?=
 =?utf-8?B?T1lmVmg3T0N6TjRIMGZ5SDRZbnNuamh4dEh5WGtzT2hZTEFpU0NDZFJSMGwx?=
 =?utf-8?B?RkFnYU9wZnNkMWNqbGtOQTVJeGxBeVIzbWEyeFVjamRpdmN5bkltcDRGcElX?=
 =?utf-8?B?UVA1V3ROSk04N20xaHVadk05dHZhQWVBajlmb25wNHk5alhNSVNvYmNoRzRE?=
 =?utf-8?B?aVQvYzJkN2VrZHVPQXpsQzUxaEVnVTlFbDBBOEpzaUdjcm5sTUpxb2VneHhL?=
 =?utf-8?B?RVE3K2RPSlpXUWNkYXJ2a28rUERoRUJXa2MvQW9mRTVwZFRKd24vVVY0RlFI?=
 =?utf-8?B?clI2bUdsbDlsaDlhdTF0bittb0svb2g0TGRFRnNHR0Y4VEMyb3pyOWtiUU1w?=
 =?utf-8?B?TFBRclcyTmEybEIvQkhjUmtqZEczV0lEUEpXOEo3aElmTFJYUFQ0L1hZQWhP?=
 =?utf-8?B?T00wUGJQdkhDMnJrWjBEYnl6YmdZRHBBNmUzWWRlZFo5L0VLRGlBTng1MG1m?=
 =?utf-8?B?NG42eHRCeHRoRUk1VjBLVmNsTmZxbHgzVVc4d0xHYTJFZCtKa2ZNaGlRUmdl?=
 =?utf-8?B?OUk5SmhPclJVZFR3aTd2VE5iM3VnQUd0QVNRZ0N0QVluaDJNUGFGVGxPb1Np?=
 =?utf-8?B?NDFnbDgvMVpVRkRDdDhQZlN5L0NLWHdkdFFVWjFpdzJZK2JUN25JaENvL0FI?=
 =?utf-8?B?RG83V1dpcDFyZnZFYzVsR2cwSUlVSXJDaHh4Ym9MaURKUk51NHkwdkhQQ25r?=
 =?utf-8?B?SkwxN3hDSTExVHZpcWFzeVo4cG5lMmxsVWhmSENYblQrV0ZxL1A1U1pEQXVO?=
 =?utf-8?Q?7EXwmZMUvUdLLokOiiCdAxZLM23mLaaX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE1GMHZOK3ZuM0VBRzdRTHFIQ3VYR2QybldBb0c3YmNUbFFJcHBOTFY5TXVD?=
 =?utf-8?B?aUlyRklmTHpicmVHVExlYlNIUDRja25BMjh3cEJVRkk5Tkk4VTNNcWN6d1Bs?=
 =?utf-8?B?SGhHTjBTN3VjN1M2Tklub3JDc3UvOVVjeWJsRzNHdTVtc3oxTGJLMWgrMkNZ?=
 =?utf-8?B?MG5rd2s5aFE4cWRKWXd3elNkVkJ4b3UvTHBic0JvRXlMM3NoWkU4OFA2c1lY?=
 =?utf-8?B?dUlsemVoTWQ2clUvckRVa3pybENiZHYranRyY0Z1MTVZVit2MHpVUm5SWkhE?=
 =?utf-8?B?TEdzazZaVjZQM0crdG1FUm9SWXRIbENQY1ltTHhqODJINFFCbk9PLzJXbnVw?=
 =?utf-8?B?NDdOSmhOalc4clZnazM3ZHpQL3d6WEo2R3RNNm04Y3YrTWpSWEQ4N3ExSDht?=
 =?utf-8?B?WUR2SlRwN0M5dW1rK2VrOWlrZmNzeCtTVi8vNDFTKzFtMGp5blVBcGVibXpE?=
 =?utf-8?B?YU1UbmlNQ01LbkM0d3R0R3l5Wi9EaitkRDVQNVVIT3p3alhtbzEvRjlDa1Mv?=
 =?utf-8?B?NWk5NVo1TzFwMm52ejBIMWNMbzdoQVBiQ21IZ1g2MWlBSjkzTlZ6dkVMM3Fn?=
 =?utf-8?B?SVUrWWc4d3JmcDFJR2pOT1F1dXN1NXVScTB4SnRac1RyY3o1SWFkM3Q2ZXpi?=
 =?utf-8?B?RUdPajJ4YWdwZWFqWGtBRXlIWTZNc3ZoMmxwSjN4V0pDNDhLY1k2MkQ0S295?=
 =?utf-8?B?RmdRc2dZajU4K3VWd3RPdzYzVFBvRTNiTGhyN2xvclNRTDc1MzNndE9pdlNn?=
 =?utf-8?B?S3RoU0g5SlV3aGlGdkZpRE9aeGRaZ1ZqOUZhSUlMOXozRGNFNEw1SWR2WXNz?=
 =?utf-8?B?bEdIdVMrUFN5R1liNnA4OFlZdUdLRWhJYSt4YWRZMHFHQ3A4RXMvODhOa2N5?=
 =?utf-8?B?ZUR6bUh2K1Z6WG1pS09xcTg3Tzk1dFNVK2pBSElqajhXcG9LQzJjbmx1WTR0?=
 =?utf-8?B?VW9SRnpNR3NES2ExdXFrK2JKYVk5T1NBbnMvRVkzaVJLL2tzZnQvcENEVFp2?=
 =?utf-8?B?TTFVOS9KeE1ST0FlSW82ZEhXTkRqemFOVUQ3eDRuVGdxUENaVnNrRVdBaUtw?=
 =?utf-8?B?K3BZWWtSZmlhYnpkTHFqeEFtRXBJNmRpZ1lUSmowWk1rWENHTDQ3aUJYcngr?=
 =?utf-8?B?QzJTaU9IcG9tKzAzZGtCcjdBbGIzaldZNDEyK0R0UlIrWWYxb2Zldk03N29V?=
 =?utf-8?B?SUxtTG92anVQRllGdmJmQjRPNjRvRlZBWi80V1gxdUdxTGQ2NTltOEdONVRt?=
 =?utf-8?B?T3NnL05IaVlnOW5jSXNqd2l6cjNXd0krYmdCSERYendOUGt1YkZXcTVwUmZv?=
 =?utf-8?B?Ymp3ek84eUh2bFpnR1FuQ25STmJtSXN5ZUdEcFBMK2xtekVDYnZEb1F3QXpY?=
 =?utf-8?B?QTVwUUZkVGpHZ1hJb2FzSWVkUWlNVUdBNGpCVXZuV3FxSXhaUmQ4dC9kMytD?=
 =?utf-8?B?K3lXWXRsaWZReHE0SkJRK01wUkRIVXFNZDVwZVR5akIwa0dma0hBcXdlTFRh?=
 =?utf-8?B?R29XRUFHdUpVUmlQYjlsd0lWSWltV1JQMk1PRmFmejdhaUNrZHIrSHBFSkgv?=
 =?utf-8?B?S09GNjh1VldhMEsxRGIrZDRQOTZHVlN1VVY5ekxzSTRoQTZzWUsvdjQ0dlo2?=
 =?utf-8?B?YjJhK0tSWEx1V1pGVjdjaTBqTVkvNURRQi9pemd5Q3FvR0RLVngxZ2pzZGg5?=
 =?utf-8?B?c3VvQ1JjWitqUU5jMXdydXI0R01mK2xMT2FTMEk3bnlycTVhS3lKN01ncG5M?=
 =?utf-8?B?K1BOc3U1Wi9SMXYweDBHdlpaOGlUem4zUHR5WlhtdElGOTNGWHloMkw1cktQ?=
 =?utf-8?B?VFNXbHcvN25qbEZmZU5iSEorZzVIOWg0cWpuSWdBOFF2NDd5b1lsREhPOENZ?=
 =?utf-8?B?MnJGR3JoRjF5bHNmS3J5UmRZQit1MVNjQXN3aE9VRG9KZHFSaVQyeEQ2TzBP?=
 =?utf-8?B?YzA0NVdJVFQ5ODJJWCtNMHR2aW92TGY0ZmEybjRpTWhTOFNhV1pJVkoxT0hX?=
 =?utf-8?B?ZUY4VFFIU1NRN1YxRlhRYVFVdjdseGY1RjlBS1k2dFhxY2FYNWwrZVB4T21R?=
 =?utf-8?B?dGxGeUpqS3ZWQUZ4TktTVCtNUFRMaWMzaXhNVUR6ZU02RTVkM0U2WXFnRWow?=
 =?utf-8?B?N3dtSDZsOUp0U1J2NFNyTkhSK2Q0MDhGSkhSNFlXNWxHbi9Cd2c4bTB4T0pW?=
 =?utf-8?Q?iNkelak1i021YCG5qXgThCY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 047c865a-da1f-47eb-f328-08de346af70f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 01:58:35.0519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDx5MAMaMbA66FDVA3zyzosNSJchYlrKuHQGWj2NbGS1l6o0SPfHMh312z2olfH8qlbiFBQIQEYlwH05WjzrF/V4Oew2n8nmgJgdTP4gL0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
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



On 12/2/2025 11:54 AM, Michal Wajdeczko wrote:
>
> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>> The GuC has a new dedicated KLV to set the EQs for the groups. The GuC
>> always sets the EQs for all the groups (even the ones not enabled). If
>> we provide fewer values than the max number of grops (8), the GuC will
>> set the remaining ones to 0.
>>
>> Based on this, we offer 2 ways of setting the EQs:
>>
>> 1) provide a list of EQs, which is passed straight to the GuC. This will
>>     cause the GuC to use zero for any missing value as mentioned above
>> 2) provide a single EQ for a specific group. In this case we send all 8
>>     EQs to the GuC, using the current values for the groups which are not
>>     being updated.
>>
>> Note that the new KLV can be used even when groups are disabled (as the
>> GuC always consider group0 to be active), so we can use it when encoding
>> the SRIOV config.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |  12 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 244 +++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   8 +
>>   drivers/gpu/drm/xe/xe_sriov.c              |  18 ++
>>   drivers/gpu/drm/xe/xe_sriov.h              |   1 +
>>   5 files changed, 266 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 48f47e26132d..a0763cc15518 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -383,6 +383,16 @@ enum  {
>>    * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
>>    *      This config sets the threshold for LRCA context registration when SRIOV
>>    *      scheduler groups are enabled.
>> + *
>> + * _`GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM' : 0x8A0E
>> + *      This config sets the VFs-execution-quantum for each scheduling group in
>> + *      milliseconds. The driver must provide an array of values, with each of
>> + *      them matching the respective group index (first value goes to group 0,
>> + *      second to group 1, etc). The setting of group values follows the same
>> + *      behavior and rules as setting via GUC_KLV_VF_CFG_EXEC_QUANTUM. Note that
>> + *      the GuC always sets the EQ for all groups (even the non-enabled ones),
>> + *      so if we provide fewer values than the max the GuC will use 0 for the
>> + *      remaining groups.
> don't forget to update xe_guc_klv_key_to_string()
>
>>    */
>>   
>>   #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
>> @@ -444,6 +454,8 @@ enum  {
>>   #define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
>>   #define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
>>   
>> +#define GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY	0x8a0e
> what about MIN_LEN and MAX_LEN definitions?

will add.

>
>> +
>>   /*
>>    * Workaround keys:
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index eb547fedb6da..1bfb25bda432 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -195,6 +195,22 @@ static int pf_push_vf_cfg_dbs(struct xe_gt *gt, unsigned int vfid, u32 begin, u3
>>   	return pf_push_vf_cfg_klvs(gt, vfid, 2, klvs, ARRAY_SIZE(klvs));
>>   }
>>   
>> +static int pf_push_vf_grp_cfg_u32(struct xe_gt *gt, unsigned int vfid,
>> +				  u16 key, const u32 *values, u32 count)
>> +{
>> +	u32 klv[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT + 1];
> this magic "1" is GUC_KLV_LEN_MIN, please use it
>
> and maybe we don't need this temp storage and can use CLASS(xe_guc_buf) ?

ok

>
>> +
>> +	if (!count)
>> +		return -ENODATA;
>> +	if (count > GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
>> +		return -E2BIG;
> this looks like our coding error, use assert instead

ok

>> +
>> +	klv[0] = FIELD_PREP(GUC_KLV_0_KEY, key) | FIELD_PREP(GUC_KLV_0_LEN, count);
>> +	memcpy(&klv[1], values, count * sizeof(u32));
>> +
>> +	return pf_push_vf_cfg_klvs(gt, vfid, 1, klv, count + 1);
>> +}
>> +
>>   static int pf_push_vf_cfg_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 *exec_quantum)
>>   {
>>   	/* GuC will silently clamp values exceeding max */
>> @@ -269,9 +285,11 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>>   }
>>   
>>   /* Return: number of configuration dwords written */
>> -static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool details)
>> +static u32 encode_config(struct xe_gt *gt, u32 *cfg,
>> +			 const struct xe_gt_sriov_config *config, bool details)
>>   {
>>   	u32 n = 0;
>> +	int i;
>>   
>>   	n += encode_config_ggtt(cfg, config, details);
>>   
>> @@ -297,8 +315,15 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
>>   		cfg[n++] = upper_32_bits(xe_bo_size(config->lmem_obj));
>>   	}
>>   
>> -	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
>> -	cfg[n++] = config->exec_quantum[0];
>> +	if (xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)) {
>> +		cfg[n++] = PREP_GUC_KLV_CONST(GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY,
>> +					      GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
>> +		for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++)
>> +			cfg[n++] = config->exec_quantum[i];
>> +	} else {
>> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
>> +		cfg[n++] = config->exec_quantum[0];
>> +	}
> I guess it's time to extract above chunk to new encode_sched() helper
>
> there we could encode both EQ and PT and avoid double call to
> 	xe_sriov_gt_pf_policy_has_valid_sched_group_modes

will do

>
>>   
>>   	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
>>   	cfg[n++] = config->preempt_timeout[0];
>> @@ -328,7 +353,7 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>>   		return -ENOBUFS;
>>   
>>   	cfg = xe_guc_buf_cpu_ptr(buf);
>> -	num_dwords = encode_config(cfg, config, true);
>> +	num_dwords = encode_config(gt, cfg, config, true);
>>   	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>>   
>>   	if (xe_gt_is_media_type(gt)) {
>> @@ -952,6 +977,21 @@ static const char *spare_unit(u32 unused)
>>   	return " spare";
>>   }
>>   
>> +static void __set_u32_done(struct xe_gt *gt, const char *name, u32 value, u32 actual,
>> +			   const char *what, const char *(*unit)(u32), int err)
> please keep the pf prefix:
>
> 	__pf_config_set_u32_done(...
>
> and maybe we shouldn't change the meaning of the "name" here (as it's still about PF or VF)
> but rather augment the "what" was changed, like:
>
> 	"execution quantum" ->	"group0 execution quantum"
>
> so the only helper we need is:
>
> const char *to_group_name(const char *what, unsigned int group, char *buf, size_t size)
> {
> 	snprintf(buf, size, "group%u%s%s", group, what ? " " : "", what ?: "");
> 	return buf;
> }
>
> then we could call existing helper as usual:
>
> 	pf_group_config_set_u32_done(gt, vfid, value, actual,
> 				to_group_name(what, group, name, sizeof(name)),
> 				unit, err);
>
> which will result in:
>
>   [drm] PF: Tile0: GT1: VF1 provisioned with 1ms group0 execution quantum
>
> or
>
>   [drm] *ERROR* PF: Tile0: GT1: Failed to provision VF1 with 1ms group0 execution quantum (-EIO)

ok

>
>> +{
>> +	if (unlikely(err)) {
>> +		xe_gt_sriov_notice(gt, "Failed to provision %s with %u%s %s (%pe)\n",
>> +				   name, value, unit(value), what, ERR_PTR(err));
>> +		xe_gt_sriov_info(gt, "%s provisioning remains at %u%s %s\n",
>> +				 name, actual, unit(actual), what);
>> +	} else {
>> +		/* the actual value may have changed during provisioning */
>> +		xe_gt_sriov_info(gt, "%s provisioned with %u%s %s\n",
>> +				 name, actual, unit(actual), what);
>> +	}
>> +}
>> +
>>   static int pf_config_set_u32_done(struct xe_gt *gt, unsigned int vfid, u32 value, u32 actual,
>>   				  const char *what, const char *(*unit)(u32), int err)
>>   {
>> @@ -959,18 +999,47 @@ static int pf_config_set_u32_done(struct xe_gt *gt, unsigned int vfid, u32 value
>>   
>>   	xe_sriov_function_name(vfid, name, sizeof(name));
>>   
>> -	if (unlikely(err)) {
>> -		xe_gt_sriov_notice(gt, "Failed to provision %s with %u%s %s (%pe)\n",
>> -				   name, value, unit(value), what, ERR_PTR(err));
>> -		xe_gt_sriov_info(gt, "%s provisioning remains at %u%s %s\n",
>> -				 name, actual, unit(actual), what);
>> -		return err;
>> +	__set_u32_done(gt, name, value, actual, what, unit, err);
>> +
>> +	return err;
>> +}
>> +
>> +static int pf_group_config_set_u32_done(struct xe_gt *gt, unsigned int vfid, u8 group,
>> +					u32 value, u32 actual, const char *what,
>> +					const char *(*unit)(u32), int err)
>> +{
>> +	char name[24];
>> +
>> +	xe_sriov_function_and_group_name(vfid, group, name, sizeof(name));
>> +
>> +	__set_u32_done(gt, name, value, actual, what, unit, err);
>> +
>> +	return err;
>> +}
>> +
>> +static int
>> +pf_groups_cfg_set_u32_array_done(struct xe_gt *gt, unsigned int vfid,
>> +				 u32 *values, u32 count,
>> +				 void (*get_actual)(struct xe_gt *, unsigned int, u32 *, u32),
>> +				 const char *what, const char *(*unit)(u32), int err)
>> +{
>> +	u32 actual[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
>> +	char name[24];
>> +	u8 g;
>> +
>> +	get_actual(gt, vfid, actual, count);
>> +
>> +	for (g = 0; g < count; g++) {
>> +		xe_sriov_function_and_group_name(vfid, g, name, sizeof(name));
>> +
>> +		__set_u32_done(gt, name, values[g], actual[g], what, unit, err);
> in case of error, does it make sense to report the same error up to 8 times?

yes, because we print the value that is left active, which can be 
different per group.

>
>>   	}
>>   
>> -	/* the actual value may have changed during provisioning */
>> -	xe_gt_sriov_info(gt, "%s provisioned with %u%s %s\n",
>> -			 name, actual, unit(actual), what);
>> -	return 0;
>> +	if (!err && count < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
>> +		xe_gt_sriov_info(gt, "All remaining groups provisioned with 0%s %s\n",
>> +				 unit(0), what);
> this prints:
>
>   [drm] PF: Tile0: GT1: All remaining groups provisioned with 0(infinity) execution quantum
>
> but there is no info about the target: PF or VF1
>
> but OTOH do we need to shout about implicit configurations, so maybe just drop it?

ok, I'll drop it.

>
>> +
>> +	return err;
>>   }
>>   
>>   /**
>> @@ -1869,11 +1938,16 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>>   	return 0;
>>   }
>>   
>> -static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>> +static u32 pf_get_group_exec_quantum(struct xe_gt *gt, unsigned int vfid, u8 group)
> do we need to use fixed size integer for group index ?

This function will just be removed due to other suggestions

>>   {
>>   	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>>   
>> -	return config->exec_quantum[0];
>> +	return config->exec_quantum[group];
>> +}
>> +
>> +static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>> +{
>> +	return pf_get_group_exec_quantum(gt, vfid, 0);
>>   }
>>   
>>   /**
>> @@ -1980,6 +2054,137 @@ int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exe
>>   					   exec_quantum_unit, n, err);
>>   }
>>   
>> +static int pf_provision_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
>> +					     const u32 *exec_quantums, u32 count)
>> +{
>> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>> +	int err;
>> +	int i;
>> +
>> +	err = pf_push_vf_grp_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY,
>> +				     exec_quantums, count);
>> +	if (unlikely(err))
>> +		return err;
>> +
>> +	/*
>> +	 * GuC silently clamps values exceeding the max and zeroes out the
>> +	 * quantum for groups not in the array
>> +	 */
>> +	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++) {
>> +		if (i < count)
>> +			config->exec_quantum[i] = min_t(u32, exec_quantums[i],
>> +							GUC_KLV_VF_CFG_EXEC_QUANTUM_MAX_VALUE);
>> +		else
>> +			config->exec_quantum[i] = 0;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void pf_get_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
>> +					u32 *exec_quantums, u32 max_count)
>> +{
>> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>> +	u32 count = min_t(u32, max_count, GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
>> +
>> +	memcpy(exec_quantums, config->exec_quantum, sizeof(u32) * count);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_config_set_groups_exec_quantums() - Configure PF/VF EQs for sched groups.
>> + * @gt: the &xe_gt
>> + * @vfid: the PF or VF identifier
>> + * @exec_quantums: array of requested EQs in milliseconds (0 is infinity)
>> + * @count: number of entries in the array
>> + *
>> + * This function can only be called on PF.
>> + * It will log the provisioned value or an error in case of the failure.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_config_set_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
>> +						   u32 *exec_quantums, u32 count)
>> +{
>> +	int err;
>> +
>> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	err = pf_provision_groups_exec_quantums(gt, vfid, exec_quantums, count);
>> +
>> +	return pf_groups_cfg_set_u32_array_done(gt, vfid, exec_quantums, count,
>> +						pf_get_groups_exec_quantums,
>> +						"execution quantum",
>> +						exec_quantum_unit, err);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_config_get_groups_exec_quantums - Get PF/VF sched groups EQs
>> + * @gt: the &xe_gt
>> + * @vfid: the PF or VF identifier
>> + * @exec_quantums: array in which to store the execution quantums values
>> + * @max_count: maximum number of entries to store
> just @count ?

ok

>
>> + *
>> + * This function can only be called on PF.
>> + */
>> +void xe_gt_sriov_pf_config_get_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
>> +						    u32 *exec_quantums, u32 max_count)
>> +{
>> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> maybe assert that count <= MAX_GROUPS ?

ok

>
>> +
>> +	return pf_get_groups_exec_quantums(gt, vfid, exec_quantums, max_count);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_config_set_group_exec_quantum - Configure PF/VF EQs for a sched group.
>> + * @gt: the &xe_gt
>> + * @vfid: the PF or VF identifier
>> + * @group: index of the group to configure
> GuC ABI does not allow directly to setup single group EQ, so why bother?

will drop

>
>> + * @exec_quantum: requested EQs in milliseconds (0 is infinity)
>> + *
>> + * This function can only be called on PF.
>> + * It will log the provisioned value or an error in case of the failure.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_config_set_group_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>> +						 u8 group, u32 exec_quantum)
>> +{
>> +	u32 values[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
>> +	int err;
>> +
>> +	xe_gt_assert(gt, group < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
>> +
>> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	pf_get_groups_exec_quantums(gt, vfid, values, ARRAY_SIZE(values));
>> +	values[group] = exec_quantum;
>> +
>> +	err = pf_provision_groups_exec_quantums(gt, vfid, values, ARRAY_SIZE(values));
>> +
>> +	return pf_group_config_set_u32_done(gt, vfid, group, exec_quantum,
>> +					    pf_get_group_exec_quantum(gt, vfid, group),
>> +					    "execution quantum", exec_quantum_unit, err);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_config_get_group_exec_quantum - Get PF/VF EQ for a sched groups
>> + * @gt: the &xe_gt
>> + * @vfid: the PF or VF identifier
>> + * @group: index of the group for which to get the EQ
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: execution quantum in milliseconds (or 0 if infinity).
>> + */
>> +u32 xe_gt_sriov_pf_config_get_group_exec_quantum(struct xe_gt *gt, unsigned int vfid, u8 group)
>> +{
>> +	xe_gt_assert(gt, group < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT);
>> +
>> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	return pf_get_group_exec_quantum(gt, vfid, group);
>> +}
>> +
>>   static const char *preempt_timeout_unit(u32 preempt_timeout)
>>   {
>>   	return preempt_timeout ? "us" : "(infinity)";
>> @@ -2527,7 +2732,7 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
>>   			ret = -ENOBUFS;
>>   		} else {
>>   			config = pf_pick_vf_config(gt, vfid);
>> -			ret = encode_config(buf, config, false) * sizeof(u32);
>> +			ret = encode_config(gt, buf, config, false) * sizeof(u32);
>>   		}
>>   	}
>>   	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>> @@ -2554,6 +2759,11 @@ static int pf_restore_vf_config_klv(struct xe_gt *gt, unsigned int vfid,
>>   			return -EBADMSG;
>>   		return pf_provision_exec_quantum(gt, vfid, value[0]);
>>   
>> +	case GUC_KLV_VF_CFG_ENGINE_GROUP_EXEC_QUANTUM_KEY:
>> +		if (len > GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
>> +			return -EBADMSG;
>> +		return pf_provision_groups_exec_quantums(gt, vfid, value, len);
>> +
>>   	case GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY:
>>   		if (len != GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN)
>>   			return -EBADMSG;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
>> index 4975730423d7..aaf6bb824bc9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
>> @@ -46,6 +46,14 @@ int xe_gt_sriov_pf_config_set_exec_quantum_locked(struct xe_gt *gt, unsigned int
>>   						  u32 exec_quantum);
>>   int xe_gt_sriov_pf_config_bulk_set_exec_quantum_locked(struct xe_gt *gt, u32 exec_quantum);
>>   
>> +void xe_gt_sriov_pf_config_get_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
>> +						    u32 *exec_quantum, u32 max_count);
>> +int xe_gt_sriov_pf_config_set_groups_exec_quantums(struct xe_gt *gt, unsigned int vfid,
>> +						   u32 *exec_quantum, u32 count);
>> +u32 xe_gt_sriov_pf_config_get_group_exec_quantum(struct xe_gt *gt, unsigned int vfid, u8 group);
>> +int xe_gt_sriov_pf_config_set_group_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>> +						 u8 group, u32 exec_quantum);
>> +
>>   u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
>>   int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
>>   					      u32 preempt_timeout);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>> index ea411944609b..eecdd4aaf972 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>> @@ -159,6 +159,24 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>>   	return buf;
>>   }
>>   
>> +/**
>> + * xe_sriov_function_and_group_name() - Get SR-IOV Function and group name.
>> + * @n: the Function number (identifier) to get name of
>> + * @n: the scheduling group to get name of
> @g or better @group
>
>> + * @buf: the buffer to format to
>> + * @size: size of the buffer (shall be at least 18 bytes)
>> + *
>> + * Return: formatted function name ("PF sched group%u" or "VF%u sched group%u").
>> + */
>> +const char *xe_sriov_function_and_group_name(unsigned int n, u8 g, char *buf, size_t size)
>> +{
>> +	if (n)
>> +		snprintf(buf, size, "VF%u sched group%u", n, g);
>> +	else
>> +		snprintf(buf, size, "PF sched group%u", g);
> 	char name[10];
> 	snprintf(buf, size, "%s sched group%u",
> 		xe_sriov_function_name(name, n, sizeof(name), group);
>
> but honestly I'm not convinced that we need this function at all

will drop.

Daniele

>
>> +	return buf;
>> +}
>> +
>>   /**
>>    * xe_sriov_init_late() - SR-IOV late initialization functions.
>>    * @xe: the &xe_device to initialize
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
>> index 6db45df55615..df2b02cb97d0 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov.h
>> @@ -14,6 +14,7 @@ struct drm_printer;
>>   
>>   const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
>>   const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>> +const char *xe_sriov_function_and_group_name(unsigned int n, u8 g, char *buf, size_t size);
>>   
>>   void xe_sriov_probe_early(struct xe_device *xe);
>>   void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);

