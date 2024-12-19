Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F82E7718A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 20:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265E210E092;
	Thu, 19 Dec 2024 20:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kk5BHXff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F07410E092
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 20:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734639879; x=1766175879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ATFq2MJoA6O2yvx6sCITg5UH5k8nCjV2IOE3rIsG708=;
 b=kk5BHXffv0sulPDVcS2gS17x6txXh3s8XnSpdsQ6ErOxt4dwnyNhGv/k
 p5BVuLtHRvTcegZy3unkNxnweYfoKwT1MELnouckkqUc+o4IckyA99FLq
 TFi2mh+GbvIHHVlmlUkJpcD8vXbQyKbNKcbfeZoBVvBxFFdUxggJEYckG
 mbe3ENag7XXXgqUa0AGXtRosyKaVMDd6gL/25IR0z621nsyzMdZRTdj/N
 yghbUYvjtA+Kdlx8RnQflVunFIODU43tOsJTFLnWTzB55FFsd5oNAG6Ez
 eZB3dx7Ncw3OE/bcZl/lKaJTrfqzcyb9uLKXupPR8oQR+gyVcbtaqBRZZ w==;
X-CSE-ConnectionGUID: dFExk1ezRd+weFFoVF5Zmw==
X-CSE-MsgGUID: B9C41Sk5RGyfkXsHMqo+uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="57646400"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="57646400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 12:24:38 -0800
X-CSE-ConnectionGUID: bWuUBXY7S6WF04FAXKeAlQ==
X-CSE-MsgGUID: aC2ZwpzqQ7+pyulhbFzDpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98505383"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 12:24:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 12:24:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 12:24:37 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 12:24:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfnZBREvrJbuWqZzHnLQq+lW76YE0gKt6kfp1JCN0X1X4bPXlN5KfVFT+EFPM2u3YJmnFtpv4Q1EvTMdr1eGlmfhqKQK3gxPs0UJXscvm3lLCF5Lm6fF99P1EfY5F3Ao3CNspBr7XHfWLQq84lQNM0NZfbwGYP1fBg67Q0Wi2FThhmRbNu68tEXGm/Qtamyh/0kxBD1dRq03CMDAwzVZhSbe52RmBlokpXzFzEymwcGtyKwMXdwR6gxBx3r+ZEls3Pg5ayGDypy1p5ajCkU5DPxfHvS1H8VHhy45M5RjMUTNAMZKH+schXWo4ybUfgBvl2l+G57pjgDTskH0sz5++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYtGGtoGXD0pCN7uw/FLe881cY+ux3EQUXNqf9FJCfY=;
 b=IMr3/5da39GEwylVl/kH7aXY9zXmZMAMk3Kow1LrivQ+F2Jt/kAnwf2T5R9jpQhYPTtpbyQScbPzRou8bO2XTtYeAXCvxQWyAGXGTMzgfKXmeu6Q/zI5AfQ7SXLfGgWlDsLPEyroGz07cdiGLtCjT0N0/ahwsGw9KQpOrJNpb5sBK1X6uVAdEX6HCebrzj1vrYBJXD7QeXpLwZIT0JrFvb9i4txXWh+S8gY8bhDzEtCFa3hRyLBiI2hb43a5LUlMuLbi6ZSBtu8Bd40Fb53x5J7jmYx1U9mYCx0AJzs6Ow/VZSTsvoSkLn+1i9k9GVtarBmxA4Rx5JkHVF26JSDEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6426.namprd11.prod.outlook.com (2603:10b6:510:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 20:24:34 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 20:24:34 +0000
Date: Thu, 19 Dec 2024 12:24:32 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Fix fault on fd close after unbind
Message-ID: <Z2SBAO2aT6cqKLJl@orsosgc001>
References: <20241218053122.2730195-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241218053122.2730195-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:303:83::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dea4312-a952-42bc-4ac6-08dd206b26c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTd5VUg1QkRqUnB3Z1hDWlh4ZTZ6cmg4OUpCNnZ0c01MOGRFTHJHNTVSMEFo?=
 =?utf-8?B?OFQ1eVY1ZzE2ZFhYSm9uNmhINjl1MlA4WEJQR3dISzZiMTBEaUNRTW5hemFk?=
 =?utf-8?B?dXRFWlNyYlRmcUtHNXh6ZzY5bExELzFHcXlWY0JiQzJQcFRYNWNjRkQwLzRE?=
 =?utf-8?B?eWs2eGtySElSbkhpNy9mTXJJUGlsdHFlSngxQW51ZWtycEs5RWkzQng5bW91?=
 =?utf-8?B?YWpCTE5oWlB6QkRnVFZvSGt0QWNKN2svSHgwektVSjR4Yk9UTU00bDl1Wm95?=
 =?utf-8?B?WmxNTVphQUNWa0xIalpwWVpYeE1xeDJ6TDVaQ0owRURtcXVKakpjWFFRVS9C?=
 =?utf-8?B?SjV1bDZ2a2xYa2dNQmlGdnVhcC84UkFUZlZxMnk5KzZkemRFNlVqZmJmRFAr?=
 =?utf-8?B?SDFEZGpXYldpQjRXc05nTkVpcXBueUNHSWxYUDJIUlZDTjNrMDRGcENkVHFE?=
 =?utf-8?B?WVJtS21hdVRIS0FTcmRqQUNDNG0vUnFLZ2dySkUrenhQQVlqNmZSWERValE3?=
 =?utf-8?B?OU9BOU5KM2VCdVRZZjRiaUdzbkg5U0pRUXNtNzJmOW5GalZFcndYNWR1UmFo?=
 =?utf-8?B?eXdQLyt6aG9rU25mcEVKa29TMUZpWDQzVnpGREZNSis2cnNMYkJwQXVjb0dX?=
 =?utf-8?B?SEdpTnJRLzlHc0tUbGRISm9INExDQkxxNHJrVDh5UEF3NTJFbEF1VU5NMGVt?=
 =?utf-8?B?NzRKWWdFZldRL3lIVXpMaWdzeVNUb3cyTGNUTy9KMHhNeWdPZEhFY2RRUG5V?=
 =?utf-8?B?TXh0WTFLVGUvT092bXZrOHNxcEFhbUgxc09FOFY4cS9pLzRnQnZuNmtDZ3ZF?=
 =?utf-8?B?TkpjTkIwSVdEU1g1WVZqRFJjTDR6K2IyZDdkbldMdHdBZjFiM2szaXVla2lt?=
 =?utf-8?B?S2plS2h6WDBBdytoMi9vZ1ZiZzh4R1YzUENuTXhCTnNFYUs2OVNKL25POHY4?=
 =?utf-8?B?ZmNTVEdUbTRMTUZ6anRZb0M4eVV2ZEVxVUU5ZW1qUVg3T1gzY0dGNW0wbTM5?=
 =?utf-8?B?b3NCemtsTTJqbG83N3BWcWl2VnBSMkoxcVJyZFVMOWFxVjZ5SlUrMmh0N3dD?=
 =?utf-8?B?TURPRlBOVS9FSmMyWVUxMi9PWjgrdlpLQ2JpQmN1VU5adTBsbGR0OWhBWW9S?=
 =?utf-8?B?NVk3YVpNTUpPYnlEVFVPNHVoZ3NLQjdNcU4vQmhlR1Z6WGhqRjZaRUpEb21V?=
 =?utf-8?B?MnZ5TDhNUTE2eVozU1llMFV0dHd4dld0NDZqWWdQQnh0dmh6ckszdy9CSXU5?=
 =?utf-8?B?TllGL2dNRmwyejRubUlsOUttWFB0SWUwbHRGWjJaOG9JcW9qZVNDL0hDRGJF?=
 =?utf-8?B?K1V3dlduYU5jNlltVWdwVDBBYmlmNVZGbnZ1VVplYXdBK1hVQnJnbk5Wc1FJ?=
 =?utf-8?B?WkcvVXBmWEZKRTJEMFYzbzdCeWp1SEJ5VzlCZkJ5Smx4RStoWmpQbFNLZVNp?=
 =?utf-8?B?V2NlMzNlT2p2enRrLzh5bW1NeVRSQ1BQbUFSZWxQTDRvQ09LVGJxbFp1M3FG?=
 =?utf-8?B?VE5JYUtoTTFkUGl4TnR3RGxBOHRvSG9HN2Y1d2VLa0pwdjFjbVF1OEhOcDlH?=
 =?utf-8?B?UUo5YVRXNkxvSktUclVCOFkvMlVsOWpWa1R3LzZtZ2gvZFZRRk42d1JXcGtR?=
 =?utf-8?B?Ym9kM3J3R21NUjRzR2sxTDdtUEFWY1ZQcmZqWjJCdTJnOHV6R0R3MkhZcUg3?=
 =?utf-8?B?ZWY2U2FFWlRCQUM2NkhFdUJSdDRQL1k1VTRpTUhDSG10RkR0eXlvQ3hkWXd0?=
 =?utf-8?B?REdkNktKN2hZdndYU3NkYXpjQms1RGhHM2hwREttU1pKcFlUSmQ3TUoyeEJ3?=
 =?utf-8?B?MkNiWk1XeHQ3anQ0cmdCZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWR1dkY4aERBM1hHbU5NNXJkZ0l0aEhtbzJqM1Q3RHRmQ3hmaURJNHo5SVIr?=
 =?utf-8?B?VGpESC9yMVJpWUxyWVR4QWRid3NVRTQyZldyeis4Q2R4UlNYRXNTQ0ZzOVlL?=
 =?utf-8?B?aFNpKzhvYWNkTXpHRVJYUlRpWWRsMjdzR2xacVB2WFJGRFR6K3Brc0xkTDd4?=
 =?utf-8?B?WXo5dWFRTW5VTXRIT3A5TG5mNmtvME1pN01Ob1RzWTBjSExDbHVwNTEvYXNO?=
 =?utf-8?B?blIyelBiUW44WTFQekhKZjVjR2hyZ09Qd1Y5ZGtTd0NpdHY2M2lwWjd3QVpR?=
 =?utf-8?B?alcvWEhVUmRpaUVOWUtiRWYwbzhoclZubGRHWHcybHM0bDBOU3lYY1pUb1Vs?=
 =?utf-8?B?bldVSEU1YnhBRWxwNUxhdmFvbzNXblRIQUM2T1dXQ0dyazFoNGpvYmlRQk1I?=
 =?utf-8?B?UUNyMGxWcVQySHFDQVRvMTl4U0tUTHBkQm1NVkdUa2FaSlZheVZKRzR3d0VV?=
 =?utf-8?B?ajIrN0JMZkl1TDRrQkhNSnpjZ3QxUlRvemxiNmJKM1U1aUwyTVNpeksxdXVY?=
 =?utf-8?B?Y1VuUHFOb04zWTQzYVNUcGxCYkV6YmhVNGNYTUFlVk8rekM3andhQXdNdWhL?=
 =?utf-8?B?VGdJcSs2dUgyczZRN081OGpPVXNPSXE4Z2FkS1IrSnRMUitLWjN1QWdSRGJt?=
 =?utf-8?B?MDM2MmxzV0FJTjZMLzVISEJiZ2t5VmZUK3VTMnFVZms5cXZIdHhib1ZDbzJX?=
 =?utf-8?B?NzJPZ0pLeWxkTXYyYy8vQlI5SFJPRFFnRHFzYXllYWFFRTNINGFoQi9IV1Rh?=
 =?utf-8?B?MXlRZkxGVFRyb0Z0cWlMTEFpZDEyM1RnVjJoZCtaUHNBejdUT2dwaUd5MSt3?=
 =?utf-8?B?eGFKdDNiWlRyYnJGUVNtdE12Ujhub1Q5NlJjL0lDdVg5UGZSdmN0SFYwWjNM?=
 =?utf-8?B?N0dVc2NxYXpPNXh1NFVXSWk2Z1FYV3QvTGlEWlpaV3BCTjRGZURwKzJHVHk5?=
 =?utf-8?B?YlV6QUI5MHdLN0lUTHlLSEdsejVUeEQ0NjRhZDBoeFhDbjlyQVpxdkZsWVIz?=
 =?utf-8?B?cGFPUWZ3YVNOaGFUeExzQ29lUXZabmZzRXN5MFJPMEVtdTRIUGVZWTlSb0RJ?=
 =?utf-8?B?MlFrUFpDYjB6K2lMMnRPOEFrZlljODlMWWlqdnJpR3ZUN2cxT082MWh6cnZV?=
 =?utf-8?B?MEFjMDZqRFY3OFQ4ajA1bjZrVnlIdWNmTUc2blArcUltc0NCQ3NjakNWWVlX?=
 =?utf-8?B?eWEwY2pNdFEzOWV3S3lQbUVhei8xay9mM3hoQnY4U0s5aGVoMzZEVnRCVmh2?=
 =?utf-8?B?VHd5QnJjK2xtWkkrRXpOaDJqZDVtbnY3Y0Vna1ErL3F1R3kwN0ViRkpCcmky?=
 =?utf-8?B?TmFOdHA2cTRCQnE4TzJRdmRrQnpIbVQ0aHRuUWFqZi9tS3VNU2VVR24vWGt1?=
 =?utf-8?B?bVdPdENZMUR6Nk11eDFJckpNZDVUQkZYWXV6V2pBUWtKVWd0T2RmbTZPa0tJ?=
 =?utf-8?B?QXl1SCtDOGdPRUo2LzlCU1JMM1ZoNTBhZHJJb3ZDcUdUN0ZlQlYyVFJVeHdw?=
 =?utf-8?B?cEQ3VXZIaHY1bVM4MFdlZGZiQlFSSzhVU3o4YXZKc2VxWnd6RW9ORkwrdVJV?=
 =?utf-8?B?b0RCNytBem03SVVqdElEMUY1SUJmb3JHL1lXUHZ1WnpYZnB0K1NoY0NnMFhx?=
 =?utf-8?B?NEJxclBOUnBBV0xNbkk0Z0Y3NXhCUDdOQTZJRS9kaUdVQ0xpTFdRSjhlcmpq?=
 =?utf-8?B?MGN2ckdROENXdjF2UDBPaGNmWE4wTzA1MFVBUTRQYjltcVRqc3hIckhGUGpz?=
 =?utf-8?B?NjZQUGhtL3FlMyt4Y3ZWK3dYaHJZV3ZScUw4eXh2cnJjVUxjbFpvN2ppS1ZN?=
 =?utf-8?B?dHgvNnVBSlBjengxdmh4ZXR1c21tcU5jMWw2cmthcm1mU0RhQ0Y2Nm5vdVhR?=
 =?utf-8?B?Ny95MVpNc1gzbkFqald5ZkJQcXdqYnlPbEg1ZVlBTkhoVkFFeCtVUzU3dGdn?=
 =?utf-8?B?UkpwME44WEdCZVYrcWEyc1lwRWpwV1ozN3NxWGsrbFRMdE9waUE0OW5QeE5i?=
 =?utf-8?B?Tm9YWTNtWGp4enRNejIzSWlqSUVZeFVUb1Q3Z09zb2VrYVdpN0Y2MFBxcHBl?=
 =?utf-8?B?bHBscDY4UEdWMEVSN3JBdDVjVGIvcVFlTDNFanRiYVYwY0c1SjBoTi9qbUlF?=
 =?utf-8?B?aVBmUUpmWVhpbVhEQWFRVkpNVkdZVnBNM2RBeG1CdVJXaW94UWtQMUROUSt5?=
 =?utf-8?Q?jtk6bcojeGIpc2iH0/aP8nA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dea4312-a952-42bc-4ac6-08dd206b26c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 20:24:34.2234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nf27v/U6nekZUNyBxVuvutHs/SXDcG6gXDHIl2LFidW21YENshbsjjdFn6uOG1xHuIC8Xdf+9yIvakV2zcmCjge5NkmH676qEh2qNtspc2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6426
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

On Tue, Dec 17, 2024 at 09:31:21PM -0800, Lucas De Marchi wrote:
>If userspace holds an fd open, unbinds the device and then closes it,
>the driver shouldn't try to access the hardware. Protect it by using
>drm_dev_enter()/drm_dev_exit(). This fixes the following page fault:
>
><6> [IGT] xe_wedged: exiting, ret=98
><1> BUG: unable to handle page fault for address: ffffc901bc5e508c
><1> #PF: supervisor read access in kernel mode
><1> #PF: error_code(0x0000) - not-present page
>...
><4>   xe_lrc_update_timestamp+0x1c/0xd0 [xe]
><4>   xe_exec_queue_update_run_ticks+0x50/0xb0 [xe]
><4>   xe_exec_queue_fini+0x16/0xb0 [xe]
><4>   __guc_exec_queue_fini_async+0xc4/0x190 [xe]
><4>   guc_exec_queue_fini_async+0xa0/0xe0 [xe]
><4>   guc_exec_queue_fini+0x23/0x40 [xe]
><4>   xe_exec_queue_destroy+0xb3/0xf0 [xe]
><4>   xe_file_close+0xd4/0x1a0 [xe]
><4>   drm_file_free+0x210/0x280 [drm]
><4>   drm_close_helper.isra.0+0x6d/0x80 [drm]
><4>   drm_release_noglobal+0x20/0x90 [drm]
>
>Fixes: 83db047d9425 ("drm/xe: Stop accumulating LRC timestamp on job_free")
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3421
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 9c94be5719008..8005530b5e51e 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -8,6 +8,7 @@
> #include <linux/nospec.h>
>
> #include <drm/drm_device.h>
>+#include <drm/drm_drv.h>
> #include <drm/drm_file.h>
> #include <uapi/drm/xe_drm.h>
>
>@@ -768,9 +769,11 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>  */
> void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
> {
>+	struct xe_device *xe = gt_to_xe(q->gt);
> 	struct xe_file *xef;
> 	struct xe_lrc *lrc;
> 	u32 old_ts, new_ts;
>+	int idx;
>
> 	/*
> 	 * Jobs that are run during driver load may use an exec_queue, but are
>@@ -780,6 +783,10 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
> 	if (!q->vm || !q->vm->xef)
> 		return;
>
>+	/* Synchronize with unbind while holding the xe file open */
>+	if (!drm_dev_enter(&xe->drm, &idx))
>+		return;
>+
> 	xef = q->vm->xef;
>
> 	/*
>@@ -793,6 +800,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
> 	lrc = q->lrc[0];
> 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> 	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>+
>+	drm_dev_exit(idx);
> }
>
> /**
>-- 
>2.47.0
>
