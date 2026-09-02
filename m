Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4C2C624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 11:46:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F74010E008;
	Wed,  2 Sep 2026 11:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kDfcpWNJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D876510E008
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 11:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788349570; x=1819885570;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LBw4Jj2p9+oO524sw8a4j1OVRGfx9gF4C5qIReloFIo=;
 b=kDfcpWNJkttqobjXiy5sXx3Ku1xxVg7M15bYxcFJ+qgA+CHa1KnOJp7s
 lnkoFe37Qm0PILB77wZKLWm0YorA6fpBshR//eUEO0IPBkxOuEhqTMOkA
 la8cWd2ieEiLbi5WwtCKzYpftzaoP+amkJVpB6wJkFs/9Diu5Ofug9gkg
 WSLeX6yKLG2ZB+4uS1y+Eq7w/Bvq4wMTl0vIyWKICFVD1x9HjGABqpvLT
 p0vz2KmFlMyLpzAXW9lkpcHiUYNyXqB3DPQhvQVpQl2nBHZP7G3wmpCP1
 7fGW1kHKVg6LNT7f4VrD9rsP2+KkL0/5LL+ld6q53bhE3uFFfyP01TVRW A==;
X-CSE-ConnectionGUID: V/O+E9plQkavHlCwKovJFA==
X-CSE-MsgGUID: l/fHteaySk2szvsfJCrMIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="89012334"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="89012334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 04:46:10 -0700
X-CSE-ConnectionGUID: SW0QQg1CRq2PRSdErGr5UQ==
X-CSE-MsgGUID: zmbMDY50St2Hb4zhFpm5Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="265685252"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 04:46:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 04:46:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 04:46:08 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 04:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNh7WGj9G4MG8kqPC7jYwgU3qAfPIKnV8DxTzdkdTil5KBlPyhU5+8w33vx5j3Q+hkM+Egy/WKfPEUC9XR7fVkVPxyTdQBVSbL2g+U0tkVo1efWFoEHux25yXWZmEZpctW6ZVab0RgWG623xPQmfmWULzgNWfLUf6GpmEAbO9HL+VTaWbH0xNyIU0YUxxwirENp4F6odwzH4KioZcbZ1w5B8OD5CLTepVRCSVfQmb860DOjk30mHsxKfdYb09PJGbTCRWH9jvJtR5N6cSQVzEP/Gq2qL7zNe4Erfh3Ha1UIsJTkXo2yt65kgU9UDOWhlYkGUOAa/TckGQ2+XBs9fyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v7NS2FMh+BSx1jTtsZtuKXiSWG+HXyrxAQqt2BcMmM=;
 b=E91Ctty//ErkLDwwCieLH/PiQJ3qua2SWnyW6cEe3hIULbTaoe/O0guXGja2VqPs2geie58XIVGQedpeUqSXrry2LCYJOp6Uj/ash7K6JwcKX3kG+y9wv3E4DEnDlTtpjBclaq35p2EriYk8MPwnuuiKUj8G9TKFV7mNYxvSL9X4iMtWIawhyJ3p1MiuSEO6C3PwW82EhkL2VbFhHAEMHddmz4AFpriuzhaQYrZkWE1dlHdlHktQqb475jk6b0/AZcgOi4hHJ9CMhcERKtqbd3eevH50GKC+0Mspd1Kxw84K48ZZcrtOD53zr69umZPBQE9yJeblUcA0CPz6l8Gm7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB9773.namprd11.prod.outlook.com (2603:10b6:510:398::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:46:01 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 11:46:01 +0000
