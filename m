Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99958C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 17:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1574E10E278;
	Thu, 23 May 2024 17:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2k1R90F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9886010E278
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 17:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716485973; x=1748021973;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4OzOyV18YL10a0R3jinvspCarKkZ+BfiyL6nFOQv93A=;
 b=i2k1R90FU4eqLu1Kcp4236e0L2q7uekPcX2AO/bqnts/u0nxtoBJOil6
 FajYtQQ5r14LLMzLeT7OzRQL8a9Ir70gNGuAvwABxaiW2He86d0WSm786
 VdM4IV1jxsPzSim9nqEVTP59O4tUJx54Sp6xysJTsemWyjnNDRfaIck14
 /GECc5Svk/9gnGfrEOBBMDIU3jlnx9nmFxx1/pP/wEgapmg9aOyMQr8IM
 O705Izi9D/JAf5bC4xUKNH9wDL6AM18bvMrdgYNyKQ2n3S/fgqgI7H4vN
 B5INfhWaWnSGWOyoXln/Ddz1+t/asqj0ad3rziM6hoJtNcMfUJbObvOLd w==;
X-CSE-ConnectionGUID: FbRKMSKiRca7JDAer8EwVg==
X-CSE-MsgGUID: +oK/gUG7TsWJglnSbH9hIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16660495"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="16660495"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:39:32 -0700
X-CSE-ConnectionGUID: FeXF5+1/RxaA0oxoXg6GYQ==
X-CSE-MsgGUID: MJ8eQ/tVS4+4sDV90P5EIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="38533109"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 10:39:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 10:39:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 10:39:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 10:39:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 10:39:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3HCQog3+BwWsD+wG70fF+H47pxOFlX2aIuez2ZQaMn4MHr6ksARBFT3WnkEqb9nopO/gSoPJG3ZcfiNrCAe7wTZpHyKv2cH5G6jjd+UYvAAZCF67qr2wJh/ZmweGLQhY7eWsWs9ggrdbnbf7HFZo+TOGcjbJ9UF5IRHP3duKfPwGE/5VEf6vQcW1IFqHIVK2eUQlMiUZj27986dyXunyoJIfyyrGVbUN8Ume5hbfiubLXsueMFITt3GE0t1NXD9TslgQW0MkFTwdhVtdNM+PmhC+67QakIL06Eg7NpNUnHJFEdrvUEfU1OLMUdrwIehQ2xz6Av8ho0HmRLe+BGekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZvVXUv/DBuxhqGUv9iZ7HZInVaxi8NOS/9AV01sJwc=;
 b=Ed7E2PX0r/h2tfmzw61jv1GbRO9+dQsUHtwk3EKomntwaN82SORmJFmwGtrnpxtrjUTzvOlX77qqhA+Bq+P6YFUCXxzlAS1sypz4YeQPuL3E8/f6sl/tsGCxK200a2ERSm2VjuyfkD4MN8i3x+TfVqj9QTXcPYSD5u6lfCkulbAg8z1nXcqf60WykWtiWSfb4YHQIXfkr9Eh8mq2oreWUvzDky9i5dI3XJAhOkWjR5PS3VsAp5xJHPoyvdElA7v67l4H+EABsZRqeMEs5h9YzwjKYdV77i4bP/u/nv7CtTeIhhjfKJroOVf84ynOx1gfxXI/DMfSwWXWJzL3KjPM0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB8073.namprd11.prod.outlook.com (2603:10b6:806:301::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 17:39:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 17:39:25 +0000
Date: Thu, 23 May 2024 13:39:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v3] drm/xe: Add process name to devcoredump
Message-ID: <Zk9_STt9LeCUua1J@intel.com>
References: <20240522201203.145403-1-jose.souza@intel.com>
 <5e260bdc-7ca5-48ae-8caf-aff039c740cc@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e260bdc-7ca5-48ae-8caf-aff039c740cc@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: b970de09-d5f2-482d-30db-08dc7b4f49ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OPD7jZunoifYY63dKnqPi3JYZ9Vr24qssvfv2jFGNcBN44SvrkMjBlu+7o?=
 =?iso-8859-1?Q?bm2rKqKql/V2V6MSYxxK3yMZcMeUywzSX7yDQPKDJfQ0DCXVkPj2+c66su?=
 =?iso-8859-1?Q?LDwYhiNbPUv+l37zsdfoMt3NpslKPTHOHoCJJmASz5CwklkOCayjSgsNST?=
 =?iso-8859-1?Q?wMBHJ/uVtv2kh+LxxMaqudWlvMRMG5SBJ6pW9r400d0t+rSxit9P49riye?=
 =?iso-8859-1?Q?gzSoTE30GJZoez0Kg/nIRRUWpheWOx/BxmhrLwxzz8YjusW227Pz0aFYqy?=
 =?iso-8859-1?Q?VHsFzA1juq2hNZtUM5M7yPLMlzhG0z9RqRZqttxVYc/2uBYIq9HjUe4td5?=
 =?iso-8859-1?Q?kBh1Ay/cFd2/UJX133rMiYXn2pZh7imDoZm7gxfwL7MBtVDRDIIw9cVodx?=
 =?iso-8859-1?Q?v3kmA5Dx/xDAIeBB0IM7P60xT20w/UdNxC1eonQ88xtnvfaKC4OwlsWkKz?=
 =?iso-8859-1?Q?3ZzLjMU9V5JjVkOAGQ13W8I86DAPIa4xCWQSlZGIVi9otrIlXWhog1mREp?=
 =?iso-8859-1?Q?VGeUI5EsCLBajBn18Jz4DIPhp5haAePROMicZnkayXr4V5XQ3Hi2y1fONx?=
 =?iso-8859-1?Q?31fPAcioylZYE3icbMCi/JdEYnwRdkfFBVq4JgLeA+H3gBngxo47ovozCM?=
 =?iso-8859-1?Q?O50yvW0FbvJ8D491I2D17y16h1/ZNqKnVb3H/PU22L0Siml/0umAd2HS5J?=
 =?iso-8859-1?Q?nxEAy+Hn7K+Jc5iqMO/vN37RQKCuUUyQ61o9hoz/TQhVnzpemacOl36syb?=
 =?iso-8859-1?Q?Hth4tKPn+N/v67m9rA/pLhdMyWLL0So0yHl6ZWSAKPZbMID/yxGh1af3mT?=
 =?iso-8859-1?Q?X9ADqnUcUP9WZAdR3jawO9t+wZnlxn7epiRKQmZjo2rz7hipLoJSookKtN?=
 =?iso-8859-1?Q?vIfb8HLoX0zgQmgcc115FzdD+YGqXLPR/uYqfPzl3rrJrywBWzGiFbsAvA?=
 =?iso-8859-1?Q?9nGX18L8EBKwQSF5yWnvgTXnPuwoSBqdGzUy789Y3ShvCQNPvNpSZiBFYP?=
 =?iso-8859-1?Q?vwAOArLbvDDzjQOYQ0oBgtb3ebKzCMvBpTCAJbqlxUDoxxfLM0NrcFut7Z?=
 =?iso-8859-1?Q?Cdqs6LoiM8C7jpSJv5tYbHKlsX6R/U4Y7vlA7JsoY+BS4KCmJEDEo7CArm?=
 =?iso-8859-1?Q?Giw3RMKGq4+elejWg7UOMIF8OO/LTIUXNp0jg87JLz//AZYaz/q1I+TZE9?=
 =?iso-8859-1?Q?sdmVB+j0OkAgTwyCN/Ltq8HTNOR8xhPJeRLtEw+f/CnA37QJt3Z7z5Ik/B?=
 =?iso-8859-1?Q?9cBvGGsmw9F20iAg/nE+nRbd9hD8iRGP+TbW8Adhb+tBSoOIwG0Nm9fZM+?=
 =?iso-8859-1?Q?MvDLWa1pAx6X5YlbRaRiEEwr8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uUkGQv5ZcMIn9Dkd1h2gFgThSlG2NvAo/hlfRyWDQ/SUwfunew+Mu8+7bT?=
 =?iso-8859-1?Q?KAlUsPiPFcfIeAd1xAERAOmNGHDXfp1UKU/zfqQnc/QPHd9ExRyJRsUw7V?=
 =?iso-8859-1?Q?vCCfbgDZjYsF5JUys8Bke3bld1zaWYir02sE+aIbEIEC82bgrlGpWs8rka?=
 =?iso-8859-1?Q?5W1t1/5CFjgp2i6CYzrlpIvIAzDyfHSmEuZ/JXFMR1euCpDA9l6hP4a9rz?=
 =?iso-8859-1?Q?l7bzvanKwn35LUXnMv3HWDBB72o7zjFPmASe6jnXMcpzQX9AFWETIy/Snh?=
 =?iso-8859-1?Q?ncNH0O/T96Kd1+Hu5rrCYsPx5HaATZAipvA6LgmVTjsBOH8B2xUSy+JzOz?=
 =?iso-8859-1?Q?UcfN+JW/quZbADNsRwS/cuP8PzoNSFUkbE6UdEBuu5+GB2rNfcKM9FKoH4?=
 =?iso-8859-1?Q?5wrZzi9WMLr8Pp+s3UxJbHhYWZBiDFQkIPfGa5IIDBd2WBW2PIbdpjPHxw?=
 =?iso-8859-1?Q?p3X1ZuBgAB3Nlomij6h/6XomWIgdUSxl598qk71yWkIbiN04n5a/VM8mPW?=
 =?iso-8859-1?Q?9b94cTOKFI5BgF5pnX2H7mpw0c/We0ulKEUb33+ARNy83IGcqRyFEORoZi?=
 =?iso-8859-1?Q?z4vCb0xkQl4/oBdx3Uo3XxEtpQam0GeMQCK+/M5Hqk1+ZQ63/6D1pMn0HI?=
 =?iso-8859-1?Q?NmT7A4Kz66lFA4kmJ2GTh6kg4hCEYGLRahyVItSoEkPJdWuRxVj1ImFjrb?=
 =?iso-8859-1?Q?QVHJ+kDMCaddFxZ5f18WRvBoG68J6Ni5HCdZ7o4BdcotRGc6R1FamAXknG?=
 =?iso-8859-1?Q?Ymmv3hnljKaHdyGUdBmkwGscYPyBAhM2bjMhClgC7try1vEJhIX2jr9FYP?=
 =?iso-8859-1?Q?sfL9PRFgvZX4BAk9Z+hI0nL8v4ghZMm8xOHXHgPhLn6nmrj0Whh44rxCtr?=
 =?iso-8859-1?Q?vJArbwaT6MCuJFAqu8iDLW4a9AS/7LPL/ND25/zHDjSQMg9fi0tG2ZJyhF?=
 =?iso-8859-1?Q?EspSgmOkB1w1Z0QZS4EZwz7Bg2dZci+j3rbr9RdMYAOaztOjXRYt/JmG6t?=
 =?iso-8859-1?Q?jHpL8g3E/1ybnD+5TmxblzaOP6bR/RJieBDyl1JfVqC3VM/lQduKZHMoCo?=
 =?iso-8859-1?Q?/4474X/mNSvv1eaV2xnqV5Zg2GC0U8ChKs2neh1cqwhTVOnH/cfsPizztO?=
 =?iso-8859-1?Q?tz3KRscgBCdJnwWBmmBrXdlKfivr/KbAJoEV2Z6fj5E2nj+DPsEFHGEeU1?=
 =?iso-8859-1?Q?tLXvQSGDDCq37dL+u/YVKbHBkZ0h8O/eWV27SxJBgwr5bAf39imwZgwDNk?=
 =?iso-8859-1?Q?58alJ0B6XpnH0EbYDeh07wc0vEvt5U1xpUqbc9SF5a01RRTvJrc/onryQA?=
 =?iso-8859-1?Q?aHc2lL7fkSEodgBcTnbcgkY00MdM1yzkEOl0OzVHr2oo4pjTl70UyXWWIp?=
 =?iso-8859-1?Q?P/CizgZJgejQNcn6TKdyAZ8GCwZtc2CO1xn+V0YfPvDp6+5yZJsY4xZlL+?=
 =?iso-8859-1?Q?tpfgVoxbTn5B/wrqU51nHS+77LnkniquiF8WmS4a030mnLSVY+0DUVFB5i?=
 =?iso-8859-1?Q?CCyCex4g9ZTwpFoIUYkOZ89LlTRbHHKBl0g7pbeyOYL/kapuHxSTRxcqSv?=
 =?iso-8859-1?Q?aYnzTbEu9kOaWlhcvThTxD3g5Rcb3sk24dR2lmuetKXcRHs9zHvjyfuUis?=
 =?iso-8859-1?Q?fuFfDDrQilZCSUc4ApWWqO8qVqGxXYJGCZk9qlwXcNisVf3r5A6BSxlg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b970de09-d5f2-482d-30db-08dc7b4f49ee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 17:39:25.5623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hr1a+Ep9yO+a3uWHV58+ajb3zu0u8uEB/mbLoF51/8ZL9GRn6NH87OGpYl1uqO0ULAQ5+guDXVDRMBcAP9NmBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8073
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

