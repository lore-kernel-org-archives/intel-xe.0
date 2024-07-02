Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3606C3065C
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 19:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F7710E67B;
	Tue,  2 Jul 2024 19:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXQUGCOd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA88C10E67B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 19:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719949640; x=1751485640;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b8zVQMkVbauI9r+D3jdOkOT7c/2Wvo9WxH0SB/s4F90=;
 b=QXQUGCOduVOIet8pdgAToWdvjkZBbYjt7LURixbHBrc6+VXPzb8qkZPT
 J/i6pBqyZE8W85Vsihc5QrPjTpoeSp/Ty2A5Ymf+/BYgxYABTx1q+wg6a
 lduBayySAV8ItN211rQ4fSvGAEg9w0AHTIJOWJz4l4gQswTdfzBaGPDVz
 JuGBwAus6BrmQ8uDSFuViBvCGWCpRe4fw/d+EqvTmIpTjCaaEMmu/l6zx
 /NXheY9p9ezuZvqQ3JXkjdA3NWF49a4OJBMLJD5YH/PqBlbfzF+neqBh3
 XLLH7l6TYjFcTnWLmBw8FSN+2Q+JAo6onquFUrtmbGUX96nBMFj4iQxZm Q==;
X-CSE-ConnectionGUID: XnFLlxC2Qpi9HucuogQmzg==
X-CSE-MsgGUID: WQTAPST7RHejICQGyYrwLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17268067"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="17268067"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 12:47:19 -0700
X-CSE-ConnectionGUID: RW5XLOa+QMqsSAXiVj44vw==
X-CSE-MsgGUID: yAHcXDRbQiazi6ziKKMR/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46154547"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 12:47:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 12:47:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 12:47:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 12:47:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYQIYuD/pX8a3ee0gASCaI8usXD3ntNcABcjr81w33Nm+01L+276blo7f+WRCu39M2E4F8VB/9F3r+7iUIKI3ginaSOB9Km1BWT8tlQC+n9p03RiEZq0PRLFrrvz/eOwfq/pnjg3Dq/TxDaJyJr2cgC/VqO7XI/QL6utYPUYG/EBBdGQ5QfkHr0iUfu9oyjYNcfW16pYjqy5z9AvHZK1lDd2dQKnDrhEC0IWp2dPquMXoB01hsfKKZLV7DKpkEnt/vp0k/MySYCUieg4uf1mRt5QJgjsoHV9YH2iqFXiSU9KlreB+YhgKnTkiMZXPi7z2ZCSKP1KsnlblQpRIjWSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDX+XZC+JUZCJARd5jwREVvl48A7byjmoKjDbxTCSzM=;
 b=V0nK/D0gfYmvN69eSqdtWbH5byTuDYp0tyKdmtb+KpDi1v91DVUP6al81xXdwOT7/nSHl5jQwScXMV/BMOtthlmmtyhwxhAGz5pX49uAtBJDdBCeNOFrQBhD1XqBNNibQnrp2+Z/C3A1+rGA++6aCXElNCTIgg+thG/hWT344Lv51PABDBF47bLq1oJ7pBUMTsPTr3pIrkZNgtB9LQDpgB27KQ8i8jPsGNtfThypw2VVkpwpstI2Uvnz1hxwNLh1ul2gQOxgti0HnWmt01txdyrVY8xAW+M7vlzRwxy5Ygi3zVWf1ocZcqJyiiYlUvx/Ocuqd1hLZKILPZjLp9IaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 19:47:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 19:47:13 +0000
Date: Tue, 2 Jul 2024 14:47:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Jose Souza <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/obsrv: Rename xe perf layer as xe observability
 layer
