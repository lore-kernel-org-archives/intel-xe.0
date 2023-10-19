Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D18C41513
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 09:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C29B10E4A9;
	Thu, 19 Oct 2023 09:12:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2CF10E4A9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 09:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697706748; x=1729242748;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=n6CTdXPKFMmXPjH1Leua9uTVAxIafGzMUVRznOo6KJA=;
 b=Ci4mh//gLN+u0pghbxpZHWE1fbrlINQgn8tVBvC8QJ1gIrw8bX/jjU1y
 wclfXmJipTO3VjS2WZzUwviO5DnIwwm7uxRA65wbxhJV5/uKc+0QVQkJK
 SZjKV86YU344Wb5w9XhOH4o7MQ4Ay+XO4IP0112tMLdQTlv53sOlqYGLM
 0vI9wiyxth1rGgpEz0iBZrp7XSDXFL8xMpDunyVQ/BqDQDblmw0Uat3VA
 SDxI8L58wMYAzg1rgCHbXS9sF7OmmkHR8AOWiTHFx9S5dUm/xM58TYaMM
 6tKxNu5DApZUdA78c8NzufgzhrGfRPNRc3Y1J1tSxgbn/xkY5qXOfPEIg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="383430556"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="383430556"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 02:12:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="880567963"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="880567963"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 02:12:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 02:12:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 02:12:27 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 02:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crtexbG2Ec/QB2+mF/id53mudQugZ39hRFaQJkP8sXXV2EPoLTfm5WnKxRORpnmkJNXkc84vpCV3axL/l7KqNoqUvJB1kpqc4d7bqn+ll64TSJHuneRmsYwjFyth3UjRh+lyVd3vLIatPcqBOajPecAz/0FyXsu/Sh7U1IBf6XchSPhFQAiepEtQzgFdylI+L5xzaj2SRRBgEa3Dmczc1l3KOIAx+zid2H+HpTcjfDq1NmufdlDa2m4+LnLo0YRCqKdPsrDw9EJ3+Hlasmy7cYNgrCwHe/h4aOhebB4pHJHM3904/NnX7X6ktDl0W8nxq3E6x851iYyJk/bxz7Zjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAGa0ZTh8tss4fxjlzO/w4QYdVhmZUKk2mai3lOiQ5o=;
 b=Nuo6FKc6LGxZbIrygBsmtTBOZOvwugcf4uX/V93SMshxG62kVbgJFc7DXQh7fgWcBr0iz3ccJmWdc5Sa/duJrK8QAXM5YXbX9ugIDY8pmM7g8GUXWxE9UcQKRr/PKNo9QUOlEp9ymtEJD9xYGK3OlEJhtpJ5SY08V8p+v7GxK/t92khxBxVDwq5yQuG5NEyxLTQHcVvY8jaz4ybZuF5WULhaqZyYld6I5zjTn2CRdL8lGERNzis6JVOeS9taD5XD6LeVFjXiQ/nUKanKOXsgh4e+xM+6zdnPTZ6+4oidHkzkJ/MeobZiq7554clcMghXit5hOEu4p4Mjzevcn45+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Thu, 19 Oct
 2023 09:12:20 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:12:20 +0000
Date: Thu, 19 Oct 2023 14:42:08 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: "Kalvala, Haridhar" <haridhar.kalvala@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZTDy6ChIDtvWk59N@bvivekan-mobl>
References: <20231016101720.1657746-1-balasubramani.vivekanandan@intel.com>
 <20231016101720.1657746-3-balasubramani.vivekanandan@intel.com>
 <89447f6c-7af0-a185-6517-5c9252151db0@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <89447f6c-7af0-a185-6517-5c9252151db0@intel.com>