Message-ID: <50c5a9b3-ad01-469a-960a-c26d356704c9@intel.com>
Date: Wed, 2 Sep 2026 17:15:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] drm/xe/gt: Report GT reset failure using SIGID
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <michal.wajdeczko@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <matthew.brost@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
 <20260901063059.2547247-5-arvind.yadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260901063059.2547247-5-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0350.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::18) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB9773:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fcf020-3f37-41d8-5183-08df08e7c33f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: EcHURZBRwMxJWvniIx0EzJgUTp7t6uRgd2rQM5GedWh1NoLEyaT+aBxvm3F0quh/dF3v/Pr2YPL3puJrsdM4bmEToRaTe0fskyJ95y4IOf4DVBOCcJNFuHqXfG92NQIQQQW4TqFQFnGbIsaq8Y60HXNKEPiTxX1Let/MHX1oBsJMaMNjJiXiy8DKM8UCKeKCX2IwzR57gO2TD9OmHG3+BXkLa+YHTzoISXbrYmdXRMgStN9PBxfYB36ViQY6bSU1GZgJRAsMUmC+Yz+g3FUVOLhiFXtD+O3Y24vwnImEgsSLLcWfFknNXQQk0tKxidqQuxmJuNaVwRBBQ2xBtX2gfBHLP1F32BU6qfk7Zj+HMGsw/7KyP4Z8KeHzmW5KhtDAZK+g7yySUZ+bQa9jWpFbfe1H5wXnb9M2kUqDRqGzMPt75UAxBqvsg3aPqpBWcEmHf58wX21Fz76UBel/4M61zQDPSR7dfmhz88v8NypK1igBOKatUhBiXGApryy6A6fKIBFSId+vwqzqKkXrhUr8F+8dThfYM6hvxZmSq3IhFHJLBgozXrRJSrTN0dWEwRDDPXN40AUn415yhCg0eQPkWHKxWPqJVLV/m9kIGAiW72vqn2oZEH68jOAjU82TPv+c6SzDTrvT/b+oEOAR02tTYc3lU8RXnjYrHxodMvyQ2hc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlZRZFpRVEZmdWJMVkMzNm1FRWVOeGY1UFF5ZTBra3ZLVlU0dlZ3bk9JQWNa?=
 =?utf-8?B?UmdkTkszNi9MMXJSNUpzemdSWXVKMmVVZTcwWHVkLzU1clUvVnhtdk5tbHBZ?=
 =?utf-8?B?cUFpeXAzalFEbDkyVEd2U01adktMclVva1BySnhOSDh6c3MzelJnQVpmWlZx?=
 =?utf-8?B?S0ROTXJlL0FhLzRVR1hXWGtoQTZ5T3ZRMmFnUFQ3S052UVNzbjhqMFZOZzBT?=
 =?utf-8?B?bGpXQVlwRlRWZlRCZTJnQitibHAxeDNFdGZNdzNGd0JrL2VsSVp6M1ZUbERo?=
 =?utf-8?B?WVo5OXFrQlV2VlNEZ2xkYjFOQ2dJL1FiclJQUXdEQSt1aUxNMk1obHNjc2FX?=
 =?utf-8?B?V1hTZncweGYxV2g2V2tYS2tyZGIzY3lwV1oxMysrK2hYRVMwUUxBUXpGOGpq?=
 =?utf-8?B?NjRTREVDYlVLeDFkQi8zTHBlZ1RQMlI3Q0tZZ1B3WnhXenRkMEhwWU50RytX?=
 =?utf-8?B?bmlMSlFQMXpjenAxUWlxUnhrTlhQSGpMaTBvWTlSQ1JDdUdielpsVTVneXZN?=
 =?utf-8?B?S0xuR21vdXpsZEJ0MmJaN0FTWWhmeVZMWnYwNy9sditCMzJMVkkwN1JSSml0?=
 =?utf-8?B?U2xoRG53Tk1va2pCSjVtUEJzZjRmaUJoOS9CRCtxRnJ0QkxpQTlGWW8vbWFB?=
 =?utf-8?B?dkdZYUxhS0pHZXVkT21CTVA0aWFoYytvWk9CSmtuVS85NXNjNGhQRWtNYVdw?=
 =?utf-8?B?NnJnU2lwMWJpQ2wzbWlhdmxYYTFMV1NhWktnU2grQmpxQzFRSjZNeldWUmJL?=
 =?utf-8?B?NksrR21EeUZwckhXaEdSN25lMDM1WDJkTmJ3YTlwWFR3U09tNVgrc29MclAr?=
 =?utf-8?B?VFdmdWdjUld1R3k5dVA5M09GaXc0TVhZdVNoN21rR0R5b25mOU9aMjVwNEFV?=
 =?utf-8?B?NVM0NnF6NDkrTXo3L0lQYnhBOG5jNVVHWlowdm5QNjhBTEZaUnJMNVhFdXJB?=
 =?utf-8?B?RVM1MDk4d0xZMGdXYXVZNHAzaHowNGFVbWJrUXFiRExJNWNtM21pWU1lNkVi?=
 =?utf-8?B?ZG9ObkNPZGljVG5lNU9aNG51azlZWUdtTkpzR2NzTjZRNVovVUM3WCs0eDFS?=
 =?utf-8?B?MXg2WlhyQzFFUE5QZW9pdHFjTW1VazFuRWVPOGQwNmFON3d0RDdhQnN3NGdG?=
 =?utf-8?B?M1ZCN0c5SUhkUVIza1RIdG9ENHJTMXZhZENZQVBwclhGdjJZeUY0elpZQU1z?=
 =?utf-8?B?eG1hcHdFeWVLS0w4L3dmL0R1TkkzWWwxcXVpWHpzTVJQR2RxRnlJWUJNTTRr?=
 =?utf-8?B?MGR3Mk1STW03Yk5QK25qQndzR0praEF4YiswWlMzYWxTTlpJVzErU0doYXVY?=
 =?utf-8?B?dHpFZGJmMUhxOXN5RWtqbEs4cExDMTdvRmpHbkg3TE5ySGFvdU1tYnFaSjZv?=
 =?utf-8?B?NERubjlGWVRCZEhjUFMwenl1c1FmcEcyVU1LbmJwcWNZU0FhMFpXbk9XNmZJ?=
 =?utf-8?B?K2RrVUVERW9DR0g2WXRxcElGZVI2V040ODUzRUh1TFIrRisvMUFsd3VLM0ps?=
 =?utf-8?B?SEIvN0dvZTRyT1RpOGw2UUs5ekgwbmpEL1dXOTRxVjV3Zlk5YktkRnBZRnh1?=
 =?utf-8?B?Q2hOY1lZQk9SWjZEK0dqU3VlM2hyYmpwT0M3UXIyYjFrN1l3OUM4TTNCRGxa?=
 =?utf-8?B?TzVmdG5XYUR2RExXbHZwcG1DWVFUYSsxUmNoMHVmTE5GZytOYUtHcS96SEVR?=
 =?utf-8?B?TjRSY3Q3KzlDNHVnZS92VGVLOUt4MVY1WDYrM25GVlcwMWlKd1BlaTA3K09Z?=
 =?utf-8?B?bFlnVTdyVXA1NGlrWU1sYnNibzFUNGZzQnZpNytiTy94UVpxeURlckFmbVNp?=
 =?utf-8?B?UkJvOEh1aVBob3JVMHB5bTdBTFpsdVpNMUVndUN0d3RkQ0hJLytpUTJUYUtJ?=
 =?utf-8?B?SlRkWWdlZldLQjRZa1Nuem9HS3FzS2N2QUxEQmF1Ylkrc2dBK09CSUttSzR5?=
 =?utf-8?B?cm45WEE2NWkwK0RyQ0pxZjhwWmx5SjlwamRoTXdEZE1rdnhMZHlqUE9SMWJK?=
 =?utf-8?B?TjdwZjZzWVFudVh2dDFFOGdCOVhTY29GTzExNlBBcTFzL29ZUm91eXZKckw1?=
 =?utf-8?B?Tnc2ZVFYeDRGNjgwblJsWlFja1UyMjJJUEVBV2IzVWtQNmdiK3BaNnZ0K2ps?=
 =?utf-8?B?cFVuNFAvb3A3VTlySXR4OWU5Q0NicU1YdTdLU1NMejE0Q1p5N3RhL2RQdDJp?=
 =?utf-8?B?ay9RTGtrci9RbFc3dEdNWGJNTzVkaDU2cXljLzQ2OW55S0o4S212Z0N0Tzky?=
 =?utf-8?B?ei9icERIQ0pmQjEvQkFLak11NExYR0h6aE9ZSkhyQ2JsK21NWEZjQ2ROV2Fp?=
 =?utf-8?B?U1BaMjVLNU9ZUjhOL1lRZEV6bk9XcDlDS3ltY29oNkMzTFVyWjBIK1Rmc01S?=
 =?utf-8?Q?ek1utjURuwPPxrX4=3D?=