Message-ID: <dnkulc6j3c25f3powx5kltuxv3qak6oxbilqj3uog5lwp3ikna@6mflfe2vdmyq>
References: <20240702160740.2487279-1-ashutosh.dixit@intel.com>
 <ZoQo5F7cUsM3VZKE@intel.com>
 <87tth7a9c3.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tth7a9c3.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 310763a2-398c-4155-7edf-08dc9acfc4b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lqqgBD80ujw+JWNf+01agn/QPAhjsy4FZPg1Pa2F9B54pANlaJSKRmIazx?=
 =?iso-8859-1?Q?Gk8kHPewIuP4XwjABwLURuPIgbCIn5CFEB0I4Bv7edS11rPlPrifHWevba?=
 =?iso-8859-1?Q?+kD3l7nd0SgNRyH9Fo9XN6UwPooT0yxhZe7fxxIR5tOCplngXmYIUIDEHk?=
 =?iso-8859-1?Q?sMlPUfh/uiHn+SdjmC/yTn/RYerDQ1BOsAvaPOEPhEmbIF1Swzd47ctcGy?=
 =?iso-8859-1?Q?1Q+dTcueXjo7+VhXBX1JvqIao3vvGAOrpFEN1X6ljv+wPLPFQE/YYkOGDZ?=
 =?iso-8859-1?Q?dg9mkQpiD7w1IsLqdJbFglp8GFispPg4xuZOwDfJZkBMSFSgFpRkisQyFO?=
 =?iso-8859-1?Q?6EBsgB6mX59nbAVurV/7/dAxuJjdLyCUUaPXoprgH47MhKrx4eKf9n8Qyi?=
 =?iso-8859-1?Q?FylqB2Wh7SMGfL4RNMwLW1ZrVE39IlrUdhClElpSz1v1snfQ6dhaI/0H+m?=
 =?iso-8859-1?Q?u5hcThYlVSUuOlnQh7p/YeZH2vTFDU8BakZWD0s993fa1+4uaHtHn2u90p?=
 =?iso-8859-1?Q?rrEuG975toGeZ0okUeM31mWZWoc1qzHxxsXjpTaq4k25Pchj7ofh2e7YPG?=
 =?iso-8859-1?Q?XcetbvstzQZNFgKXZxmumYattag5157fYU/3L2/Qq+LTX4yYqrF9aDkYTT?=
 =?iso-8859-1?Q?rveTPjAQpgF8bLVUkifUdQF2Sr5d/NutGahpd/+DYj2Wv5vCI7FgeywdiT?=
 =?iso-8859-1?Q?oUgvtvKyxZ4sNqh+v5xbDOSEvZ3TjRlY2bxBfV5Xt+H+dL0i5++ak3GLVs?=
 =?iso-8859-1?Q?dnPgM0pbay9VGIBBE/M+A+ERNuC3Iodhy+2zN0xZAUQkM9C+oy0dzxpbtJ?=
 =?iso-8859-1?Q?tNtJAlPngjmKpTd+S4o+Si8jF/gHi6Moc791cPT1EGdyJUHq8BAZg49DD6?=
 =?iso-8859-1?Q?dIyIOYB+y+SBN64G7I8Y4c3QLdizJF7qdyfzl1rqhm75Ahh3j39z5hi9b9?=
 =?iso-8859-1?Q?3qI/jryB5h9DnXL88Oq/yQU4BRDFCeqUysRzHrAv8/EC541zQ60F+kLUf5?=
 =?iso-8859-1?Q?PcgqsW81z89nCl8IQBGpyUR506Imrs30uSLfr6KdzrlRtl9vBgm1jPz9h5?=
 =?iso-8859-1?Q?J0i6iw3KMiE8qYRrzXq3Ct/ukAM6W1/N5MjCny/hJyND7DeZ5bqfh+asPV?=
 =?iso-8859-1?Q?wlXWRkc5T3PNDbOuVtBljX5AzIGQzEZM+pCP+JaIG98Y8ORGL8CJklEy9p?=
 =?iso-8859-1?Q?gKPeZoNCzVd6qYHKyu1Gl7e/CNxwRyeUojQ/ot6sftdwUl48VcuRLZ29G+?=
 =?iso-8859-1?Q?Xl8QG6m4W9Hohlcnv/Bg08/IAwMvUzJJ7MihgYX3iep8/cb1vB3UvKptEI?=
 =?iso-8859-1?Q?ohUTtxrLtYSkdKIuQMBn3gNJDuGoow3w8/P5zytFxfs0zP9eXO+27oViJM?=
 =?iso-8859-1?Q?0EdCIzs2ozm30o0zlaTpyl+QFDnGoz3A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?h20mS08LtHBrD6qMI4ClsvGGLgoAzkjIQlRozMhNSLDgEZ5u3QsKKaBlQQ?=
 =?iso-8859-1?Q?VJSI+qgXHjiHRiPw50ToHFe97PYXujuhS/EOdXe6TgjfKza0eMEf6873kX?=
 =?iso-8859-1?Q?vhiewYnFrg42miVmuPhkTNUWxVY+paePLVfbdLsYVLSPTcfSsRUVJs7Eaa?=
 =?iso-8859-1?Q?g7xx+ZYIgFoIpebdQMvp4fR0h2AGfbB6MtOPwtoEMiOQdtmsqzNDJ/scjz?=
 =?iso-8859-1?Q?K7InX5EzzJtB+9q8pRDTZ0l8f6zm8iPylz7ff4X4ea9nnWnTr+Gu7ZhRdr?=
 =?iso-8859-1?Q?b8oLG4qBAQf7YZ14ptxFJ+7xjsjIYHAVWM/TESrqmuQvAlplWlznAtmjoj?=
 =?iso-8859-1?Q?IU5whMqJdsp0uQfWS1kzscwBN0lLUG1d06tJ3kc4tKJayFppQC9n1kfS2q?=
 =?iso-8859-1?Q?jddDcRjS7PRR5C7JjqQpyoeP+N/iw360Jk14IV7hw758bMsBZv0YSpQ1zS?=
 =?iso-8859-1?Q?KS27ZC9kEP5AnMP36CXysiNnsIIuL6jAMqV2tO9ajjHOwyUV+TUwe778eq?=
 =?iso-8859-1?Q?xO+5mhb7P08GkJw3reYnyCC1bhBfcZtIK4feAz3JVLU3/szqb69NXsSenM?=
 =?iso-8859-1?Q?hpRV6Mjr4hyo4n2y2sY/lCbdu6swh/LFnxjEE/z96zK87pe8/8cLh6Wsyc?=
 =?iso-8859-1?Q?cRWF7bnx6jvAGbPFTILqrJdSa3B7XqXHX5vBJ3aeTtvbG00wIMF51tPPLC?=
 =?iso-8859-1?Q?qjaPfE8IdsFxkzuIiUoyCnFYP9Mmny0IVz0Ruxw9bKAZHUFMhgcyh2FGJR?=
 =?iso-8859-1?Q?mGZkCqo0x2/oMAv3lGjid47DOeUH55CwyzjaL2KRl8Auxy/UUunsV9645h?=
 =?iso-8859-1?Q?KcVvHkCN3BIUp4XcwEsaXIcs0bLGGLce2EKpv2QWp84CDWyMJEBjSZw9Xw?=
 =?iso-8859-1?Q?Xk65+ufkM3QsJtvKZ3UC5xu4uTKrHRMdpdDNCJ694UO9ZDOV0nB6nIV0wm?=
 =?iso-8859-1?Q?XccbQIeuCkOAFytrQcsYBXgF/ciIKhCK5q8PHJo/l6FhmoB0m2Il10nqg8?=
 =?iso-8859-1?Q?v3gzJK2kJd2mWn/xNKoMQTZ0pNe1fnkiU3J5haDOnkbmMSLvqpYwp49bW2?=
 =?iso-8859-1?Q?3d125ZobEwucf+jaqi2dOQFEjdH5Kc2yHKnVlUhzf46SbuFizEGm9mKV9M?=
 =?iso-8859-1?Q?MRNGbWH15/8L8I60StBJlw2Ki+xSoi9UIGfxlhBfBRp8XkrPrCCS+2/Ri+?=
 =?iso-8859-1?Q?B8HrwcHqZxi/Ic7+Ie7OVXaDjeQ0WpmMXeWvjg3QJBdWGTgkJHybR7Yzr1?=
 =?iso-8859-1?Q?kthWfOMU5G++ArxDtu+dnzZhgs3HFlpElaUn3+7T7OibIehJ93DPth6iml?=
 =?iso-8859-1?Q?2PnuOcaxf7ZyqPRsXgXUGsyHWBq4Vjf+aKIFCAj9VOA2y5GPFxuTNPxkBl?=
 =?iso-8859-1?Q?zsYk9fv3ZgvYr22j58kjAVrrMYJUvYo9v8Xox1t69BuP/X4hayW4MJ++vJ?=
 =?iso-8859-1?Q?50GD8RZQtoLRADuOGpcUHsFwZdJtyXIl4Uh2VXHMaWsnxH84jUAHuKBIE0?=
 =?iso-8859-1?Q?oLDqqiIM7B0nN9Vdi2MYM9sJxzpXF/GRcF7PdJzmNhjGxK2FNYbhAagrfx?=
 =?iso-8859-1?Q?X3G0otKYSWobvDT0EXC8iQO6wunFm90cAWIT6dYe1wKD5o+6Safb7TDlhz?=
 =?iso-8859-1?Q?QLIyfCK+ZK6UfzvcEhGOKEVMkL9iU0YsM3W52EdpOJ4/qpW4Zuh7vReA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 310763a2-398c-4155-7edf-08dc9acfc4b9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 19:47:13.2050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRQiydMtip7NiGls62aC0W1Klyw3tk5BjjleIBzOLZLjK7HIUuvk1qV7PS9uPj52deDhX+NzX4bqO0sOmyy/io7nWnEcRjBTFF5fJqL2WEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
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