X-ClientProxiedBy: PN2PR01CA0218.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::10) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SA2PR11MB4794:EE_
X-MS-Office365-Filtering-Correlation-Id: 920cf704-2c7d-47b7-f58e-08dbd0837f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: da2j/A7B3suxfqBA2z/UdHjU+JiRAAjNibOtddwZYO4NvDtinRJjmyQQbt/d3lkSxG4LIyo28gukqEsIpfaH+cRW67waEEvqmUyfkPpuic2ScnrsrZiyTPTAJTrMtbIma0mVZ9KEYeRdYHZoSTC6jTbhOLY2U9mHF04Kr+GK675I6NTgOqabma4E5UeGVLA16U8JEau5pGOlSo2C7QqNoThX+FubGmDxOza9s92QXiGIB23PGVWsWXrS7lY3SDFQplAlUR978kxR5t29ZAdHoLBNyxmYHGnJpEWQPYX68bYbsUukOOVWAFU3fv9uILas+znnSEOulVXjdQTFEZkXlZv0FuBzuac/SKqLX/znmmicihPtBylc0f3Txjhiyvacqy9kLfapSuSgu7uQCTZsWz47q+Sv+oKuph5GypKBu6mOFp/JGOte8XHJbgLiTiAdfbkcapjjX1Y8T+zal8QSIPUUW7p7svfJg2eG9TtjUO+7sc+WVT0Rw1s79T9FSdZOtc1P0fe7GjVmJshOpRpiW3tl67jJnLdSW/Hwt7vHaaTDVnBj+IVZnZbH3aT6Covv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(366004)(396003)(376002)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(9686003)(6512007)(38100700002)(26005)(6666004)(478600001)(41300700001)(5660300002)(8676002)(2906002)(86362001)(44832011)(8936002)(66476007)(316002)(66556008)(33716001)(66946007)(6486002)(82960400001)(53546011)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEQ4RHViZ1RmY1VIeFRBcER2TFBsSDluaU9vRmUvTzkyWFZBTUFrZkhSVFA0?=
 =?utf-8?B?Vi9KaktHYW54QTlEelRLY3FSdkJKTWJCOWV3b3R0SHFSdTI5WDhFSFp1Qk1i?=
 =?utf-8?B?T3loSlFkb1VTbk5taE8vZzNuRFlkdUNBZWc2aGFOMVRXZXFFY3o1TkhEQ09W?=
 =?utf-8?B?S2ZZckdpeEZzdjB6UjVmcjk1MTBQQzlFaVhaK1Q4V2dzbTFER1FZOHpxaS9M?=
 =?utf-8?B?aGZKQlJzdTk0UGFnbFlyekc2eVBkVkJqc2RDTnJvRjF5ODlzTU9kMWNBSHlz?=
 =?utf-8?B?dkdoM1RZZndCMUNUaWE1emZDUEQzS0UwWW5zL05jSGFxR1FEWUhieGhuU1lM?=
 =?utf-8?B?SEpXY0pRMlBSQWdiNzByaURTdTI5NTFyTnNUTnVjcHB4SUhPb3dWcUJtWHhV?=
 =?utf-8?B?Q1pLRkV5V3VUVHE4NzViU1FJSTJFY25kbTN0VUFhbm12TW1oTXBTOG0vRnpB?=
 =?utf-8?B?a0J6enNhOG14bGxoRVpsWDI5ZHAwb2preFRiNDFhakFCZEx0U0pFZDhQMGZo?=
 =?utf-8?B?N2dpOFliMWlDOUhWeU13ckZVQXViSkthLzlZL1dHb21YeWUvcVF4NzR5TktZ?=
 =?utf-8?B?bnhCNE4xUnYxeHdJbGkwYy8rOUFYVVZFOVFqVUdFU0NETnFPSDBGNWovd3hF?=
 =?utf-8?B?U1krQ3FqUDBmMkRvVEd3Qzlzd1lWNGxyc3M4UG5aT0hUdG51bmpqVzJzRGRB?=
 =?utf-8?B?UDAyL3FaRFFnTm1nQUZIblpIT1pMYk9TM2lKUjcwZTZWQXRCYmVYVGlKcmVF?=
 =?utf-8?B?VVB4QTJCNWYrd3E1ZEhBN3pMaUNUT3dLbGZlNWRJajh2UWZ4UDlPS3JVR2sv?=
 =?utf-8?B?dnVNM29XYUpOcnd0bHVUdGtNWkZsMlF6NzlPcmdkM0lIejhoMTBCSjRTN1Zv?=
 =?utf-8?B?NEpzVXY1UThEa1FkS0Zod3lLd1lsdXRNeXA2OUZtTDZtTlZIbEJ4Ynd1WUtK?=
 =?utf-8?B?RzN1UkUvM2hUV1d6U0Yyc0RzZks4dk5ubVM4cjc2cUZFMWJSODdxY0NpdDNK?=
 =?utf-8?B?bmxxcUV3amVSNDgxMUNLZWRwaWRzN2EvNnBTKy94R0JCVm03Mjc2b1ZuVGRJ?=
 =?utf-8?B?VzFWcSt3NjR1V3c3cy80N2x0V1BNN2wvYTZqQ0Z1b1NQaXNzdlBQNmJlTzFJ?=
 =?utf-8?B?WU5QWGFDV080UmtoYVg0cjgwd3A4dnB3K3g4QlJxdmx6eW5HR25GL1BSYllF?=
 =?utf-8?B?clA4enpOSm51amFCZjhLZ3g4NzR4MElvOEpKa2hnNmI2R2xtbkJLcGU3UTRp?=
 =?utf-8?B?aEhnVGtzdWtvSVFpWHQwcmZlZlVxZnpIK3kzWTVPcG0vZVJrN2xibHRDcXhE?=
 =?utf-8?B?dXgxM3RhWE8yNzJQZkhIcVBXdGRGdkkxbWwwcU56RTB4TjM1a3A4UllFcDdX?=
 =?utf-8?B?aSs4am9CbFZpVWpGVVJYMTlEOFZ4MFRLZ0FkczgzdmRST1AwYVNxTERRY05V?=
 =?utf-8?B?Ky93VFBBU1NmTXZndHRwUGpCdjgvUjVMNzRjaGlyL1lENjJRSC81UGhLV2Js?=
 =?utf-8?B?dVVJNElsZUl2WXFYS3R3enpRNlloOXhUcGdWQ2ZJeVpHMUVqR2djMk1nRDBQ?=
 =?utf-8?B?NitSUHFSME8zSlZqQk1QL1I4bUdDUStmN2xKdlZHSFlib1c2R3hmdUdWUlVk?=
 =?utf-8?B?NDdNR2pmVkxld2JSVlhmc00wMk9BNUVpdFVFcFF3M0g5dlhZUlI3OFZ5Ui9T?=
 =?utf-8?B?cTBTa29BZ2x0YmJnQ2FmdFV0azhMQXZFZDdCaXdHYXUrVDlxNWRUSndnallW?=
 =?utf-8?B?dDV2ZmxleE45U2RwV2xqNWNaWDdCTkg0QzBPT285TlVuc3dJTDRLS294RWM2?=
 =?utf-8?B?NUFFakh3dTdPcDl2RWNGd09yTkJ1SlorWlR3WFhCMXZ5d3hiV0NSTUlvMEJr?=
 =?utf-8?B?R203RWNDbVFxK2dKQjlYNi9Hb2NYZ2R0UXEyYVhta0FXclFNZ3VUYVFVdXJB?=
 =?utf-8?B?dmRKT0xqVHJMOURleXRFR1V0b0c0Ui9tS2NLZlRNMGVkQXFKTWJJSnJUck1C?=
 =?utf-8?B?OUZwaGVzK05vQnVkZmJFbS9RWk12RjZMRUxuczZ4U2xQWFhENUF2eTZkWHYr?=
 =?utf-8?B?K0N2RGNvK20rNE9Yb0JWc1phRnY0WFVhZ21yNDhnMzhya3djS0dCdkNWZHhT?=
 =?utf-8?B?WlRPYlJkQkU3aW1PUVNGcDhQVzZlVWNQaHdqeUFkTUtuSjNnS3dKNGdQRzEr?=
 =?utf-8?Q?Imq65lJd8oYPxu9nNb1G4UE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 920cf704-2c7d-47b7-f58e-08dbd0837f2c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:12:19.9342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CyxmvcTpg6sP79oGko4TSLFuIppDGvgWnDcbYptHIANMXyDvzRf5EcjXCsIL74x5p+LmuXHxG/qVFHEhjsE7PERi6Un04HBhCHvpgqV6js1wArv5jxFqQ+Rzd1Qh8mjJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
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

