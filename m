Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0158C0219B
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 01:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6212310E783;
	Wed, 12 Feb 2025 01:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQlR8ZoB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A1D10E783
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 01:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739323160; x=1770859160;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wNlPpMQ8HY/OOSdQ6obMQDZE12PDj8i6e135rP42EKM=;
 b=PQlR8ZoBchhvdwzDETRdcu5cQxCQahcOb9ATpdmCPliwhemOb9xX1TTI
 W9GxsjviR6Fd5AnmiIJ4GMt5s2GEuyB7nWnm2ljaOdkUO424oAzuvmDTw
 6EcMFZr0oDV4l1I3DiIlp9kM8Q9LyfrnR3qqMCBsWzT5cE9+2qAU6iloi
 wMTQmNNGkaMDYxz2whkUMIf/zWaxf4O5GqD6WlpFqgPg8XCwCCFxn4OBY
 76WWb38OMfF7+6m4P6C+oexhbnxiBS4dMhm23qwTNob2nVTo7KcejOXUt
 j9DU5mbAROusDz/8R0hCrWosuCYWNDuNsk03R2R3n2XbX6KSJhk+wDAjJ g==;
X-CSE-ConnectionGUID: ax2nJOeORCurMgNBY00ZXg==
X-CSE-MsgGUID: xWHeRDirQ8iKYTO85At8ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43728693"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="43728693"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 17:19:20 -0800
X-CSE-ConnectionGUID: zMS+jbMzSp67rhrgmDvwXg==
X-CSE-MsgGUID: tQYK+xM+TEigmtL/VMNMMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="112665706"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 17:19:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 17:19:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 17:19:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 17:19:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDaAePz1/G/OhQ0x3HlX4oL8bPyUPjPW89c8JEh3Ep/mdGPxlq0jq57y7kYdoEtD/gZiDJHsQDcK4B3guW/FED/g0f/uew9Xt7EONRzTUOlbHaJMOZfAsw/sqoNZWET2rokxrC23vTLQgVbfR4JtLJ9kVz0Hm+LyLPgvnA0N+z8hrnn9MuO45+MEyFMz2Z32UJuhiCHk3uG2nKaQBYpotAb7Ub4LIXYcYIxGuRDi7tXqj8Sg7TWA+MN1jQ3hYbMNGAdFNlxfhctc0XDK5hOBhoJUY1yxm5l//uKBHUKGnzfye0qTAFpIhXNTAh8qnDVnspsmP+7TpVWnGjrjDZvyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZR3splgXt65XwId5cJ+e4z/LyZkCItSFdvEi1TegNGo=;
 b=JBZoHwSUsNKy1V1RHESgXThHjLOLR1MICj/VUGIH9OZruUpTaP7Url/CsOCaWxO9Hn+kO7rtkAm1Ctf8SNy0isnr8kwGWYgB9uuQsoSwGbd15+bc/mdhpIEEWn5VXtdDIWr5ijgToNuz83ieQZFklh/bMSo409BTJh76MDYuYRFxP8unwvsmsbGTcDdoa++K87GQrs4KW5l3k4fYk37TDP9gK4FUSFJEYLD2DAuAv7V5HNyalXKyxwGHt0QBN3j/vGRrHUv7qvdINpYkU5YNFOuRNocAOciTqK21q7086EFyZ4/OesPp0OZh+Y088CUX4ioVJ2+ltMeVRI/wY4WWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 01:19:16 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 01:19:16 +0000