On Tue, Jul 02, 2024 at 12:21:32PM GMT, Ashutosh Dixit wrote:
>On Tue, 02 Jul 2024 09:20:52 -0700, Rodrigo Vivi wrote:
>>
>
>Hi Rodrigo,
>
>> On Tue, Jul 02, 2024 at 09:07:40AM -0700, Ashutosh Dixit wrote:
>> > In Xe, the perf layer allows capture of HW counter streams. These HW
>> > counters are generally performance related but don't have to be necessarily
>> > so. Also, the name "perf" is a carryover from i915 and is not preferred.
>> >
>> > In this patch we propose the name "observability" for this common layer
>> > which allows capture of different types of these counter streams.
>>
>> Yeap, perf is indeed a bad name. I thought about observability at first
>> because I always read 'OA' as observability architecture. Although Matt
>> Roper convinced me that the most recent spec pages calls that as
>> Observation Architecture.
>>
>> Shouldn't we go then with xe_observation?
>
>OK, I think we can go with xe_observation.
>
>>
>> Well, although, OTOH, xe_observ can be applied as short to whatever
>> bspec page you are looking at ;)
>> Then perhaps just a mention to both names in some doc?
>>
>> No strong preferences on what final name, but +1 on changing the
>> name:
>
>Will change to xe_observation. So we'll be opening/working with observation
>streams. Will change names and comments to that effect.
>
>
>>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>
>Also since this is a uapi change don't we need to include this in the 6.11
>PR? How else will we handle the uapi change?

yes, this needs to go with 6.11... should be sent in a -fixes pull
request (since we already submitted the drm-xe-next pull request).

Thanks for working on this rename and I'm sorry I raised this concern
after it had been merged.

Once we get this squared we should also update mesa (just checked their
MR and it has been merged last week). +Jose

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

for xe_observation

Lucas De Marchi

