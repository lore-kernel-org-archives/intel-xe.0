Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D6FC4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 19:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C14D10F4E3;
	Wed,  1 May 2024 19:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwNK2eXX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A6A10F4E3
 for <intel-xe@lists.freedesktop.org>; Wed,  1 May 2024 19:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714591172; x=1746127172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t49ZrLciGbaJwyfHypvE3+5wDspzCdA27R59mlHGU/c=;
 b=OwNK2eXXhMEz9f9/PO89J8VEnLYrM7CvjJaY+cxgP+PHQG/EjrzF7Y54
 BmqKZ5eSuPPKhy4t36BrLPmWmyXzCNSoe6LX80aMi12hdB71BcHcXzwwm
 OBF8DOAIpOAcSjLaup7KC6h1YHteD8VzEQ/EzfIy0TUPOeDQHuFus2C31
 0ZxBAAefs8fwCGKNjyFgq6lmcevHfiMxGkoas6FSD8WG65ZDHxW+yWiih
 DPlTLfY76nV/szmldQJXEUYRjUa9VHY7yiIYQM4WnXrln0cUdB71We9sW
 zkpHptjVTMVXU+uKsdHq2H6SMRMDWrCLq9qSJ7lju6mAjCmlPFejJJjjm w==;
X-CSE-ConnectionGUID: lC3xN1YRQDOHI6jAHCT2Pw==
X-CSE-MsgGUID: f8WGfO7cR6yzzOmfcMdHSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21753429"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="21753429"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 12:19:32 -0700
X-CSE-ConnectionGUID: /j9nlC1QQXifZXf2qPvyQw==
X-CSE-MsgGUID: 0VZJQy9GQP6bljyomS+bbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="26960860"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 May 2024 12:19:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 12:19:31 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 12:19:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 12:19:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 12:19:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNCB4XEFgQlCy92HsoTrM/LegjAUm3JqAcq3Mp0IYyDWlU3121Q8eoBh6Nq5lqy5BegXR7eOXD8reoFF+LCNDTxd5bHBeW/tFL1XZKDStEyp3GpTYIVdMjcokC1AePqeX+Y8441XL9PkIZNoTpnVTdNMW+9pnbIzo/Op5QUQfLUS00M76qWSdQEb/zBB0E/ZLc4Mv7PqMfoThk2QbykaSyTNgOgxjBaa9SZdbV1bOXBUjPHgNYXHxYnJ7MFg7fQczeHDqSRFKUhj/6xMHsptM3KwujvY+x1A01o4aLVHRVZGEZypWCBMlw9AnTX+lnk4U45fSnkrXY7KHDuqe4DLUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t49ZrLciGbaJwyfHypvE3+5wDspzCdA27R59mlHGU/c=;
 b=HrPEGht7k8taqUaencvYq7E/VSO8pItOLm0i0Hle8DdR1CmIAAhKKIvOd6MuKt8L7JPrBckKBeCcQ9ySko6L8/3c6CwfSVfq2d6PT9cnPNdye4Efqlw4Q65Ylfq58iUA7d5L4jYoFlkeuD8H3UEQTKsNTJPStq1FtrtvZZ1cQTjmVveV57T1fqIpAm2fIdQCaHAHacqj7H4j8VxhqidBTckFpykpUGcu/YrKAKDqxRbr4mcLUqaPQ5bpbSr01d4GdTVWKRqqpIRZ4OqIHQ7v8fvsO5KmhUygim9MilPq1yT2BzDumV79jsgN64JYS4W+L1JLcjAjSl980u7vIytSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 19:19:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 19:19:28 +0000