Message-ID: <46c8e0b6-59f1-44f1-b3e7-30075d86bcae@intel.com>
Date: Tue, 11 Feb 2025 17:19:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250211200911.199213-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250211200911.199213-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0362.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::7) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|MW3PR11MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: ac145cbc-524d-4959-3eed-08dd4b034448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VURSTnkzL24vdjdyMDFUbHRCeU5GT1lIbHE2bUFEa1dac2UwemQ3ekZIdlNK?=
 =?utf-8?B?Qm1Vcm9jTG9sM1kyTVVxS3U5SE1zTmdZSS9mK2JRTy9wMWl1dTFrVytKdmdp?=
 =?utf-8?B?dko2c2lQZUQ4Z05nemNNUDdhQTdrcjZ1T2JTeVRHbzR4WmRyZ3RvRm03MXZt?=
 =?utf-8?B?SDgwWmprQkpNVlVuNlZkVzY5U1BSblI0aDBnNnpUaGszbklHOC9nSzJGR2Fl?=
 =?utf-8?B?cytrSXZydnNINDI3K3RQaCsyNnl1Q2FFWS9RbFVlb0pKTnZNMmhhRHdKbk80?=
 =?utf-8?B?T0ErQmVOUkh1NmxXdEF5dERqRDF5R21US2poa0R0RzBWbDBNYjRVTEFsWUpR?=
 =?utf-8?B?Y0hLRlJrWjVVUWhyN0Vqc2VXNWQ4UWFUTTRPMXloQ1crY1YvckJCc3gxUWpz?=
 =?utf-8?B?OGowSVNFbi9Ra2Y3eWhZbUQ3K0lUaktUZG40bHphaE5TVFEvRldqUk8wK1dp?=
 =?utf-8?B?QlBQNnNIMEhLL0RDcHVmRXR3T3o4by9yQUlRVnB5VjcvaTBsV2xsbXBhNXdi?=
 =?utf-8?B?MWt4a3VxVVpZRUJsQUFsQlRZRXMwTWJvcXhUcXYrOUJ2YXlvN01vT2RPQ3J4?=
 =?utf-8?B?cTYrSlNydksycGFwVU1GMitTR0JzbDRjQTRxVm5MVHloRjVLVHluQzlXY3g5?=
 =?utf-8?B?UHlHVGlhMFRDeXhia1hJTGlaQkxuWDlsWHFvZ0h6WGxzRnRGNE9nVFRWemN3?=
 =?utf-8?B?Y1J3MDJpK3hsV1UxM3hzVXNEWlRMamJJYmVmVGRWNERzaWs2bkM2MXVXTThE?=
 =?utf-8?B?R1ZWZVRFUnNBN1doSzR1MG9sRS9XaUtuMWNiVmNrdWFLcEkwakg4bkZNaVk2?=
 =?utf-8?B?V2JDUWZucWFBRHZjS29qMEs1ZzdRbUJ3OFVLYmtRbGZ3dWVzYTRYQ2dhekNE?=
 =?utf-8?B?ZG8zL041TmZVZkFLQWtsbGJtazJvY2RkVHlxWWNNV201UFRiQTczQ0ExU2dT?=
 =?utf-8?B?Nkt1bURvZUI2YlBrV0xpMjdyV2duODJ1OStIQlh6d1Vyc3JDUUwvOUJOT1Qr?=
 =?utf-8?B?UkJ5MlhNUUNhSHY1aW9TRGw4VEg1alVKYkxMbnE2S3RZRE5nRGlsM2dRQ1Mv?=
 =?utf-8?B?S2U4Uzlxdm5qVXh0dVFWd0k5OXplQ0dhU2lxanlBLzBEVEtuekMvRDJxOStD?=
 =?utf-8?B?R2FNMDVVMk5aNWoxWStkQ0tJeFNOcUtZNU5VUnExdEVlSlVVbjdQV1VEcnZH?=
 =?utf-8?B?WndhMzdEcDFYdlY3WGhhOERoRlp5UGZaVkdaYkVBOFNCZkJSK1dLMUYycC9H?=
 =?utf-8?B?dlZXNG0raGxub2lnY2JMM2x1cG84dkYrVVlaS1IwbUM4Tm9zYVVBRCtsZTUw?=
 =?utf-8?B?VTZkWGtjRStWTVJsZHdkc1pQaXpXR1p3UHd2QmZicDVNTlFXSlArSC9CcG00?=
 =?utf-8?B?NE9ZbVlmV3dEby9jcVZKS01uSVZJU1k4dTlEb0NrU1k5MnhSdnJRWWNKeVYx?=
 =?utf-8?B?aDNpWnRsVW8vNm51dnBCM3ljcEpqOTA5WWZ6YW5xOVo5MFpsSUszQW1IQ0dP?=
 =?utf-8?B?Vk5CTUl5WGJ1Sk1ramNxblNJbXpkK2dkUWkwcm1oTXJINFVBS3VTWmRWaXdI?=
 =?utf-8?B?ZEpjNTVJTlBUUEE5a3ltM1k5dkdNaGhGSTMvSXJGQjBnN09JUW5RV3QwRVlH?=
 =?utf-8?B?bGNzS29FYUEzSTgzTjV6d0EzYmxZTXBWOEU0NnhPNk5uOXdqcVZYK0xNc1Rn?=
 =?utf-8?B?aGdQMGM3QUpjbkpxK2hqVlRLRGFDV0x0YXdqV1hHN1IvU1hDN1BUYzFkWkZL?=
 =?utf-8?B?bUdEN2I2OERrUEkyWTlLeGQ4bDFZTkMzVWVNR0FHd1BwQnp2R3lsZ0wyS1Rs?=
 =?utf-8?B?T3I4RGZwVUZCQWdIN3d3dUMvMThSRjZUTTBBR3g1VllNYUtidmxBcHJsK3JF?=
 =?utf-8?Q?g6NWqBd9QTvPt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3lFMFZ4V1BRRXNaUGwvNUhienQ0ZWdvMi9ES1Rveit1M2tVS3ZRM3BDUHJv?=
 =?utf-8?B?eHpydm9JMkRHUFp4UXlRVWYzUkE3aG4zMGFJb29Wa2Zic0pmNEdvSWpOSS9y?=
 =?utf-8?B?T1pWd1czYWt4YlVzeDk0OVdpdDlEakt1S3U5ZVhKRldKcEpuT3M2Q1kwVXlB?=
 =?utf-8?B?dVJtN3NENmVJN1ViaDAzUWVzWVVCcDc2YitybS9rL1JodXd0SEtrTlZlNTUr?=
 =?utf-8?B?K3RBNXA3NlFJQXZlV1dqMGszU2kvcWZ0eG9jYkxIS0JJakVxeUY5VEtMUXg5?=
 =?utf-8?B?SjdIcFZzd0FjQnNiMmlZRXkyY2xLay9PUmxTZC9XaE9qVXZrdm9WeVlwMnlX?=
 =?utf-8?B?SlhEZGs4NUI4cy9CZnA2clpkZEYyb3Ara0I4akZEaThzU3JMUis4Y3VkZW5z?=
 =?utf-8?B?a2ZOUnhpZjNFTzZNN20za2hHeUh3WFdCRWRXa3BtdUhUSjA1cWVwNEwxN29a?=
 =?utf-8?B?ZmR4ZEd6S1pPeVNVcHdoLzJ3VUNES3dVZmE1cS80U0trVHV4bXh2bkJTM29u?=
 =?utf-8?B?Ykx3NHdQeUp3NHpVa3IyM2NGWWF0RDlkYzFDcjkwT2ZZZ2NPUnlZK2h3Mkd0?=
 =?utf-8?B?MGRPOWlHZXM4QUsyVlR0cXBLZm5xNnk5U2M1NGc4bk1QbE5QYXVBaFgzRjRV?=
 =?utf-8?B?YXFYU1FISk1yTWtGeWJBdUVTcC9aWm1QSVJLa3UzelUvTVhrdE5GMUdsalFo?=
 =?utf-8?B?UHprWVZsUVV4RHNnTFgrOXhLOVNZdWdabmZ2eFZ2WmswSFllbnN5UE9tQzRj?=
 =?utf-8?B?MTRFUUN5ajk3YmdVR0pONmpjT3dsa0lqdDJ2Uy95a3pmQTJXaXM1ZUhQVU5Q?=
 =?utf-8?B?SkF5VTB1TFhUWVMrekxKZis5VzNyT2ZsaGNJZWFsU1MwKy9JUDM1bjc3R2p5?=
 =?utf-8?B?d1FYTXFlbzZRUHI1d1JiNmZKMU8yRVhPWDRuWnZQTU1uWTNocWxOeHNKUGlF?=
 =?utf-8?B?cDZWbFhPSGhSVHVGQ2RnQU4rbzBTWWpSV3JpQ2tXbXVBMXJhRzlNNS8yNk1s?=
 =?utf-8?B?ZTRHTHgyS0VsWTEvVkNST0R2QUp4OXpwUWxrRlZlSG92YXRZdFZIN0tKYmFB?=
 =?utf-8?B?bUkrRUMvTWRxQUpDN3JUMkdEMm0zV1ZqVVQ5cGZkS1B3NWtZNlIxWlZONGRC?=
 =?utf-8?B?c1VNUFVoM2VXZ2ExcWxsa3VRdzNPcldiVU9pMmxUUURoS1pWZmpISWxSV2pz?=
 =?utf-8?B?N0xaN1UxbkZqQ0ZNN0lmS2NGR0ZuOWVQb2kxaXNBcHcwd3FOVG5ybC9XTC91?=
 =?utf-8?B?YWJGVHVYdjZSMFN6aUpZSCtyTTBZU0x2ZG9xN2tNQlorTHVScm1EVXBpckZH?=
 =?utf-8?B?QWZjckVhYVFmQlJnMVpRY00vNm15U2Vsbzg4MWV0Z1NpNHZsdURjVXI1OE1l?=
 =?utf-8?B?SllKdFRIeVZFcmhjK3dNT0pMTXZjVFZVaGY1ajA3MFNSWTFvMXRQbnhmKzB2?=
 =?utf-8?B?eGpGcWhiaGwvakhZc1RsenBJT3MyVHBXQ3N3aG9mVWN3bGVRWE1sc1FSOXcw?=
 =?utf-8?B?NUhiVy9KMTkxaVdRRzNHaGF4TmxWMlVKMmRwcDNSS0xrMXFzT3R2UmhTeWJJ?=
 =?utf-8?B?dklhc0krRWgwZkNoNUcxdDlMTmZuZTRpbUdVZ0FKYU9INndzRkVabHBlVjRs?=
 =?utf-8?B?OGZIMitSN2thTUt2LzdSZHJLVFV6d3VKVXB0eWZMSDBUcU5CS1NEbDZNbndI?=
 =?utf-8?B?Rld4ak9IQXQ4aThnb1M5RDNsN1NEdFJkZFJHMWlXcUZyRC9scyswZ2VMRVg1?=
 =?utf-8?B?QVdtWEhUellsZHlvZHR0cndGeUtvYURHVGNidG9CeHhZZnVZRmxmL3dBSWFD?=
 =?utf-8?B?a1p4TE9wblI4eXd3aEViQzFzTGwvL1hwd29wYm5LQXJlYkpITzlUUGdMMURV?=
 =?utf-8?B?TkRoWldXMngxaERIT1UzWkx4dTJBWlJtSmhGWko2QmJ2N1BHSUo3R09Kb3Ev?=
 =?utf-8?B?WVkvMmd6QXhSeTBlVE81ZXdFL3c0Qi9mcGovUXpzaTNpeWthSXdJTExGYUpJ?=
 =?utf-8?B?VXBMLytOWGp3akxQWUg4SmJ1SzJ6YjZ1dWxLUklHeVZFb3pSZ3dHU1dkZkR0?=
 =?utf-8?B?bGpzSWM1NmVudUtORWxmTi9jNnZRSXlUQTVXaFFUWEY4WG5sNkVDMW45Ykd6?=
 =?utf-8?B?Y0lIUGxFem1teHNmdlNCVHpuQ0ZvNWFpRDk1bi9ZSnJFS3p1Ym1GRHdSbU5v?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac145cbc-524d-4959-3eed-08dd4b034448
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 01:19:16.1201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzNei+U1O5OzcfeKtxLcDNnjr42doncKeX9hXLEl3Kv7sS6mNNX8Acx844lad1uMh5wwJ0a697rakuybNIaL2sXIfLxjw+TwrJMg72nTSNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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