>
>Thanks.
>--
>Ashutosh
>
>
>
>>
>> >
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/Makefile          |  2 +-
>> >  drivers/gpu/drm/xe/xe_device.c       |  4 +-
>> >  drivers/gpu/drm/xe/xe_device_types.h |  2 +-
>> >  drivers/gpu/drm/xe/xe_gt_types.h     |  2 +-
>> >  drivers/gpu/drm/xe/xe_module.c       |  6 +-
>> >  drivers/gpu/drm/xe/xe_oa.c           | 34 +++++-----
>> >  drivers/gpu/drm/xe/xe_obsrv.c        | 93 ++++++++++++++++++++++++++
>> >  drivers/gpu/drm/xe/xe_obsrv.h        | 20 ++++++
>> >  drivers/gpu/drm/xe/xe_perf.c         | 92 --------------------------
>> >  drivers/gpu/drm/xe/xe_perf.h         | 20 ------
>> >  include/uapi/drm/xe_drm.h            | 97 ++++++++++++++--------------
>> >  11 files changed, 187 insertions(+), 185 deletions(-)
>> >  create mode 100644 drivers/gpu/drm/xe/xe_obsrv.c
>> >  create mode 100644 drivers/gpu/drm/xe/xe_obsrv.h
>> >  delete mode 100644 drivers/gpu/drm/xe/xe_perf.c
>> >  delete mode 100644 drivers/gpu/drm/xe/xe_perf.h
>> >
>> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > index b1e03bfe4a68..21e8ebe10e85 100644
>> > --- a/drivers/gpu/drm/xe/Makefile
>> > +++ b/drivers/gpu/drm/xe/Makefile
>> > @@ -96,10 +96,10 @@ xe-y += xe_bb.o \
>> >	xe_mocs.o \
>> >	xe_module.o \
>> >	xe_oa.o \
>> > +	xe_obsrv.o \
>> >	xe_pat.o \
>> >	xe_pci.o \
>> >	xe_pcode.o \
>> > -	xe_perf.o \
>> >	xe_pm.o \
>> >	xe_preempt_fence.o \
>> >	xe_pt.o \
>> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > index cfda7cb5df2c..adf6cec662ea 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.c
>> > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > @@ -42,9 +42,9 @@
>> >  #include "xe_memirq.h"
>> >  #include "xe_mmio.h"
>> >  #include "xe_module.h"
>> > +#include "xe_obsrv.h"
>> >  #include "xe_pat.h"
>> >  #include "xe_pcode.h"
>> > -#include "xe_perf.h"
>> >  #include "xe_pm.h"
>> >  #include "xe_query.h"
>> >  #include "xe_sriov.h"
>> > @@ -142,7 +142,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>> >			  DRM_RENDER_ALLOW),
>> >	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>> >			  DRM_RENDER_ALLOW),
>> > -	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
>> > +	DRM_IOCTL_DEF_DRV(XE_OBSRV, xe_obsrv_ioctl, DRM_RENDER_ALLOW),
>> >  };
>> >
>> >  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > index c37be471d11c..4a51f0152cf2 100644
>> > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > @@ -463,7 +463,7 @@ struct xe_device {
>> >	/** @heci_gsc: graphics security controller */
>> >	struct xe_heci_gsc heci_gsc;
>> >
>> > -	/** @oa: oa perf counter subsystem */
>> > +	/** @oa: oa observability subsystem */
>> >	struct xe_oa oa;
>> >
>> >	/** @needs_flr_on_fini: requests function-reset on fini */
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> > index 24bb95de920f..005c38fa3b4a 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> > @@ -389,7 +389,7 @@ struct xe_gt {
>> >		u8 instances_per_class[XE_ENGINE_CLASS_MAX];
>> >	} user_engines;
>> >
>> > -	/** @oa: oa perf counter subsystem per gt info */
>> > +	/** @oa: oa observability subsystem per gt info */
>> >	struct xe_oa_gt oa;
>> >  };
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> > index 893858a2eea0..76002c0202c4 100644
>> > --- a/drivers/gpu/drm/xe/xe_module.c
>> > +++ b/drivers/gpu/drm/xe/xe_module.c
>> > @@ -11,7 +11,7 @@
>> >  #include "xe_drv.h"
>> >  #include "xe_hw_fence.h"
>> >  #include "xe_pci.h"
>> > -#include "xe_perf.h"
>> > +#include "xe_obsrv.h"
>> >  #include "xe_sched_job.h"
>> >
>> >  struct xe_modparam xe_modparam = {
>> > @@ -80,8 +80,8 @@ static const struct init_funcs init_funcs[] = {
>> >		.exit = xe_unregister_pci_driver,
>> >	},
>> >	{
>> > -		.init = xe_perf_sysctl_register,
>> > -		.exit = xe_perf_sysctl_unregister,
>> > +		.init = xe_obsrv_sysctl_register,
>> > +		.exit = xe_obsrv_sysctl_unregister,
>> >	},
>> >  };
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> > index 4188516a7816..ba23efb49f42 100644
>> > --- a/drivers/gpu/drm/xe/xe_oa.c
>> > +++ b/drivers/gpu/drm/xe/xe_oa.c
>> > @@ -32,7 +32,7 @@
>> >  #include "xe_macros.h"
>> >  #include "xe_mmio.h"
>> >  #include "xe_oa.h"
>> > -#include "xe_perf.h"
>> > +#include "xe_obsrv.h"
>> >  #include "xe_pm.h"
>> >  #include "xe_sched_job.h"
>> >  #include "xe_sriov.h"
>> > @@ -481,7 +481,7 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
>> >					  OASTATUS_RELEVANT_BITS, 0);
>> >	/*
>> >	 * Signal to userspace that there is non-zero OA status to read via
>> > -	 * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
>> > +	 * @DRM_XE_OBSRV_IOCTL_STATUS obsrv fd ioctl
>> >	 */
>> >	if (stream->oa_status & OASTATUS_RELEVANT_BITS)
>> >		return -EIO;
>> > @@ -1158,15 +1158,15 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
>> >			       unsigned long arg)
>> >  {
>> >	switch (cmd) {
>> > -	case DRM_XE_PERF_IOCTL_ENABLE:
>> > +	case DRM_XE_OBSRV_IOCTL_ENABLE:
>> >		return xe_oa_enable_locked(stream);
>> > -	case DRM_XE_PERF_IOCTL_DISABLE:
>> > +	case DRM_XE_OBSRV_IOCTL_DISABLE:
>> >		return xe_oa_disable_locked(stream);
>> > -	case DRM_XE_PERF_IOCTL_CONFIG:
>> > +	case DRM_XE_OBSRV_IOCTL_CONFIG:
>> >		return xe_oa_config_locked(stream, arg);
>> > -	case DRM_XE_PERF_IOCTL_STATUS:
>> > +	case DRM_XE_OBSRV_IOCTL_STATUS:
>> >		return xe_oa_status_locked(stream, arg);
>> > -	case DRM_XE_PERF_IOCTL_INFO:
>> > +	case DRM_XE_OBSRV_IOCTL_INFO:
>> >		return xe_oa_info_locked(stream, arg);
>> >	}
>> >
>> > @@ -1209,7 +1209,7 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>> >	xe_oa_destroy_locked(stream);
>> >	mutex_unlock(&gt->oa.gt_lock);
>> >
>> > -	/* Release the reference the perf stream kept on the driver */
>> > +	/* Release the reference the OA stream kept on the driver */
>> >	drm_dev_put(&gt_to_xe(gt)->drm);
>> >
>> >	return 0;
>> > @@ -1222,7 +1222,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>> >	unsigned long start = vma->vm_start;
>> >	int i, ret;
>> >
>> > -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>> > +	if (xe_obsrv_paranoid && !perfmon_capable()) {
>> >		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
>> >		return -EACCES;
>> >	}
>> > @@ -1789,8 +1789,8 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
>> >   * @file: @drm_file
>> >   *
>> >   * The functions opens an OA stream. An OA stream, opened with specified
>> > - * properties, enables perf counter samples to be collected, either
>> > - * periodically (time based sampling), or on request (using perf queries)
>> > + * properties, enables OA counter samples to be collected, either
>> > + * periodically (time based sampling), or on request (using OA queries)
>> >   */
>> >  int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
>> >  {
>> > @@ -1836,8 +1836,8 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>> >		privileged_op = true;
>> >	}
>> >
>> > -	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
>> > -		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
>> > +	if (privileged_op && xe_obsrv_paranoid && !perfmon_capable()) {
>> > +		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe OA stream\n");
>> >		ret = -EACCES;
>> >		goto err_exec_q;
>> >	}
>> > @@ -2097,7 +2097,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
>> >		return -ENODEV;
>> >	}
>> >
>> > -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>> > +	if (xe_obsrv_paranoid && !perfmon_capable()) {
>> >		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
>> >		return -EACCES;
>> >	}
>> > @@ -2181,7 +2181,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
>> >  /**
>> >   * xe_oa_remove_config_ioctl - Removes one OA config
>> >   * @dev: @drm_device
>> > - * @data: pointer to struct @drm_xe_perf_param
>> > + * @data: pointer to struct @drm_xe_obsrv_param
>> >   * @file: @drm_file
>> >   */
>> >  int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
>> > @@ -2197,7 +2197,7 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file
>> >		return -ENODEV;
>> >	}
>> >
>> > -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>> > +	if (xe_obsrv_paranoid && !perfmon_capable()) {
>> >		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
>> >		return -EACCES;
>> >	}
>> > @@ -2381,7 +2381,7 @@ static int xe_oa_init_gt(struct xe_gt *gt)
>> >
>> >	/*
>> >	 * Fused off engines can result in oa_unit's with num_engines == 0. These units
>> > -	 * will appear in OA unit query, but no perf streams can be opened on them.
>> > +	 * will appear in OA unit query, but no OA streams can be opened on them.
>> >	 */
>> >	gt->oa.num_oa_units = num_oa_units;
>> >	gt->oa.oa_unit = u;
>> > diff --git a/drivers/gpu/drm/xe/xe_obsrv.c b/drivers/gpu/drm/xe/xe_obsrv.c
>> > new file mode 100644
>> > index 000000000000..f04ed4eb86b1
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_obsrv.c
>> > @@ -0,0 +1,93 @@
>> > +// SPDX-License-Identifier: MIT
>> > +/*
>> > + * Copyright © 2023-2024 Intel Corporation
>> > + */
>> > +
>> > +#include <linux/errno.h>
>> > +#include <linux/sysctl.h>
>> > +
>> > +#include <drm/xe_drm.h>
>> > +
>> > +#include "xe_oa.h"
>> > +#include "xe_obsrv.h"
>> > +
>> > +u32 xe_obsrv_paranoid = true;
>> > +static struct ctl_table_header *sysctl_header;
>> > +
>> > +static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_obsrv_param *arg,
>> > +		       struct drm_file *file)
>> > +{
>> > +	switch (arg->obsrv_op) {
>> > +	case DRM_XE_OBSRV_OP_STREAM_OPEN:
>> > +		return xe_oa_stream_open_ioctl(dev, arg->param, file);
>> > +	case DRM_XE_OBSRV_OP_ADD_CONFIG:
>> > +		return xe_oa_add_config_ioctl(dev, arg->param, file);
>> > +	case DRM_XE_OBSRV_OP_REMOVE_CONFIG:
>> > +		return xe_oa_remove_config_ioctl(dev, arg->param, file);
>> > +	default:
>> > +		return -EINVAL;
>> > +	}
>> > +}
>> > +
>> > +/**
>> > + * xe_obsrv_ioctl - The top level observability layer ioctl
>> > + * @dev: @drm_device
>> > + * @data: pointer to struct @drm_xe_obsrv_param
>> > + * @file: @drm_file
>> > + *
>> > + * The function is called for different observability streams types and
>> > + * allows execution of different operations supported by those stream
>> > + * types.
>> > + *
>> > + * Return: 0 on success or a negative error code on failure.
>> > + */
>> > +int xe_obsrv_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> > +{
>> > +	struct drm_xe_obsrv_param *arg = data;
>> > +
>> > +	if (arg->extensions)
>> > +		return -EINVAL;
>> > +
>> > +	switch (arg->obsrv_type) {
>> > +	case DRM_XE_OBSRV_TYPE_OA:
>> > +		return xe_oa_ioctl(dev, arg, file);
>> > +	default:
>> > +		return -EINVAL;
>> > +	}
>> > +}
>> > +
>> > +static struct ctl_table obsrv_ctl_table[] = {
>> > +	{
>> > +	 .procname = "xe_observability_paranoid",
>> > +	 .data = &xe_obsrv_paranoid,
>> > +	 .maxlen = sizeof(xe_obsrv_paranoid),
>> > +	 .mode = 0644,
>> > +	 .proc_handler = proc_dointvec_minmax,
>> > +	 .extra1 = SYSCTL_ZERO,
>> > +	 .extra2 = SYSCTL_ONE,
>> > +	 },
>> > +	{}
>> > +};
>> > +
>> > +/**
>> > + * xe_obsrv_sysctl_register - Register xe_obsrv_paranoid sysctl
>> > + *
>> > + * Normally only superuser/root can access observability stream
>> > + * data. However, superuser can set obsrv_paranoid sysctl to 0 to allow
>> > + * non-privileged users to also access observability data.
>> > + *
>> > + * Return: always returns 0
>> > + */
>> > +int xe_obsrv_sysctl_register(void)
>> > +{
>> > +	sysctl_header = register_sysctl("dev/xe", obsrv_ctl_table);
>> > +	return 0;
>> > +}
>> > +
>> > +/**
>> > + * xe_obsrv_sysctl_unregister - Unregister xe_obsrv_paranoid sysctl
>> > + */
>> > +void xe_obsrv_sysctl_unregister(void)
>> > +{
>> > +	unregister_sysctl_table(sysctl_header);
>> > +}
>> > diff --git a/drivers/gpu/drm/xe/xe_obsrv.h b/drivers/gpu/drm/xe/xe_obsrv.h
>> > new file mode 100644
>> > index 000000000000..13cf4a8029a7
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_obsrv.h
>> > @@ -0,0 +1,20 @@
>> > +/* SPDX-License-Identifier: MIT */
>> > +/*
>> > + * Copyright © 2023-2024 Intel Corporation
>> > + */
>> > +
>> > +#ifndef _XE_OBSRV_H_
>> > +#define _XE_OBSRV_H_
>> > +
>> > +#include <linux/types.h>
>> > +
>> > +struct drm_device;
>> > +struct drm_file;
>> > +
>> > +extern u32 xe_obsrv_paranoid;
>> > +
>> > +int xe_obsrv_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>> > +int xe_obsrv_sysctl_register(void);
>> > +void xe_obsrv_sysctl_unregister(void);
>> > +
>> > +#endif
>> > diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>> > deleted file mode 100644
>> > index d6cd74cadf34..000000000000
>> > --- a/drivers/gpu/drm/xe/xe_perf.c
>> > +++ /dev/null
>> > @@ -1,92 +0,0 @@
>> > -// SPDX-License-Identifier: MIT
>> > -/*
>> > - * Copyright © 2023-2024 Intel Corporation
>> > - */
>> > -
>> > -#include <linux/errno.h>
>> > -#include <linux/sysctl.h>
>> > -
>> > -#include <drm/xe_drm.h>
>> > -
>> > -#include "xe_oa.h"
>> > -#include "xe_perf.h"
>> > -
>> > -u32 xe_perf_stream_paranoid = true;
>> > -static struct ctl_table_header *sysctl_header;
>> > -
>> > -static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
>> > -		       struct drm_file *file)
>> > -{
>> > -	switch (arg->perf_op) {
>> > -	case DRM_XE_PERF_OP_STREAM_OPEN:
>> > -		return xe_oa_stream_open_ioctl(dev, arg->param, file);
>> > -	case DRM_XE_PERF_OP_ADD_CONFIG:
>> > -		return xe_oa_add_config_ioctl(dev, arg->param, file);
>> > -	case DRM_XE_PERF_OP_REMOVE_CONFIG:
>> > -		return xe_oa_remove_config_ioctl(dev, arg->param, file);
>> > -	default:
>> > -		return -EINVAL;
>> > -	}
>> > -}
>> > -
>> > -/**
>> > - * xe_perf_ioctl - The top level perf layer ioctl
>> > - * @dev: @drm_device
>> > - * @data: pointer to struct @drm_xe_perf_param
>> > - * @file: @drm_file
>> > - *
>> > - * The function is called for different perf streams types and allows execution
>> > - * of different operations supported by those perf stream types.
>> > - *
>> > - * Return: 0 on success or a negative error code on failure.
>> > - */
>> > -int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> > -{
>> > -	struct drm_xe_perf_param *arg = data;
>> > -
>> > -	if (arg->extensions)
>> > -		return -EINVAL;
>> > -
>> > -	switch (arg->perf_type) {
>> > -	case DRM_XE_PERF_TYPE_OA:
>> > -		return xe_oa_ioctl(dev, arg, file);
>> > -	default:
>> > -		return -EINVAL;
>> > -	}
>> > -}
>> > -
>> > -static struct ctl_table perf_ctl_table[] = {
>> > -	{
>> > -	 .procname = "perf_stream_paranoid",
>> > -	 .data = &xe_perf_stream_paranoid,
>> > -	 .maxlen = sizeof(xe_perf_stream_paranoid),
>> > -	 .mode = 0644,
>> > -	 .proc_handler = proc_dointvec_minmax,
>> > -	 .extra1 = SYSCTL_ZERO,
>> > -	 .extra2 = SYSCTL_ONE,
>> > -	 },
>> > -	{}
>> > -};
>> > -
>> > -/**
>> > - * xe_perf_sysctl_register - Register "perf_stream_paranoid" sysctl
>> > - *
>> > - * Normally only superuser/root can access perf counter data. However,
>> > - * superuser can set perf_stream_paranoid sysctl to 0 to allow non-privileged
>> > - * users to also access perf data.
>> > - *
>> > - * Return: always returns 0
>> > - */
>> > -int xe_perf_sysctl_register(void)
>> > -{
>> > -	sysctl_header = register_sysctl("dev/xe", perf_ctl_table);
>> > -	return 0;
>> > -}
>> > -
>> > -/**
>> > - * xe_perf_sysctl_unregister - Unregister "perf_stream_paranoid" sysctl
>> > - */
>> > -void xe_perf_sysctl_unregister(void)
>> > -{
>> > -	unregister_sysctl_table(sysctl_header);
>> > -}
>> > diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
>> > deleted file mode 100644
>> > index 53a8377a1bb1..000000000000
>> > --- a/drivers/gpu/drm/xe/xe_perf.h
>> > +++ /dev/null
>> > @@ -1,20 +0,0 @@
>> > -/* SPDX-License-Identifier: MIT */
>> > -/*
>> > - * Copyright © 2023-2024 Intel Corporation
>> > - */
>> > -
>> > -#ifndef _XE_PERF_H_
>> > -#define _XE_PERF_H_
>> > -
>> > -#include <linux/types.h>
>> > -
>> > -struct drm_device;
>> > -struct drm_file;
>> > -
>> > -extern u32 xe_perf_stream_paranoid;
>> > -
>> > -int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>> > -int xe_perf_sysctl_register(void);
>> > -void xe_perf_sysctl_unregister(void);
>> > -
>> > -#endif
>> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > index 12eaa8532b5c..b80d0b0d7bb2 100644
>> > --- a/include/uapi/drm/xe_drm.h
>> > +++ b/include/uapi/drm/xe_drm.h
>> > @@ -80,7 +80,7 @@ extern "C" {
>> >   *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
>> >   *  - &DRM_IOCTL_XE_EXEC
>> >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>> > - *  - &DRM_IOCTL_XE_PERF
>> > + *  - &DRM_IOCTL_XE_OBSRV
>> >   */
>> >
>> >  /*
>> > @@ -101,7 +101,7 @@ extern "C" {
>> >  #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
>> >  #define DRM_XE_EXEC			0x09
>> >  #define DRM_XE_WAIT_USER_FENCE		0x0a
>> > -#define DRM_XE_PERF			0x0b
>> > +#define DRM_XE_OBSRV			0x0b
>> >
>> >  /* Must be kept compact -- no holes */
>> >
>> > @@ -116,7 +116,7 @@ extern "C" {
>> >  #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>> >  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>> >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>> > -#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
>> > +#define DRM_IOCTL_XE_OBSRV			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSRV, struct drm_xe_obsrv_param)
>> >
>> >  /**
>> >   * DOC: Xe IOCTL Extensions
>> > @@ -1376,66 +1376,67 @@ struct drm_xe_wait_user_fence {
>> >  };
>> >
>> >  /**
>> > - * enum drm_xe_perf_type - Perf stream types
>> > + * enum drm_xe_obsrv_type - Observability stream types
>> >   */
>> > -enum drm_xe_perf_type {
>> > -	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
>> > -	DRM_XE_PERF_TYPE_OA,
>> > +enum drm_xe_obsrv_type {
>> > +	/** @DRM_XE_OBSRV_TYPE_OA: OA observability stream type */
>> > +	DRM_XE_OBSRV_TYPE_OA,
>> >  };
>> >
>> >  /**
>> > - * enum drm_xe_perf_op - Perf stream ops
>> > + * enum drm_xe_obsrv_op - Observability stream ops
>> >   */
>> > -enum drm_xe_perf_op {
>> > -	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
>> > -	DRM_XE_PERF_OP_STREAM_OPEN,
>> > +enum drm_xe_obsrv_op {
>> > +	/** @DRM_XE_OBSRV_OP_STREAM_OPEN: Open an observability stream */
>> > +	DRM_XE_OBSRV_OP_STREAM_OPEN,
>> >
>> > -	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
>> > -	DRM_XE_PERF_OP_ADD_CONFIG,
>> > +	/** @DRM_XE_OBSRV_OP_ADD_CONFIG: Add observability stream config */
>> > +	DRM_XE_OBSRV_OP_ADD_CONFIG,
>> >
>> > -	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
>> > -	DRM_XE_PERF_OP_REMOVE_CONFIG,
>> > +	/** @DRM_XE_OBSRV_OP_REMOVE_CONFIG: Remove observability stream config */
>> > +	DRM_XE_OBSRV_OP_REMOVE_CONFIG,
>> >  };
>> >
>> >  /**
>> > - * struct drm_xe_perf_param - Input of &DRM_XE_PERF
>> > + * struct drm_xe_obsrv_param - Input of &DRM_XE_OBSRV
>> >   *
>> > - * The perf layer enables multiplexing perf counter streams of multiple
>> > - * types. The actual params for a particular stream operation are supplied
>> > - * via the @param pointer (use __copy_from_user to get these params).
>> > + * The observability layer enables multiplexing observability streams of
>> > + * multiple types. The actual params for a particular stream operation are
>> > + * supplied via the @param pointer (use __copy_from_user to get these
>> > + * params).
>> >   */
>> > -struct drm_xe_perf_param {
>> > +struct drm_xe_obsrv_param {
>> >	/** @extensions: Pointer to the first extension struct, if any */
>> >	__u64 extensions;
>> > -	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
>> > -	__u64 perf_type;
>> > -	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
>> > -	__u64 perf_op;
>> > +	/** @obsrv_type: observability stream type, of enum @drm_xe_obsrv_type */
>> > +	__u64 obsrv_type;
>> > +	/** @obsrv_op: observability op, of enum @drm_xe_obsrv_op */
>> > +	__u64 obsrv_op;
>> >	/** @param: Pointer to actual stream params */
>> >	__u64 param;
>> >  };
>> >
>> >  /**
>> > - * enum drm_xe_perf_ioctls - Perf fd ioctl's
>> > + * enum drm_xe_obsrv_ioctls - Observability fd ioctl's
>> >   *
>> > - * Information exchanged between userspace and kernel for perf fd ioctl's
>> > - * is stream type specific
>> > + * Information exchanged between userspace and kernel for observability fd
>> > + * ioctl's is stream type specific
>> >   */
>> > -enum drm_xe_perf_ioctls {
>> > -	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
>> > -	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
>> > +enum drm_xe_obsrv_ioctls {
>> > +	/** @DRM_XE_OBSRV_IOCTL_ENABLE: Enable data capture for a stream */
>> > +	DRM_XE_OBSRV_IOCTL_ENABLE = _IO('i', 0x0),
>> >
>> > -	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
>> > -	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
>> > +	/** @DRM_XE_OBSRV_IOCTL_DISABLE: Disable data capture for a stream */
>> > +	DRM_XE_OBSRV_IOCTL_DISABLE = _IO('i', 0x1),
>> >
>> > -	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
>> > -	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
>> > +	/** @DRM_XE_OBSRV_IOCTL_CONFIG: Change stream configuration */
>> > +	DRM_XE_OBSRV_IOCTL_CONFIG = _IO('i', 0x2),
>> >
>> > -	/** @DRM_XE_PERF_IOCTL_STATUS: Return stream status */
>> > -	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
>> > +	/** @DRM_XE_OBSRV_IOCTL_STATUS: Return stream status */
>> > +	DRM_XE_OBSRV_IOCTL_STATUS = _IO('i', 0x3),
>> >
>> > -	/** @DRM_XE_PERF_IOCTL_INFO: Return stream info */
>> > -	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
>> > +	/** @DRM_XE_OBSRV_IOCTL_INFO: Return stream info */
>> > +	DRM_XE_OBSRV_IOCTL_INFO = _IO('i', 0x4),
>> >  };
>> >
>> >  /**
>> > @@ -1546,11 +1547,11 @@ enum drm_xe_oa_format_type {
>> >   * Stream params are specified as a chain of @drm_xe_ext_set_property
>> >   * struct's, with @property values from enum @drm_xe_oa_property_id and
>> >   * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
>> > - * @param field in struct @drm_xe_perf_param points to the first
>> > + * @param field in struct @drm_xe_obsrv_param points to the first
>> >   * @drm_xe_ext_set_property struct.
>> >   *
>> >   * Exactly the same mechanism is also used for stream reconfiguration using
>> > - * the @DRM_XE_PERF_IOCTL_CONFIG perf fd ioctl, though only a subset of
>> > + * the @DRM_XE_OBSRV_IOCTL_CONFIG obsrv fd ioctl, though only a subset of
>> >   * properties below can be specified for stream reconfiguration.
>> >   */
>> >  enum drm_xe_oa_property_id {
>> > @@ -1571,11 +1572,11 @@ enum drm_xe_oa_property_id {
>> >
>> >	/**
>> >	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
>> > -	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
>> > +	 * reports, previously added via @DRM_XE_OBSRV_OP_ADD_CONFIG.
>> >	 */
>> >	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
>> >
>> > -	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
>> > +	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: OA counter report format */
>> >	DRM_XE_OA_PROPERTY_OA_FORMAT,
>> >	/*
>> >	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
>> > @@ -1596,13 +1597,13 @@ enum drm_xe_oa_property_id {
>> >
>> >	/**
>> >	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
>> > -	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
>> > +	 * stream in a DISABLED state (see @DRM_XE_OBSRV_IOCTL_ENABLE).
>> >	 */
>> >	DRM_XE_OA_PROPERTY_OA_DISABLED,
>> >
>> >	/**
>> >	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
>> > -	 * @exec_queue_id. Perf queries can be executed on this exec queue.
>> > +	 * @exec_queue_id. OA queries can be executed on this exec queue.
>> >	 */
>> >	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
>> >
>> > @@ -1622,7 +1623,7 @@ enum drm_xe_oa_property_id {
>> >  /**
>> >   * struct drm_xe_oa_config - OA metric configuration
>> >   *
>> > - * Multiple OA configs can be added using @DRM_XE_PERF_OP_ADD_CONFIG. A
>> > + * Multiple OA configs can be added using @DRM_XE_OBSRV_OP_ADD_CONFIG. A
>> >   * particular config can be specified when opening an OA stream using
>> >   * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
>> >   */
>> > @@ -1645,8 +1646,8 @@ struct drm_xe_oa_config {
>> >
>> >  /**
>> >   * struct drm_xe_oa_stream_status - OA stream status returned from
>> > - * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl. Userspace can call the ioctl to
>> > - * query stream status in response to EIO errno from perf fd read().
>> > + * @DRM_XE_OBSRV_IOCTL_STATUS obsrv fd ioctl. Userspace can call the ioctl to
>> > + * query stream status in response to EIO errno from obsrv fd read().
>> >   */
>> >  struct drm_xe_oa_stream_status {
>> >	/** @extensions: Pointer to the first extension struct, if any */
>> > @@ -1665,7 +1666,7 @@ struct drm_xe_oa_stream_status {
>> >
>> >  /**
>> >   * struct drm_xe_oa_stream_info - OA stream info returned from
>> > - * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
>> > + * @DRM_XE_OBSRV_IOCTL_INFO obsrv fd ioctl
>> >   */
>> >  struct drm_xe_oa_stream_info {
>> >	/** @extensions: Pointer to the first extension struct, if any */
>> > --
>> > 2.41.0
>> >
