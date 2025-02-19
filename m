Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B680DC021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 20:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670CB10E044;
	Wed, 19 Feb 2025 20:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k06tJn7U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76EB10E044
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 20:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739997958; x=1771533958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/oc1kPyB52Cp+1eozdGDN5v29z+wKOqoKXEv7/gh4/g=;
 b=k06tJn7U3b0W4qMx5TCn5AmKb4WzPCeQHcnAhAhHbOhzpxeLS036UTYv
 cN+9baD2Tufmp5uyodxCHciY1YFQaxeltemkBImIDSUCNErwDFO8FOQKW
 KXuWmJvf6oXd3430YoIQ+s/0BrYNfLZUvxMhOkJFcgUaUIDVxdEyEFOOI
 FoSJ3yfZAPZ+6zVN765Xd9B/kmXbavnOOczh4kzY7PMs8+ROs95shNakz
 NEFBoO0cwVLxswL/5ObqQAQz5CnZl2rQFqawXXfupZnf0Idd4jMt5b21L
 SOo2pjW7uEeIITPchnmZj1E0rOxv/JoIEu4/ZoS1k0m+DdqCQoY5hsW45 w==;
X-CSE-ConnectionGUID: m27LBUZBSsO7wWOVprV43g==
X-CSE-MsgGUID: 0tXwwXmsQJK/YejbZCPdjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="43584367"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="43584367"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:45:57 -0800
X-CSE-ConnectionGUID: 2QQn4PmdTaGDCxaYexfqkg==
X-CSE-MsgGUID: Z6r2+uE4SdKAyVpcQm/9ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114660294"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:45:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Feb 2025 12:45:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Feb 2025 12:45:55 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 12:45:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNxK8dAe5gSbvm/cDieEUH3Zl1/JRk7AADqp0WLVq5jHQuYM3JF8BpecI+EXPCNK03Y0Bv2mGltBK/xrVq6+Jr2GQfcga6zz9hHCxRj6M+rNfhnnN1XOlao4Y+hQ068JSdYLuWdpa4xFPKzpqtyu4n3pxz0AcKAFJYxh9dUiBwjxZDOXFfiYDrbjTurNrrrfJz3r1YDyZ2lpx1ggSFWQzB75k9NtRsrk//PqDv99295/obc8E1zLENuGVCXJDBM23s6cyCU0o8BQpp27vVwmjh+ETQKaGLmTx4Eb5AVx8VOou1tjsLdm3o6g7qGFKcs79dTfrH3+McSBvzeckRo21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFd9HMK4ja1RD/TSubtxUkS7JXhMk0D0gptJzYum4GE=;
 b=bPCQpnfeOp7TVUL24XC2uRwBTmcl1U5vnkg3ZfDPiS3aGrA1U+YBeN/jIT7o4BOeaDk7svo1vbxjZr3h+j5u5JNFq8+AUk+07x6Z1QkqhMCxziR/r6k+qD6gjIAZgEpYL1nnGz3pxNA5R/Ki8lhL1vyUWmIP/+ZxKdsLlIKlhdDyWSmKy25pUWWUMPuwLquHnU8Z98CS8ep5e1yzu4vMnVJqwja72OJi2psbp1gc+UYFo7GuSGTtAyqhhl8DnfAJSJqhG7yWY6t4xjrEvGL0azTO5YFUJGheRyp0qSAQpo+m+Hnf5uWPOm1Msy+gRfnLtTqjLreKAGNEvKd1FQSFvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 20:45:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 20:45:50 +0000