Date: Wed, 1 May 2024 14:19:25 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Relocate regs_are_mcr function
Message-ID: <zwae4cxrrlp5oeicwjukd7zvz3c7r2ou7cnlajca3rnym3rvrn@36xjuvlxuolp>
References: <20240430170427.1808136-1-janga.rahul.kumar@intel.com>
 <20240430170427.1808136-2-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240430170427.1808136-2-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: MW4P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdb3593-7e05-40d9-d996-08dc6a139edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eOEd7GRd0lyyijPtRjTu0rq2spy19cSV9MtV5iycstSrSl1Vv4ivjTOT+wXg?=
 =?us-ascii?Q?j2XTIoP7DR4KIT9w5gxcbotMEDUA9vyUBRHMwAJRNg7tZzUR90kpizE8WEZj?=
 =?us-ascii?Q?mKARO7qrjLt6vSAX7CRhhU+j7J+1xWi4ZtyJObf819RrHkkTtW0eRPgDBMfB?=
 =?us-ascii?Q?BZmBFlg4Wn2zn57wa972ooOnITwiGKCokvsUGlnLs2awo5y1I4U29XRXRNCW?=
 =?us-ascii?Q?adFTXvOLLMARzMTv/+Uunpo/Tv1xKlIoQZx7nWaySos6rrHyq6Iu7QJFpIrO?=
 =?us-ascii?Q?3+pPW9JjvByHY3va/kjVBvFMQhKJmm/OtH5x9oHh+z4LUDihkXXIYgfLT7Ne?=
 =?us-ascii?Q?7zL/iw3bHUEG8zjUU3eMjqT4AAhe0jeqQk4kHz1n6wJJJGgexNbEQQoMpaUM?=
 =?us-ascii?Q?s1AHIiaQYyIGJsVGEDaQ2n6B3cn74Ln2DsZzKZkLSbq4Ksic2VHfVYPPHRVl?=
 =?us-ascii?Q?xJxa2TrzZ+maHIM3tuG/02Ltyh1TCjpbzTsl19Jghh6ZqX3LFn3n+wYd5D73?=
 =?us-ascii?Q?9ow/aLTCUqvQC2n/h1z4YCd3sImUnwq74vJqQ6rzGjRoi3USkI4zYH8XhRpA?=
 =?us-ascii?Q?2pRaqMOiHyZGjKexjIWsNMitkH5tX0cqNpmYQFL+PIP5teTpDSKwYr+akoWm?=
 =?us-ascii?Q?jLO3jY4GBf3Nmk+0FUlSXWXlrWTDlDf0k5qLN18HOAgpITPf9XIBgQyPbJDB?=
 =?us-ascii?Q?50znEGDRc5ovNh/FifsAxDMrqfyVoagVS8KSqpfLeH1H+YuFsiwMzdw95hL/?=
 =?us-ascii?Q?USHETmexNDGMt4Fih+Tc5HG7GPDZzfJMW09CkeiDVjSNGkZYeQbHjXbcqVyv?=
 =?us-ascii?Q?5DEdHp2zS1QOHaWrb09F6khaxHQ+l0wmr7rZDJk1l9w5jOL/k7uOxZjyRdP7?=
 =?us-ascii?Q?II4N+eHhxAYjhSltz5zz+QOMf780ALP0nKT7Mbp4x6ln6vfQ3norbrCfM6nK?=
 =?us-ascii?Q?w5Dq4EPlQ7m2mFd07KVHTkBTIiNpQq+DhBUf8hMSiQJ9+5DOud8NJ+/0u4sr?=
 =?us-ascii?Q?sLCzkP3+in1h2YZOzwp1x3o6OKuo9LOKmo01VbMagDXELS2OdDok1KsyICQf?=
 =?us-ascii?Q?Ke5lKDeDyBR141bFM6tpNA+kcKaHT1eu8iq5hq+TAp1UZRhXY2GS4oipwTRb?=
 =?us-ascii?Q?Nn8K6jw51UsU4MRp66i1nwiyDb4+XfwTowc3NbcmLaUlYMBANauFj5uEMa7Z?=
 =?us-ascii?Q?iQK1EUm4UTOwF4GYd05s/NHeJSLxGnD+byuz/ghbC70vFUyrRrWlM8htZyG6?=
 =?us-ascii?Q?pGB1hk3o9dteQQcGZ9tcjX48uWEnmEJzjvePYzI8iA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7q9qf2QFBpEritZ8aexK2uwwae7ojJImM/wnWI0SebwwGFjOQp9ZwfFSZ+ST?=
 =?us-ascii?Q?Xb+fmHuuSPoMgVIzi0093u0j2FRTlX4+Z4XLlpG1A8LcuJTRI/p78k64bW1L?=
 =?us-ascii?Q?V9t99GGUENLclLltikoaLoqiWDpIkxhVZWgpJ4OrRCI3kEPQ020tq8R3MRw7?=
 =?us-ascii?Q?3P21xD5obnqtW3VeZOeaWihznfz/+UCNeyQESLyiUtvrCUdDiIdSzl560OUM?=
 =?us-ascii?Q?s/YhHc52nRtjJpHrdPLOPjK17TAzj5lpqQVN3EYdOZkKUUZTY70h/HQr0ORq?=
 =?us-ascii?Q?Ofnnxh1dSHHcSXzG1k4jRL9dNFZVBiqD2W0Je+YAbsSmhdeWuVr0GitTF2Up?=
 =?us-ascii?Q?fddigEkYENjLwEn+a++Ehk9q8wACvJ1aOs1QnH0n+Oo3BiHPYcpfx7cHSlTE?=
 =?us-ascii?Q?5IxwSsdqClELc18WX630/tHOQSbfvZk+NWEEtF11TIeiPCv76oV0EX6gjZu+?=
 =?us-ascii?Q?yw6C6AjuNs/AYUVUb+4AjKC+p77qrMmxbtlnHO6r0BTtGp/PAU+pVO1egMEP?=
 =?us-ascii?Q?aBkF915VZGr7BHBNX0ZY3nRdX9GYFC64OK+V6rrWhifAVB8jMhHX4Fzja6RV?=
 =?us-ascii?Q?Oz5g5XOD1LJmvBIgD2tGvPGOgrdCFX0pSGdJFr7Ikwp5MbuHdmQVWO6ymPAC?=
 =?us-ascii?Q?nsCAEuUMuMTPCRpltPY/jiJzpmz4Zo+E4JvVyeIiOjuL1qV4mIl0V46EpYR9?=
 =?us-ascii?Q?uI66rQmHV2fLiV+RQdRJ5EekV6BQJbwDnLm4aRRucMv1AxJg8mS2JraaC5W1?=
 =?us-ascii?Q?S463an6YO6h1xRIilhhmEZQ8GbP8Z8WDdy5NB3GUVcYAIn6DhIjJk8n+GjXU?=
 =?us-ascii?Q?SvQm6sPemC15spIaYDx3JsDO5ZZoyCOf/1DVdWd6Ag5vj6Wt4WIE/KoTGZ9o?=
 =?us-ascii?Q?yEyguw+v+KwwJRYt3l4jxbaG6n0g67II0oRgsc13RD6gtEiCzcC6qKotc+AV?=
 =?us-ascii?Q?FeTubAxE0MBniAgEhmZFYuseHKH1aDEznPeO3HBy4hLcJuUFfPqRtYC56e9y?=
 =?us-ascii?Q?iW8N1mg581CBTUZsANnh/LMbxh3KPghGNweFWLS+svdZJZBejnqxBGr48IKs?=
 =?us-ascii?Q?p877gQWrLP9Q4Jw+UNtrcV6ZSb75Cu172maolh3oKzTLOCM0r2y7EHr/4uBV?=
 =?us-ascii?Q?tAQR61XOVtftywtBRYydy1+BfcBMQmVmONsj8ZefVZv9XW3yBy75vNBi44kO?=
 =?us-ascii?Q?HMK9VzybDJKgdEudTpptEqZVcZ0Nn/9ye8p6DE8wJ7xIRNmX+pnEyaj3mlzd?=
 =?us-ascii?Q?lDTdGkUM6r4dMO6jOZKerp7PMahB/SdraI6qq2NgySOI6w12jQhdmbnthbl8?=
 =?us-ascii?Q?HmAb3MLrEPt9BA1te+FOAGEuuxkcB4P7V4ynndLxltzEphNbo+GnLwz6kQmo?=
 =?us-ascii?Q?E7mRydZmvj51jaQjNjGOWIwIoIToyOEYZ/bd16zBBU51iIZh6W5XG5OXegjI?=
 =?us-ascii?Q?I42MlIbLoLPPSc2yezDjKQaORa3H5nhy6f7IxTqzxeraEhq/KQmcEo9Jqo2Q?=
 =?us-ascii?Q?V75b38Pqm2hLxyU7DoQpsOCOa/TZfk6ZMwAAGd5xD9yCLH7f67ou//ubyP6e?=
 =?us-ascii?Q?iwlnKYSgfKbl+c4X0WQQdz3mQzfqC/2ySRiOoxYA5ueTURo9tOI3+y9MnzC5?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdb3593-7e05-40d9-d996-08dc6a139edf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 19:19:28.3248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGgGEMjM5c61JnxIwg8ajvSu3yfOa1Vjn2xNO5Ea59tDxRSwGbSXfZnS/hlb4rlxCM9nL3/nbj/Mg0QSB73/C5sK2daBD5W2SnQlfAtM96c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
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

On Tue, Apr 30, 2024 at 10:34:26PM GMT, Janga Rahul Kumar wrote:
>Relocate regs_are_mcr funciton to a higher position in the file
>for improved visibility.
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