On 2/11/2025 12:09 PM, Rodrigo Vivi wrote:
> In a rare situation of thermal limit during resume, GuC can
> be slow and run into delays like this:
>
> xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
>     		 [status = 0x8002F034, timeouts = 0]
> xe 0000:00:02.0: [drm] GT1: excessive init time: \
>     		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
>     		 perf_limit_reasons = 0x1C001000]
> xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> ------------[ cut here ]------------
> xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
>
> If this happens, this can block entirely the GPU to be used.
> However, GPU can still be used, although the GT frequencies might be
> messed up.
>
> Let's report the error, but not block the flow.

Can we expect other random CI failures due to this? If GT is not getting 
expected frequencies, certain tests which rely on this will likely fail, 
causing a bunch of noise. Is that worse than driver load failing in this 
case?

Thanks,

Vinay.

> But, instead of just giving up and moving on, let's re-attempt a wait
> with a very long second timeout.
>
> v2: Keep the precision comment (Jonathan)
>      Use a define for the regular SLPC reset timeout.
>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 26 ++++++++++++++++++--------
>   1 file changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 02409eedb914..3b04b62937eb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -50,6 +50,8 @@
>   #define LNL_MERT_FREQ_CAP	800
>   #define BMG_MERT_FREQ_CAP	2133
>   
> +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
> +
>   /**
>    * DOC: GuC Power Conservation (PC)
>    *
> @@ -114,9 +116,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
>   	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
>   
>   static int wait_for_pc_state(struct xe_guc_pc *pc,
> -			     enum slpc_global_state state)
> +			     enum slpc_global_state state,
> +			     int timeout_ms)
>   {
> -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
> +	int timeout_us = 1000 * timeout_ms;
>   	int slept, wait = 10;
>   
>   	xe_device_assert_mem_access(pc_to_xe(pc));
> @@ -165,7 +168,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>   	};
>   	int ret;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>   		return -EAGAIN;
>   
>   	/* Blocking here to ensure the results are ready before reading them */
> @@ -188,7 +192,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>   	};
>   	int ret;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>   		return -EAGAIN;
>   
>   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> @@ -209,7 +214,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>   	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
>   	int ret;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>   		return -EAGAIN;
>   
>   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> @@ -1033,9 +1039,13 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	if (ret)
>   		goto out;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> -		xe_gt_err(gt, "GuC PC Start failed\n");
> -		ret = -EIO;
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS)) {
> +		xe_gt_warn(gt, "GuC PC Start taking longer than expected\n");
> +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000))
> +			xe_gt_err(gt, "GuC PC Start failed\n");
> +		/* Although GuC PC failed, do not block the usage of GPU */
> +		ret = 0;
>   		goto out;
>   	}
>   