Date: Wed, 19 Feb 2025 12:46:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
Message-ID: <Z7ZDPMDz1UdFAsE7@lstrano-desk.jf.intel.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
 <20250213022331.265424-2-oak.zeng@intel.com>
 <Z7YZGEgvzjY5mjN5@lstrano-desk.jf.intel.com>
 <MN2PR11MB4728C3F81D6F795E5C08AACB92C52@MN2PR11MB4728.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MN2PR11MB4728C3F81D6F795E5C08AACB92C52@MN2PR11MB4728.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:303:2b::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: a0cb393c-cc4c-4cb3-841b-08dd51266507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FOVzOBR3fQXf9fk7IJOwAhbK60vYFXQTW7UkKyGPiwBSepU3Nnan1TGaFoY2?=
 =?us-ascii?Q?a1sZXrEnFisxLLewxYlj7NVtv4rndcxSf/lnF6QXYnhRWGGLVoWdoi/Y2izU?=
 =?us-ascii?Q?aKmyDCBDDNBRTQM1L9hs6CaWYpTMJBOBCse4tU5Dsju9cJHjzfgoKQXUnFqJ?=
 =?us-ascii?Q?TtM2kHLDPfNcWIX6R++hmyorx95XX1s6KLS6aZWGay1ja1nMtVVs+HGUoOcM?=
 =?us-ascii?Q?wHXRuIiAa87nGL+XW2e71W0v55Se0/l0GTn4nMqZ8umTTDjQMebNobDPStS9?=
 =?us-ascii?Q?0u5aGR0xtHY8dwZfTWB1bGN9pCdy/7OQ6t4Nc00kKqO4BWyG+6qbV/m/OfWo?=
 =?us-ascii?Q?FdjKBf4tuILyz2uIKwriFkaHqlH08l8mi/jJlAivBAhqj2duGFaukDR985/g?=
 =?us-ascii?Q?MHIadbR+IvoZrxpirzvTZmPY+uxbH6njn0TQtFn8L36/48/sOhZlm6La1Bzt?=
 =?us-ascii?Q?Gv8uKQVjbT8pcZg81b6IdtsAvFDKmBxOnF1JH1CmmVCTHDJew35tNIXoxAz/?=
 =?us-ascii?Q?Fwu7ucDf86jCVyqbCHHvmZF1GvtAQF24ElH+rYwKY3BkRn6eTTDuV/mIeqxh?=
 =?us-ascii?Q?dAK2TiAwD2BJqtx0JfbMdba52U5o87F4+MYR9KaUGz6CuELE9AotxPCCQtBY?=
 =?us-ascii?Q?Ae29pIAfb55c1IS+QnwdANKPCvJfX8PJr50TgZ/DHZTa+0rwHT5PXkJZI5vG?=
 =?us-ascii?Q?kOmWltaj3L8tw9YYpEk7lyZmfSIn61TJrIYqBChOgrrnFkHdoC3hMacDTl1c?=
 =?us-ascii?Q?vEf9VNwDavkwWJrq6Tgyy8LAmWWF5kdGssV6JYAbSmcxEup3uersd4qfZNkc?=
 =?us-ascii?Q?YIvtYUwxWi3OdXuo0RqbUP5yaz2QO7njZ6tjARy5KGVaNf1tvpmaCkvYRqdK?=
 =?us-ascii?Q?KNOMmP0I2pUkEv1aQOc9cAqUXN3FtflaxO4BjPO2NdJ/ycpXIdpgD909hSGj?=
 =?us-ascii?Q?TIq+CySfMk7wjm8YGEDdN4PprFKAmyr0Ft+0Y2iLqovlpDGSDt6Ijyn9T0C7?=
 =?us-ascii?Q?q5C1VAHq6LnNUoYq7sCLf8LaqnGh9icbKzkK+FbecDfxdhwVUxW2Kpz/5LAz?=
 =?us-ascii?Q?TUqRKJaj89ScHT3qfBuUh88ydxftz/zW1icAK64a28HOHGdxoXUQVySOgKqX?=
 =?us-ascii?Q?j31QQyNluuHDOzhMW+mKrlcbnwZOP9u1GzBoYqum0UaSR4swMJu5sq2mJoLH?=
 =?us-ascii?Q?+W+AJp4owgaASlmUTueVMwmq/ewWtk7mk5PF9iJkrRropDtbSTbaGwCYF4bg?=
 =?us-ascii?Q?qUKpeoZdLl2HsjTw2dUcHUCNuCcoX0Ij4/JVvLfrtYoduV3qWsNBVUlozSq3?=
 =?us-ascii?Q?4F4U7uCQgS5SHviUDyglHGhLZ/P51sr4vesMcBKZXYo8wds6omYmfgO8wfhZ?=
 =?us-ascii?Q?BsEUeCxsyOkj9kPdJ0ljMkZmWhk2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?osKj/dyO3E34xD7T+RLXMbhAM04EueevuZDTpaTz0wTrNIbE76V1F53iZVRH?=
 =?us-ascii?Q?3fir9kluqAGdHwq/GacBAjyPanuSxGehQoB69mETkP6j35UDYpKGRZhvzL6X?=
 =?us-ascii?Q?SZ56nMQXVn3/CoJ7RJSZzWr/NW/XjSOT1/r2JCUzdwkXZAFV2AnyiRNiYsQK?=
 =?us-ascii?Q?W/0V3tPm/DNfSNTQQ/Zpnog+XFyRLxsYHrVfGKmFlVGrnjaAEB8wdXFcZuYi?=
 =?us-ascii?Q?J8UGOFPTHVhK0HxT8eWgXFijcFNEsai88InyCN/vMlab2EjLB/vymAj57VHD?=
 =?us-ascii?Q?Aoxcc7zg0pNAWWzEMUdFfRfkVAseNJjn3OzR1bCgXUvA6lATa5AhZx7iGvrL?=
 =?us-ascii?Q?w45p4uBol7pi62mqCjJR4Lwa/KuymDkZP9obe33J7zqh1xqjR8ICYc1t+IdT?=
 =?us-ascii?Q?z3qLKi+cxAlUszAzxq9zKrT3S3Bckl0Np0bowc95QgTobEWpYL/hjFNzdjNt?=
 =?us-ascii?Q?uhKigHPQvAT5ONG5pG0m7gfMAFY291YI1w+s7TKFbRkOi/o3Z8ZcekuvO4Bx?=
 =?us-ascii?Q?TU2x3gV5NGS1Zg8bYG2iNc6wnetjXIZ2g3ufjT4JXGI8TsCRpz1jCyJePJOz?=
 =?us-ascii?Q?baoe9krGXsOc1o8AtYX3ZQzUAsserpXFMtjZ4tFlIGv/GiDB+ztvPSTNNkBs?=
 =?us-ascii?Q?E7Cm+FqxW6iN1NkJZNt0pr6kKfv8xssgkllyGKGjNxy6jmEfPj/2EjT8QhOh?=
 =?us-ascii?Q?PTMauLlpcuH+TH+0aoeWzkzVzkYst7a9AU32atPv3HZoLnXobgng0GkX6XQz?=
 =?us-ascii?Q?0/huqyUdCeb780kJEVY7bj4rdkHllwlRgzZGvzmcT/NXOyyeuNKhjRpRTjTv?=
 =?us-ascii?Q?exV3Cl1+pzcOT0pltIqxhlW7JjjMyQShPXa0bEDI5TFBlvMd0y9BPy/i0aQV?=
 =?us-ascii?Q?xEpPiNRCwOnD3FyGswpMPTuXRpvsuyoEpq4hssP7QADnrfd6O1KJfRqT+Ge6?=
 =?us-ascii?Q?CByvT/RfHG26AI0HVckrwyRchlHHhTSc7kji58kQFGf5md3tpIGioJ+HumSC?=
 =?us-ascii?Q?IjHsHj/XqtSF6CrmizgV6aJIJasDxXgQhGFjAqi/FKodlDuf3FoClLC1diGy?=
 =?us-ascii?Q?g8GhRwqRuxl4Em/7/ZoNU+U+8PbWoKYt5PojPzFnmeFc7e7nyU8AJbUkkH6e?=
 =?us-ascii?Q?jZBZqZuuRvY75QBnABU98SUb6jvkwIxWDOhOvR8Z+eZVuhjiqH2xa+hVzlFa?=
 =?us-ascii?Q?rltqlsoFNsPTar/z3wXE7liwsaahyf7BEP0REQXcjZSwzRSP3VJyYbRAcI5q?=
 =?us-ascii?Q?CRRGnWXVnEAocN1xmUoDiPeUdLGvqgubluZXz5RGIKCuLu1iw0APGugyHmDz?=
 =?us-ascii?Q?17BLserXEIJn2WqZ4UffyMqv+c93OFmCC7SPBCY2cTZ6QZ5g7jhnWDMsyQol?=
 =?us-ascii?Q?nE/9ifiO+X41UQqeUhRgSTstVH7qu0iE1hYT4fH32Iop8Lya6HiNCECT1zo0?=
 =?us-ascii?Q?jY7lRV4wUEEWZjlC+f/9XbOpvdDI788OMfZ7PAiyucGjS91wTeQlyEr4UFi6?=
 =?us-ascii?Q?rlyNSkY/d4Iyu4zPaF9kG1qv4R4pikaIFoYhUxRLNw29JYu4inV+wxA1tYc7?=
 =?us-ascii?Q?qVPZ9hDogqTvrwQ0l+xG9NsioiVfPDMeQKksROZfLAraIvT1bmaPRXVmly4p?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0cb393c-cc4c-4cb3-841b-08dd51266507
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 20:45:50.4172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSAuXLbRG9J9wgMutWoQ0oO2vso7//o92DY5jRinq7R2NAZTUexouBoaLXkp7qkYtGoUs8qaYJAjUSRCMl4+dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
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