On 18.10.2023 13:26, Kalvala, Haridhar wrote:
> 
> On 10/16/2023 3:47 PM, Balasubramani Vivekanandan wrote:
> > Make use of EVENT_CLASS to group similar trace events
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_trace.h | 83 +++++++++++++++--------------------
> >   1 file changed, 36 insertions(+), 47 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 456c776f4be1..233b982f34da 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -517,55 +517,44 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
> >   	     TP_ARGS(vm)
> >   );
> > -TRACE_EVENT(xe_guc_ct_h2g_flow_control,
> > -	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> > -	    TP_ARGS(_head, _tail, size, space, len),
> >   /* GUC */
> > +DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
> > +		    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> > +		    TP_ARGS(_head, _tail, size, space, len),
> > -	    TP_STRUCT__entry(
> > -		     __field(u32, _head)
> > -		     __field(u32, _tail)
> > -		     __field(u32, size)
> > -		     __field(u32, space)
> > -		     __field(u32, len)
> > -		     ),
> > -
> > -	    TP_fast_assign(
> > -		   __entry->_head = _head;
> > -		   __entry->_tail = _tail;
> > -		   __entry->size = size;
> > -		   __entry->space = space;
> > -		   __entry->len = len;
> > -		   ),
> > -
> > -	    TP_printk("head=%u, tail=%u, size=%u, space=%u, len=%u",
> > -		      __entry->_head, __entry->_tail, __entry->size,
> > -		      __entry->space, __entry->len)
> > -);
> > -
> > -TRACE_EVENT(xe_guc_ct_g2h_flow_control,
> > -	    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> > -	    TP_ARGS(_head, _tail, size, space, len),
> > -
> > -	    TP_STRUCT__entry(
> > -		     __field(u32, _head)
> > -		     __field(u32, _tail)
> > -		     __field(u32, size)
> > -		     __field(u32, space)
> > -		     __field(u32, len)
> > -		     ),
> > -
> > -	    TP_fast_assign(
> > -		   __entry->_head = _head;
> > -		   __entry->_tail = _tail;
> > -		   __entry->size = size;
> > -		   __entry->space = space;
> > -		   __entry->len = len;
> > -		   ),
> > -
> > -	    TP_printk("head=%u, tail=%u, size=%u, space=%u, len=%u",
> > -		      __entry->_head, __entry->_tail, __entry->size,
> > -		      __entry->space, __entry->len)
> > +		    TP_STRUCT__entry(
> > +			     __field(u32, _head)
> > +			     __field(u32, _tail)
> > +			     __field(u32, size)
> > +			     __field(u32, space)
> > +			     __field(u32, len)
> > +			     ),
> > +
> > +		    TP_fast_assign(
> > +			   __entry->_head = _head;
> > +			   __entry->_tail = _tail;
> > +			   __entry->size = size;
> > +			   __entry->space = space;
> > +			   __entry->len = len;
> > +			   ),
> > +
> > +		    TP_printk("h2g flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
> > +			      __entry->_head, __entry->_tail, __entry->size,
> > +			      __entry->space, __entry->len)
> > +);
> > +
> > +DEFINE_EVENT(xe_guc_ct_flow_control, xe_guc_ct_h2g_flow_control,
> > +	     TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> > +	     TP_ARGS(_head, _tail, size, space, len)
> > +);
> > +
> > +DEFINE_EVENT_PRINT(xe_guc_ct_flow_control, xe_guc_ct_g2h_flow_control,
> > +		   TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
> > +		   TP_ARGS(_head, _tail, size, space, len),
> > +
> 
> Hi Bala,
> 
> This patch looks good to me. basic query why line space b/w ARGS & printk ?

I simply followed the pattern existing for other trace events.

Regards,
Bala
> 
> Reviewed-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> 
> > +		   TP_printk("g2h flow control: head=%u, tail=%u, size=%u, space=%u, len=%u",
> > +			     __entry->_head, __entry->_tail, __entry->size,
> > +			     __entry->space, __entry->len)
> >   );
> >   DECLARE_EVENT_CLASS(xe_guc_ctb,
> 
> -- 
> Regards,
> Haridhar Kalvala
> 
