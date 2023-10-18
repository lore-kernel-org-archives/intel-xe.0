Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABF1CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 07:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A7E10E08E;
	Wed, 18 Oct 2023 07:57:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A59E10E08E
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697615832; x=1729151832;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Qe95uZXy1CvfBNQiUkdw+DoJY0Uh3IanqDvtrgcC6PU=;
 b=ZhUIoLHFZ7mLYoc9jBupOGUk9CHQh/uDWPr+Poa96NVwreNmmQFeepI8
 xshGCxn8XtsMuj8o/6kWIfXrurbV9vYofsyQ161eCd54kChhgNxDQEYwj
 uZS0+6fRQEck6XX65ldI26RiC2iIj3JrOdHh5iK5A6XilSkqf+lhVwl+t
 OXtncx4o4JzCKeJ6MuFcDPfKdkuBOCdcJWnO6W/qXGcmScZvPZDGhCFlK
 Kd4/aTkY5EKglMAwK6Q9Dr5aR57P94FjM/4KikiRFw0c3SKRfyQf3eikG
 p+p45PfP3OhyASzelgzVKCXxJaZ/V+qnnGlsoG2+DG6q6s06EnXLprglI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389837276"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="389837276"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 00:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="900235770"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="900235770"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 00:55:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 00:57:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 00:57:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 00:57:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqoJPIaiyteuqdlcxWEofTpGIe9+pn61mDOuv5OoH0KwmHaOY9xE1KO+FgeNQ8HHhljkdC3wDWDPovIs+1RUWDk66S+36/+JpEBNytlrde2xFDmDN9FGgTXSvMPegchxur5DiUJwsrHxSv2iI87Uoj9tfd+6RcMxGK/FVenl+rBMnprDVneNkwkcM1hpsdglBLDX2Pg9IF0v2Chrh8eM5j+FcGPJQkTtA4j+z7Rv4rM2eRWwaJfq+GtM9aA02X/xQ64VwmMj9K1oipiyIwYHk8v/UvgA7EBZW7ldkqn6vhIxcsfC3ANG3dOBXme2Y6jdAMpbtJEbd7APai9HBDMjUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jyaHx9ZRchutr6QCGHDgEDEy0e20NviMVcPMPh81e4=;
 b=QwRF4q0kumo4OM0+oSXlF49og8Nlp08dy1btp2i7isyc/1SKGrh+d5y7s3xy5dxLUCSxGok4eY7XUYG6mfnJjBlmMOacQGGerr7xUkNjl5MjeLG6g6fIqORX44DSVx94ygW3nM1/If1tvzsobJXqXe5ZOcFfybQFYedZfuppseSI3pDgi1FWEKzkBRgESR/d4oqDJtf9DTx6nsClnGWWPYgYr7DAN849iBumJ5oNKR2oVa0/AnHGFOFHJDAY/9bCZHg4xcLaSpgGoOLyWz7WPQnHK0k916u+l9IGkthEWc8n/u5tlrdFx7wZsEEZ1ZanbvJTCE5O/qdwyajPqDXCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2907.namprd11.prod.outlook.com (2603:10b6:5:64::33) by
 DS0PR11MB6472.namprd11.prod.outlook.com (2603:10b6:8:c0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.23; Wed, 18 Oct 2023 07:57:09 +0000
Received: from DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::78a2:79ea:ed42:df1]) by DM6PR11MB2907.namprd11.prod.outlook.com
 ([fe80::78a2:79ea:ed42:df1%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 07:57:09 +0000
Message-ID: <89447f6c-7af0-a185-6517-5c9252151db0@intel.com>
Date: Wed, 18 Oct 2023 13:26:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231016101720.1657746-1-balasubramani.vivekanandan@intel.com>
 <20231016101720.1657746-3-balasubramani.vivekanandan@intel.com>
From: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>
In-Reply-To: <20231016101720.1657746-3-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::12) To DM6PR11MB2907.namprd11.prod.outlook.com
 (2603:10b6:5:64::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2907:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: f6cd259e-ec3d-40b8-ad54-08dbcfafd3c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: McPB04MeJT6lwdWnxR9gNrPy6ScDhTErKqxV7iyCMXYfXMgd2L/Q5NFcxZPq8HerlGtd7lrdARL8JaGCS44g0bBFhbIO0nCTHPb0rld1Ipf7zBlSoEZUpqIdq9m5iYabwv5YFT/+NbaVz8B2hAfl78HDJ/aBTKMOMsXjKdectIa9tP0bVTyabWfBviEcGB4T2xyYMPqnbmhqpkbgnBDRdRKfaFh9V6r58ZECwknw7Ds3Q7tlKYpuQaKdV0GTxsIByvLHT1Qucr5qMpj1K/2C/RW4yUX4estP9iuCGzewGKExG3wHORBl/O3O6hgeYnTnIrl0FmjUit+WPrZufOprBYTNSDW0/dNO2b9FMbiUgtBagzQYsN2ehfC1tvwjRLMhC8oI9ybw0LukCFUJwm1O0FXp1rV5JOKV3VK5oKL6jtUd/1PnyepolJYTTHjVYabpzlX2di8JbazVwiznwusAxchgv4HqXnDUQr5balwyP+5GF2ThzgJzEQN6Oy0kY4m1Naxf85u0p7rlu1ODpn15QviJcLcLoSA/wSJvS24RajVLK9RjBLc+l5E9Q6Qo3Ms+UMyRb6eC7TqpS+9fLENBto72gxfPoWejWA4rRpO+jhPqRsaNda/SHO1eFSbJ8R2UUIHHieVPZuJ+qHgHgKv2kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(5660300002)(31686004)(316002)(66556008)(66946007)(66476007)(478600001)(8676002)(8936002)(6486002)(38100700002)(83380400001)(82960400001)(6512007)(86362001)(2616005)(31696002)(41300700001)(36756003)(6666004)(53546011)(2906002)(26005)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkVYc3dtYTNPWlFFcW5iUzc2N3VXUzZHTkxDRmZzQkR3dHcrem43Q0VKM0Zt?=
 =?utf-8?B?d3VEU3hOVlJOaGhadC9oalE0VTcveVdtRW9maFkwaVB5VERkTEloTlA5M1pP?=
 =?utf-8?B?WEdOS1VyWFJlMHlnSnlIYjk2SlJpTEx5U1lQRy9BYW8xU2Q2K3pZOFlsaHBn?=
 =?utf-8?B?RjlFeEhUekVDNjFTR0FtWVpZTmtMVU5NSkt5UERhSk5ocjE1eXF2ZlRRM1B2?=
 =?utf-8?B?NytCYWlMM2VZalU3NFFKMit3RTFncjZmSWVhUFE1a1dscENLM3N6cVBFcWxu?=
 =?utf-8?B?MWlOd3cyYXM5QnI4TlY3L2h3NXZ5Zy83UWJYVjB3SHpEZlJST2tqMW1zanMy?=
 =?utf-8?B?V1MxeHpXdXdOaVdXUEpYa2hUVndqRTArTk9ZWGJQSjRDUWxiTUFPNXZCNGZ3?=
 =?utf-8?B?NHJaaEZDMk54YjdSOEliT2kyeVFrQW1JOTJUdzJHUzAxYnNFdFBMeWkzdnRG?=
 =?utf-8?B?WWdZQkJZM3ZmMW9OaW5yR0NrVkZSaWg0T2RhRmtHU1I2K1NoVytaOEpVQ3JR?=
 =?utf-8?B?YjlEMXFlam9mZWFubGpSV1hBOEcxUjdKL0lDTVB2a0dPOHZkekxFb0xqcG5W?=
 =?utf-8?B?UnhmdmxRRzV5UE1uR3NZOVczRnE1bWFYT0xBRjZBVHRPa01RWXc2N2k1b3hT?=
 =?utf-8?B?cHczS2V2Mjd6NVBnd2UzeGQzWG02SkYwOVRXZWRkMU16UUxZR3pjVW1pM1VZ?=
 =?utf-8?B?bGEwcm9PYW0raW1haEN0ckpKRGZLU3YvaGVyTldkbFFwVTBub1lrMGdhaVlY?=
 =?utf-8?B?TUhvR2RmbWlxVE9tcENVbWVYbnlNVTdNRkJaQ1R1NWtRY0pOSTJmVzNKNzAv?=
 =?utf-8?B?Q1pZSk5KcWhWZ0dQMkNROHc0RlNJeTQxNDBvNUdiTEI1K0ZjRUFVMHlmZzFs?=
 =?utf-8?B?SGtaTG5SWmdVQU1DVzZqNWZmRjNSL09ZVWtWUU5VRmhEc0JvWFdJRm43amhl?=
 =?utf-8?B?bEhrRXJ3YTNYaUpHVWFUdTRTTGMzUEpMOGVYRERGY25kb0xPU01oQ1hHejh0?=
 =?utf-8?B?WGlHeGs3YUtoZGpNSzdydjB2c0YzSjBnWEtUWkRBV0lNT0lvSkx5ODNvYmlU?=
 =?utf-8?B?SjdMNnQzWkJNYy9PQ3pHN0h2dGY0d1hMa09ycU9sV1IwWWxVckdIWWgxT1py?=
 =?utf-8?B?SjBaemg3N1FpdElKM1NXVVJTYUdGVzkxOEZmWG5JMkNEZDN2Nng3MVV6UFRW?=
 =?utf-8?B?WHJqeHlPWjZPajN2Q1owdkJBUmtNMmh5RVRzWkM0eFlWb3lFSTdnK21mbEN2?=
 =?utf-8?B?MzhNaFdtOHUxZjNuM0N0WEpBVHRrakxXdU4vYVhEaHp3OWxHczU4R2h4dlZz?=
 =?utf-8?B?Z25tZS9TclR0dTV1U01vdmpRREZhdVlIcnBvUUVBcUM3SXhUcVRiVnZHOWc0?=
 =?utf-8?B?NkUvU01FNVpIT0tCRFJGek9PbG5WeVE5cGRUb2ZWYnd6dHUrVnp3Q1VaTUZy?=
 =?utf-8?B?MlArMEtqL3FBZjcrK3FQQ09jVjkya1N0TzVRMFY2dm1yeE9FOStraElnaUN2?=
 =?utf-8?B?ZE5tVldKSWdQNUsyd2RqdmkxMVF3SkxLTEJHMlFVNjhidSs5OWExVUhmUkNy?=
 =?utf-8?B?a216OG1PQithZFZ1VW5ZdjRDeUZMeExIdFh5dFFtKzlWMmFEaUljdER4K0tq?=
 =?utf-8?B?dnRVTEUwK2JMMnZLU1Z6SjVWL0VieHVDMzZ5WkQzUEFvN1publUyaVZUcXkx?=
 =?utf-8?B?enNGejRab1phd2FMNW81SjIwOE5wVE4rOXlnN1k1aHlNcTBWaWE0cVJkTzM4?=
 =?utf-8?B?d2lOK1hzZ2Q3Q0VCa2VjY1psRWpHa0IzWFYzMFBFWSt6M0llenVhVGV2aDl6?=
 =?utf-8?B?UmJvWmNPRHNuUTZyd0FVYzFqTFFGSXYxcmlnVVJPWUEvbmdqWDVMSktIWlRu?=
 =?utf-8?B?eHdDL1NXcmNQQ1hEU3AzdndZVnJQRi9KMHQ0eUpkZjI4VmZNdEN5RVZvMnFv?=
 =?utf-8?B?cndsTlMzclZFYUs1SUNxTTltWHlpVVBXNml3TFFNVGJSa1VTUVhWeC85dEVN?=
 =?utf-8?B?eWo1Z2ZWM3hsYmJFd080U0dJYVlscGRYOGFBZklpck5xcENEOEhyWS9VSmJN?=
 =?utf-8?B?em51MTA0dG1xK2FnRmxpS2hrR21zamh1UGpYbnpGRkwxMFI1Y2ZhT3FHeTVq?=
 =?utf-8?B?TzF2cFh3RUl6aVRmV2VOc2ZGWmR4b00yNFhtaHZwQldiNXRLZ1gvZkhzb1Zk?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cd259e-ec3d-40b8-ad54-08dbcfafd3c5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:57:08.5642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKgGSpnkHWIfsHMQb2h+OR5/n3ge4GMkE5wvHEPxy3T7PTtREv77gyMNVMxF6GtA6OvRrpA7l5hLRRyzSkZzKHi0bSZvgfyollqvu9s9vAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/trace: Optimize trace definition
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


On 10/16/2023 3:47 PM, Balasubramani Vivekanandan wrote:
> Make use of EVENT_CLASS to group similar trace events
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_trace.h | 83 +++++++++++++++--------------------
>   1 file changed, 36 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 456c776f4be1..233b982f34da 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -517,55 +517,44 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
>   	     TP_ARGS(vm)
>   );
>   
> -TRACE_EVENT(xe_guc_ct_h2g_flow_control,
> -	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> -	    TP_ARGS(_head, _tail, size, space, len),
>   /* GUC */
> +DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
> +		    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> +		    TP_ARGS(_head, _tail, size, space, len),
>   
> -	    TP_STRUCT__entry(
> -		     __field(u32, _head)
> -		     __field(u32, _tail)
> -		     __field(u32, size)
> -		     __field(u32, space)
> -		     __field(u32, len)
> -		     ),
> -
> -	    TP_fast_assign(
> -		   __entry->_head = _head;
> -		   __entry->_tail = _tail;
> -		   __entry->size = size;
> -		   __entry->space = space;
> -		   __entry->len = len;
> -		   ),
> -
> -	    TP_printk("head=%u, tail=%u, size=%u, space=%u, len=%u",
> -		      __entry->_head, __entry->_tail, __entry->size,
> -		      __entry->space, __entry->len)
> -);
> -
> -TRACE_EVENT(xe_guc_ct_g2h_flow_control,
> -	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> -	    TP_ARGS(_head, _tail, size, space, len),
> -
> -	    TP_STRUCT__entry(
> -		     __field(u32, _head)
> -		     __field(u32, _tail)
> -		     __field(u32, size)
> -		     __field(u32, space)
> -		     __field(u32, len)
> -		     ),
> -
> -	    TP_fast_assign(
> -		   __entry->_head = _head;
> -		   __entry->_tail = _tail;
> -		   __entry->size = size;
> -		   __entry->space = space;
> -		   __entry->len = len;
> -		   ),
> -
> -	    TP_printk("head=%u, tail=%u, size=%u, space=%u, len=%u",
> -		      __entry->_head, __entry->_tail, __entry->size,
> -		      __entry->space, __entry->len)
> +		    TP_STRUCT__entry(
> +			     __field(u32, _head)
> +			     __field(u32, _tail)
> +			     __field(u32, size)
> +			     __field(u32, space)
> +			     __field(u32, len)
> +			     ),
> +
> +		    TP_fast_assign(
> +			   __entry->_head = _head;
> +			   __entry->_tail = _tail;
> +			   __entry->size = size;
> +			   __entry->space = space;
> +			   __entry->len = len;
> +			   ),
> +
> +		    TP_printk("h2g flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
> +			      __entry->_head, __entry->_tail, __entry->size,
> +			      __entry->space, __entry->len)
> +);
> +
> +DEFINE_EVENT(xe_guc_ct_flow_control, xe_guc_ct_h2g_flow_control,
> +	     TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> +	     TP_ARGS(_head, _tail, size, space, len)
> +);
> +
> +DEFINE_EVENT_PRINT(xe_guc_ct_flow_control, xe_guc_ct_g2h_flow_control,
> +		   TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> +		   TP_ARGS(_head, _tail, size, space, len),
> +

Hi Bala,

This patch looks good to me. basic query why line space b/w ARGS & printk ?

Reviewed-by: Haridhar Kalvala <haridhar.kalvala@intel.com>

> +		   TP_printk("g2h flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
> +			     __entry->_head, __entry->_tail, __entry->size,
> +			     __entry->space, __entry->len)
>   );
>   
>   DECLARE_EVENT_CLASS(xe_guc_ctb,

-- 
Regards,
Haridhar Kalvala