X-Exchange-RoutingPolicyChecked: G1QEDuF+f+yHzOOLkUqHqxLIOHfOdEKUIxslQOnd+7wY7iDLRVc2ZlR5sAFslph1GHKxGlhuJDpn+qaGVW7YQpbxbpTXCyHUWUFpcl14nhx5lqXJn3D9tXYiCyyguZzeZ9ccIAs2ADWf6mBy4nK9WQ0445IedulGUuj/+PXuV5tchucUoit37P65oBFmZJIyVPGr5jbXzhjIAjiN1tXTMhAsGS9Lg7K6fGOfikEatG/GqVOxSszTIoZFZyIEIiXPTFOuzKV+E9SKvJwHpROo/lMwNOyVaZwEcogYaKtR4lcTZDSzgoRTgYG9WYZ32bkDOSaOtU+y9CVf/m++G6MxfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fcf020-3f37-41d8-5183-08df08e7c33f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:46:01.7136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKdrPFvsR8+S4fv9B9f55MU4tuPMYn5QdJTJeCenqbrUw37pMrXcVoJsF96mY00w4J/jzyr9HaXg2K5qSsSrGW9DsJJcrpP0pHL/aWQWruI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9773
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


On 01-09-2026 12:00 pm, Arvind Yadav wrote:
> Route the GT reset failure log through the structured SIGID logging helper.
>
> Failure to complete the full graphics reset means GT reset did not finish
> as expected. Use the GT component, which maps to XE_SIGID_GT_TDR, and pass
> the reset errno value to the helper.
>
> Also update the message to describe the actual failure. The driver does not
> clear GRDOM_FULL directly. the reset should complete and clear it within
> the timeout.
>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v6:
>   - Corrected the GT reset timeout in the log message to 5 ms.
>     (sashiko)
>
> v5:
>   - Kept this patch limited to the GT reset failure path. (Michal)
>   - Improved the GRDOM_FULL failure message to describe that full graphics
>     reset did not complete. (Michal)
>
>   drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6805e0d3bf21..d72c7ec9a956 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -824,8 +824,8 @@ static int do_gt_reset(struct xe_gt *gt)
>   	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
>   	err = xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, false);
>   	if (err)
> -		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
> -			  ERR_PTR(err));
> +		xe_log_err(gt, GT, err,
> +			   "full graphics reset not completed in 5 ms\n");
>   
>   	xe_gsc_wa_14015076503(gt, false);
>   