On Wed, Feb 19, 2025 at 01:19:10PM -0700, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: February 19, 2025 12:47 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org;
> > Thomas.Hellstrom@linux.intel.com; Cavitt, Jonathan
> > <jonathan.cavitt@intel.com>
> > Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
> > 
> > On Wed, Feb 12, 2025 at 09:23:30PM -0500, Oak Zeng wrote:
> > > When a vm runs under fault mode, if scratch page is enabled, we
> > need
> > > to clear the scratch page mapping on vm_bind for the vm_bind
> > address
> > > range. Under fault mode, we depend on recoverable page fault to
> > > establish mapping in page table. If scratch page is not cleared, GPU
> > > access of address won't cause page fault because it always hits the
> > > existing scratch page mapping.
> > >
> > > When vm_bind with IMMEDIATE flag, there is no need of clearing as
> > > immediate bind can overwrite the scratch page mapping.
> > >
> > > So far only is xe2 and xe3 products are allowed to enable scratch
> > page
> > > under fault mode. On other platform we don't allow scratch page
> > under
> > > fault mode, so no need of such clearing.
> > >
> > > v2: Rework vm_bind pipeline to clear scratch page mapping. This is
> > similar
> > > to a map operation, with the exception that PTEs are cleared
> > instead of
> > > pointing to valid physical pages. (Matt, Thomas)
> > >
> > > TLB invalidation is needed after clear scratch page mapping as larger
> > > scratch page mapping could be backed by physical page and cached
> > in
> > > TLB. (Matt, Thomas)
> > >
> > > v3: Fix the case of clearing huge pte (Thomas)
> > >
> > > Improve commit message (Thomas)
> > >
> > > v4: TLB invalidation on all LR cases, not only the clear on bind
> > > cases (Thomas)
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pt.c       | 53
> > ++++++++++++++++++++++++--------
> > >  drivers/gpu/drm/xe/xe_pt_types.h |  2 ++
> > >  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++++---
> > >  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
> > >  4 files changed, 70 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > > index 1ddcc7e79a93..319769056893 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
> > >  	 * granularity.
> > >  	 */
> > >  	bool needs_64K;
> > > +	/* @clear_pt: clear page table entries during the bind walk */
> > > +	bool clear_pt;
> > >  	/**
> > >  	 * @vma: VMA being mapped
> > >  	 */
> > > @@ -415,6 +417,10 @@ static bool xe_pt_hugepte_possible(u64
> > addr, u64 next, unsigned int level,
> > >  	if (xe_vma_is_null(xe_walk->vma))
> > >  		return true;
> > >
> > > +	/* if we are clearing page table, no dma addresses*/
> > > +	if (xe_walk->clear_pt)
> > > +		return true;
> > > +
> > >  	/* Is the DMA address huge PTE size aligned? */
> > >  	size = next - addr;
> > >  	dma = addr - xe_walk->va_curs_start +
> > xe_res_dma(xe_walk->curs);
> > > @@ -497,16 +503,19 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > *parent, pgoff_t offset,
> > >
> > >  		XE_WARN_ON(xe_walk->va_curs_start != addr);
> > >
> > > -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> > > -						 xe_res_dma(curs) +
> > xe_walk->dma_offset,
> > > -						 xe_walk->vma,
> > pat_index, level);
> > > +		pte = vm->pt_ops->pte_encode_vma(is_null ||
> > xe_walk->clear_pt ?
> > > +				0 : xe_res_dma(curs) + xe_walk-
> > >dma_offset,
> > > +				xe_walk->vma, pat_index, level);
> > >  		pte |= xe_walk->default_pte;
> > >
> > > +		if (xe_walk->clear_pt)
> > > +			pte = 0;
> > 
> > Is there a way to move this clear to later in the pipeline? e.g. At the
> > step which actually programs the page tables via a GPU job or the CPU?
> 
> Isn't the design here generate all the page table entries in this stage_bind stage,
> And actual programming of page table using cpu/gpu just focus on writing the
> Page table entries to the actual page table? From this perspective, it is more
> Natural to set the entries to 0 here for clear_pt case.
> 