On Thu, May 23, 2024 at 12:23:11PM +0200, Nirmoy Das wrote:
>    On 5/22/2024 10:12 PM, José Roberto de Souza wrote:                          
>                                                                                 
>    Process name help us track what application caused the gpug hang, this       
>    is crucial when running several applications at the same time.               
>                                                                                 
>    v2:                                                                          
>    - handle Xe KMD exec_queues without VM                                       
>                                                                                 
>    v3:                                                                          
>    - use get_pid_task() (suggested by Nirmoy)                                   
>                                                                                 
>    Cc: Rodrigo Vivi [1]<rodrigo.vivi@intel.com>                                 
>    Cc: Nirmoy Das [2]<nirmoy.das@intel.com>                                     
>    Signed-off-by: José Roberto de Souza [3]<jose.souza@intel.com>               
>                                                                                 
>    Reviewed-by : Nirmoy Das [4]<nirmoy.das@intel.com>                           

thank you both, pushed to drm-xe-next

>                                                                                 
>    ---                                                                          
>     drivers/gpu/drm/xe/xe_devcoredump.c       | 13 +++++++++++++                
>     drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 ++                           
>     2 files changed, 15 insertions(+)                                           
>                                                                                 
>    diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>    index e70aef7971930..1643d44f8bc42 100644                                    
>    --- a/drivers/gpu/drm/xe/xe_devcoredump.c                                    
>    +++ b/drivers/gpu/drm/xe/xe_devcoredump.c                                    
>    @@ -110,6 +110,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>            drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
>            ts = ktime_to_timespec64(ss->boot_time);                             
>            drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);       
>    +       drm_printf(&p, "Process: %s\n", ss->process_name);                   
>            xe_device_snapshot_print(xe, &p);                                    
>                                                                                 
>            drm_printf(&p, "\n**** GuC CT ****\n");                              
>    @@ -166,12 +167,24 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>            enum xe_hw_engine_id id;                                             
>            u32 adj_logical_mask = q->logical_mask;                              
>            u32 width_mask = (0x1 << q->width) - 1;                              
>    +       const char *process_name = "no process";                             
>    +       struct task_struct *task = NULL;                                     
>    +                                                                            
>            int i;                                                               
>            bool cookie;                                                         
>                                                                                 
>            ss->snapshot_time = ktime_get_real();                                
>            ss->boot_time = ktime_get_boottime();                                
>                                                                                 
>    +       if (q->vm) {                                                         
>    +               task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);      
>    +               if (task)                                                    
>    +                       process_name = task->comm;                           
>    +       }                                                                    
>    +       snprintf(ss->process_name, sizeof(ss->process_name), process_name);  
>    +       if (task)                                                            
>    +               put_task_struct(task);                                       
>    +                                                                            
>            ss->gt = q->gt;                                                      
>            INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);             
>                                                                                 
>    diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>    index 6f654b63c7f1c..923cdf72a816a 100644                                    
>    --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h                              
>    +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h                              
>    @@ -26,6 +26,8 @@ struct xe_devcoredump_snapshot {                           
>            ktime_t snapshot_time;                                               
>            /** @boot_time:  Relative boot time so the uptime can be calculated. */
>            ktime_t boot_time;                                                   
>    +       /** @process_name: Name of process that triggered this gpu hang */   
>    +       char process_name[TASK_COMM_LEN];                                    
>                                                                                 
>            /** @gt: Affected GT, used by forcewake for delayed capture */       
>            struct xe_gt *gt;                                                    
> 
> References
> 
>    Visible links
>    1. mailto:rodrigo.vivi@intel.com
>    2. mailto:nirmoy.das@intel.com
>    3. mailto:jose.souza@intel.com
>    4. mailto:nirmoy.das@intel.com