Yes, but for userptr an invalidation can occur *after* the stage_bind step.

> Of cause you can do it later, but it is at the cost of sacrifice the design.
> 
> 
> > I
> > ask as I think our userptr code is broken for invalidations which could
> > hook into clearing to fix this. 
> 
> Can you elaborate how the userptr invalidation is broken? Is it broken by this patch?

The existing code is broken. One option being discussed to fix this is
convert a bind to an invalidation at the very last stage of the bind.
Checking here to see if this viable. Hopefully Thomas and I agree on a
plan in the next day or so.

> I don't follow here. As I understand it, the userptr invalidation doesn't go to this 
> Stage_bind function. It goes to xe_pt_zap_ptes. So I don't follow how userptr invalidate
> Is broken...
>

It is about if you have large array of binds and single userptr is
invalidated between xe_userptr_pin rather than restart the entire array
of bind just convert the single bind to an invalidation and fixup pages
in the rebind worker, exec, or page fault. The code tries to do this but
it is wrong from security standpoint and may have a possible UAF.

Anyways let me get back to you once we figure out the direction we want
to go to fix this - we may land on just restart the entire array of
binds when this occurs making my comment here irrelevant.

Matt

> Oak  
> 
> 
> Also I think prefetch for SVM could also
> > make use of this too.
> > 
> > I believe for this use case this patch is correct though.
> > 
> > Matt
> > 
> > > +
> > >  		/*
> > >  		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> > >  		 * this device *requires* 64K PTE size for VRAM, fail.
> > >  		 */
> > > -		if (level == 0 && !xe_parent->is_compact) {
> > > +		if (level == 0 && !xe_parent->is_compact
> > && !xe_walk->clear_pt) {
> > >  			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
> > {
> > >  				xe_walk->vma->gpuva.flags |=
> > XE_VMA_PTE_64K;
> > >  				pte |= XE_PTE_PS64;
> > > @@ -519,7 +528,7 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > *parent, pgoff_t offset,
> > >  		if (unlikely(ret))
> > >  			return ret;
> > >
> > > -		if (!is_null)
> > > +		if (!is_null && !xe_walk->clear_pt)
> > >  			xe_res_next(curs, next - addr);
> > >  		xe_walk->va_curs_start = next;
> > >  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K <<
> > level);
> > > @@ -589,6 +598,7 @@ static const struct xe_pt_walk_ops
> > xe_pt_stage_bind_ops = {
> > >   * @vma: The vma indicating the address range.
> > >   * @entries: Storage for the update entries used for connecting the
> > tree to
> > >   * the main tree at commit time.
> > > + * @clear_pt: Clear the page table entries.
> > >   * @num_entries: On output contains the number of @entries
> > used.
> > >   *
> > >   * This function builds a disconnected page-table tree for a given
> > address
> > > @@ -602,7 +612,8 @@ static const struct xe_pt_walk_ops
> > xe_pt_stage_bind_ops = {
> > >   */
> > >  static int
> > >  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> > > -		 struct xe_vm_pgtable_update *entries, u32
> > *num_entries)
> > > +		 struct xe_vm_pgtable_update *entries,
> > > +		 bool clear_pt, u32 *num_entries)
> > >  {
> > >  	struct xe_device *xe = tile_to_xe(tile);
> > >  	struct xe_bo *bo = xe_vma_bo(vma);
> > > @@ -622,10 +633,19 @@ xe_pt_stage_bind(struct xe_tile *tile,
> > struct xe_vma *vma,
> > >  		.vma = vma,
> > >  		.wupd.entries = entries,
> > >  		.needs_64K = (xe_vma_vm(vma)->flags &
> > XE_VM_FLAG_64K) && is_devmem,
> > > +		.clear_pt = clear_pt,
> > >  	};
> > >  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > >  	int ret;
> > >
> > > +	if (clear_pt) {
> > > +		ret = xe_pt_walk_range(&pt->base, pt->level,
> > xe_vma_start(vma),
> > > +				       xe_vma_end(vma),
> > &xe_walk.base);
> > > +
> > > +		*num_entries = xe_walk.wupd.num_used_entries;
> > > +		return ret;
> > > +	}
> > > +
> > >  	/**
> > >  	 * Default atomic expectations for different allocation
> > scenarios are as follows:
> > >  	 *
> > > @@ -981,12 +1001,14 @@ static void xe_pt_free_bind(struct
> > xe_vm_pgtable_update *entries,
> > >
> > >  static int
> > >  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> > > -		   struct xe_vm_pgtable_update *entries, u32
> > *num_entries)
> > > +		   struct xe_vm_pgtable_update *entries,
> > > +		   bool invalidate_on_bind, u32 *num_entries)
> > >  {
> > >  	int err;
> > >
> > >  	*num_entries = 0;
> > > -	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> > > +	err = xe_pt_stage_bind(tile, vma, entries, invalidate_on_bind,
> > > +			       num_entries);
> > >  	if (!err)
> > >  		xe_tile_assert(tile, *num_entries);
> > >
> > > @@ -1661,6 +1683,7 @@ static int bind_op_prepare(struct xe_vm
> > *vm, struct xe_tile *tile,
> > >  		return err;
> > >
> > >  	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> > > +				 pt_update_ops->invalidate_on_bind,
> > >  				 &pt_op->num_entries);
> > >  	if (!err) {
> > >  		xe_tile_assert(tile, pt_op->num_entries <=
> > > @@ -1681,11 +1704,11 @@ static int bind_op_prepare(struct
> > xe_vm *vm, struct xe_tile *tile,
> > >  		 * If !rebind, and scratch enabled VMs, there is a
> > chance the scratch
> > >  		 * PTE is already cached in the TLB so it needs to be
> > invalidated.
> > >  		 * On !LR VMs this is done in the ring ops preceding a
> > batch, but on
> > > -		 * non-faulting LR, in particular on user-space batch
> > buffer chaining,
> > > -		 * it needs to be done here.
> > > +		 * LR, in particular on user-space batch buffer chaining,
> > it needs to
> > > +		 * be done here.
> > >  		 */
> > >  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> > > -		     xe_vm_in_preempt_fence_mode(vm)))
> > > +		     xe_vm_in_lr_mode(vm)))
> > >  			pt_update_ops->needs_invalidation = true;
> > >  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
> > >  			/* We bump also if batch_invalidate_tlb is
> > true */
> > > @@ -1759,9 +1782,13 @@ static int op_prepare(struct xe_vm *vm,
> > >
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		if (!op->map.immediate &&
> > xe_vm_in_fault_mode(vm))
> > > +		if (!op->map.immediate &&
> > xe_vm_in_fault_mode(vm) &&
> > > +		    !op->map.invalidate_on_bind)
> > >  			break;
> > >
> > > +		if (op->map.invalidate_on_bind)
> > > +			pt_update_ops->invalidate_on_bind = true;
> > > +
> > >  		err = bind_op_prepare(vm, tile, pt_update_ops, op-
> > >map.vma);
> > >  		pt_update_ops->wait_vm_kernel = true;
> > >  		break;
> > > @@ -1871,6 +1898,8 @@ static void bind_op_commit(struct xe_vm
> > *vm, struct xe_tile *tile,
> > >  	}
> > >  	vma->tile_present |= BIT(tile->id);
> > >  	vma->tile_staged &= ~BIT(tile->id);
> > > +	if (pt_update_ops->invalidate_on_bind)
> > > +		vma->tile_invalidated |= BIT(tile->id);
> > >  	if (xe_vma_is_userptr(vma)) {
> > >  		lockdep_assert_held_read(&vm-
> > >userptr.notifier_lock);
> > >  		to_userptr_vma(vma)->userptr.initial_bind = true;
> > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > index 384cc04de719..3d0aa2a5102e 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > @@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
> > >  	bool needs_userptr_lock;
> > >  	/** @needs_invalidation: Needs invalidation */
> > >  	bool needs_invalidation;
> > > +	/** @invalidate_on_bind: Invalidate the range before bind */
> > > +	bool invalidate_on_bind;
> > >  	/**
> > >  	 * @wait_vm_bookkeep: PT operations need to wait until VM
> > is idle
> > >  	 * (bookkeep dma-resv slots are idle) and stage all future VM
> > activity
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > > index d664f2e418b2..813d893d9b63 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1921,6 +1921,23 @@ static void print_op(struct xe_device *xe,
> > struct drm_gpuva_op *op)
> > >  }
> > >  #endif
> > >
> > > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm
> > *vm, u32 bind_flags)
> > > +{
> > > +	if (!xe_vm_in_fault_mode(vm))
> > > +		return false;
> > > +
> > > +	if (!NEEDS_SCRATCH(vm->xe))
> > > +		return false;
> > > +
> > > +	if (!xe_vm_has_scratch(vm))
> > > +		return false;
> > > +
> > > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > >  /*
> > >   * Create operations list from IOCTL arguments, setup operations
> > fields so parse
> > >   * and commit steps are decoupled from IOCTL arguments. This
> > step can fail.
> > > @@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct xe_vm
> > *vm, struct xe_bo *bo,
> > >  			op->map.is_null = flags &
> > DRM_XE_VM_BIND_FLAG_NULL;
> > >  			op->map.dumpable = flags &
> > DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > >  			op->map.pat_index = pat_index;
> > > +			op->map.invalidate_on_bind =
> > > +
> > 	__xe_vm_needs_clear_scratch_pages(vm, flags);
> > >  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> > >  			op->prefetch.region = prefetch_region;
> > >  		}
> > > @@ -2188,7 +2207,8 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> > >  				return PTR_ERR(vma);
> > >
> > >  			op->map.vma = vma;
> > > -			if (op->map.immediate
> > || !xe_vm_in_fault_mode(vm))
> > > +			if (op->map.immediate
> > || !xe_vm_in_fault_mode(vm) ||
> > > +			    op->map.invalidate_on_bind)
> > >
> > 	xe_vma_ops_incr_pt_update_ops(vops,
> > >  							      op-
> > >tile_mask);
> > >  			break;
> > > @@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct
> > drm_exec *exec, struct xe_vm *vm,
> > >
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		err = vma_lock_and_validate(exec, op->map.vma,
> > > -					    !xe_vm_in_fault_mode(vm)
> > ||
> > > -					    op->map.immediate);
> > > +		if (!op->map.invalidate_on_bind)
> > > +			err = vma_lock_and_validate(exec, op-
> > >map.vma,
> > > +
> > 	    !xe_vm_in_fault_mode(vm) ||
> > > +						    op-
> > >map.immediate);
> > >  		break;
> > >  	case DRM_GPUVA_OP_REMAP:
> > >  		err = check_ufence(gpuva_to_vma(op-
> > >base.remap.unmap->va));
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 52467b9b5348..dace04f4ea5e 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -297,6 +297,8 @@ struct xe_vma_op_map {
> > >  	bool is_null;
> > >  	/** @dumpable: whether BO is dumped on GPU hang */
> > >  	bool dumpable;
> > > +	/** @invalidate: invalidate the VMA before bind */
> > > +	bool invalidate_on_bind;
> > >  	/** @pat_index: The pat index to use for this operation. */
> > >  	u16 pat_index;
> > >  };
> > > --
> > > 2.26.3
> > >
