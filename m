Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAA8CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 21:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6504D10E2F9;
	Wed, 10 Apr 2024 21:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjCkW2Ui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F29710E2F9
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 21:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712785422; x=1744321422;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xugTGWVl3/8NhkwUeg4uCV/EtXR2b8ja+3GCJ/xuVII=;
 b=YjCkW2UiiDqinaBNbJFxfPNp0jfzkEEWnynO5oG22DG1maEQGO2O9RmZ
 /iYhyrJdMzO6qm7W0JEqQplOMn5Yo3tbpBArRXpRwuX6MW90jZgkACXOk
 GXuKlB807Ds2LEdvH65WyPTKi66ujBFtL//4hIzd9LED368JN1fHlo77I
 fdg6+vORReUymeXFSH3BRSAEXiREVEPb+lqcdvmhZtfXnzwoYBiebZuju
 IpwpNIJ33rHkZFKhvRsAIe0AyTl9WnV81Edy8/CnsAN1qLR1lpgEg8lMM
 eSicIw/Skd4AHqzMIGJvtNtls+GOrCNf+cN7Yu3bF2UYSK4njrMfF/wCT w==;
X-CSE-ConnectionGUID: x+0AK422QIWgVufiS1QoMA==
X-CSE-MsgGUID: 2z2DXufvQoSmAJ+OW0cE1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="30659484"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="30659484"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 14:43:42 -0700
X-CSE-ConnectionGUID: 1Wx8eJzZTIqWk1qmF+nx9Q==
X-CSE-MsgGUID: n8smWP+iTMSdfLjoeNsaDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="58117737"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 14:43:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:43:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:43:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 14:43:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 14:43:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1SfMk6ZkWo+XsBvk+2d7JSGrvoXuNAH1fer4dgghinH4GgSFkWiXOCqoNsS2G/jSBhE1kmuM7m7MJda5zkBqiX1SoveEy7nUapQBQu8sifXxCdASoUTQIop1+LprI0RPo+/KvgKYNuWe705+4L0L7ehzrbLXnB9o30FPAl4WyzttDgcPF3UjNbSOs5AZRY/OM7mdirvnruEnJUfECh9gRQDVOdeATepbCY65a2Ng18hodWtG/cqZf5T68hrx9tOEVunkEoZ6VoudTcxUCD7uPppwyxR0SdbhM5KH8RTO604skQrFIGq16VJjveIJnjcrkUrIwIj6ZUrj28SHdTtxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz8wAH26uFgMiYF0mo+ia5Qi7ipNBwLLK2M1Pq8LX34=;
 b=F5OYzCPpZ/G37PM0A8MLor3K+8nha9WBM1m4KBXuktAZr6K3hwXAda+8cCQ98ICDrEyKmUgzCqlTd6VOQ2oMmypgTVAb48nF99HVnG10TVhxzoukJsP0Z48mjKOg8PUNHYJ40PQ6nH47kJEOspEZ7js17oq9eWlZQVQDl8gMUykk2T4TzXva7Np1mqoQUOjGyXaxY3QfuXQ5vynuFOGumXFAFLLkmBwIMoUDoD3bDSljcROQSuz5UzO4jCYCf9Sw9vNLJqsAlmg1XvmSUpZQUpBcIFKb3GK7XY1e0roBi1HBROK36USwzMfDuGv+V7XpDF4wJVW44Ry8Ns2mKz+ZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6805.namprd11.prod.outlook.com (2603:10b6:806:24c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 10 Apr
 2024 21:43:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 21:43:39 +0000
Date: Wed, 10 Apr 2024 21:42:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 17/31] drm/xe: Get xe_vma from xe_userptr
Message-ID: <ZhcHyLF29KZWztTO@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-18-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409201742.3042626-18-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6805:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TMO1DmZWkXGfON8GEXo8QF5vEfT9LDfgQkP5kAer9HanbeqyGkrIT5DYpL4wPy3e8cuzsSgBGkycvpDpKdx6kEnW3BsO7jAJUb1WH3g7TOkk2GGZkkW2oHpFXRKBDYbb42/7dnorxLXLTuJ9LR2520npQPquQnQnxCHC+l7jO53HonBZlaDlOCz8RKnKBZOfsjV/zKn3Qgbwfb4m4vT44dIZvEFoUEtjlUj2omOTn4ZSQ1N175VeN2XS3YT/F+nC6/cg7L/iP6mRu/N61IekOZe6mPlMr0rc+wEvq/KKK302k0Ph4MJskIVFJz/QsA7DpaIaY17sUznY60Sqdf5I3kvzhFj8F9zHDplIsWlp3fv3///NDqQ7PVncVkds9/fdrHWClC8sLqFBz7JEr/Yo26U4W5WLUoaND+WaTgCjEQTEoRDj0dXlfQJnNrryqdxTS8IwIde32EA+CcGYmLjbb/jjW/2CBX+zyBlbkPKLBXnnDSr3ylVIrNWSqIcJXj5mpKkMJz10Im71cgTNRF8vYmluXS9C7oiRwYeyDEyLNR1XEfqZt1HUKXnke5Mv05rmfkKXnK4Ke7UB1EOBgf6ljAhuPKtymCO+Ee1Qem+SrnLQ2noAXlf1t5AA2/0ac10no/a9TACdjsLASy/7kbaWQs4s78R1I+UYkchh+Jq6spM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0iUB1fE9uu/gexT6smv9vDGbPoWxPLagr1BmSWNv2VdXHzBAO+eWagBKyKUH?=
 =?us-ascii?Q?AgGbdnaNo3gB+DRVXdbBtmvzW4yecDeYhJ8hEJLj5iGY6VppkfzZSIcel379?=
 =?us-ascii?Q?Vf43KRD48lFAEwWq9VcezFAunj5VOk3cSFH841FHS97LPYrN1/w2hwr4fARe?=
 =?us-ascii?Q?wY6nVA5CpjhcqrvJlEv0YKo29NOZ6ZKMYcnTJNtCkd/F3OjXosH2CgsgLx6I?=
 =?us-ascii?Q?wLF6eZ/av5jm6Y565LiLtPGkx8juTcIoji7y5uf4uy6RXiObb7l87O1awZ51?=
 =?us-ascii?Q?wg8dlfVeog1PxkLLJkrm8unqyeSAZMdldJt9e1Awz/LWLnaW5J4YpFawl0Fa?=
 =?us-ascii?Q?SEzjGRwhkFtsnfPQHXD4CQh0Jl9gMsmO/zTxK5z8BQj6s4IJpaNuc/nc5ohc?=
 =?us-ascii?Q?8Gw3CZW+fSbibtqhdz+h5dkmX0EGZ5bls/3IbD2oz6KUnOwljx7Kh0DLQaPL?=
 =?us-ascii?Q?YqM+uSKhfec26LYPFB+Jw9i/UVk69ojBFYwNJIYU25brnySocwntzfdq4ejr?=
 =?us-ascii?Q?ZrJirFn+G3nmypJUPxUL/nLL9oWi7+CSLeJE9puFO5p9JHCbS48t1lnURA0x?=
 =?us-ascii?Q?QtlyFAM4ceHsp/ixt68aya4DjD/hHoUOhyiWp4jegNRBzXG6WtRFNswYjfjG?=
 =?us-ascii?Q?2yu0FP48jkZxJeERo5mopbxjonOg5g4BFSY8q/qYMiYiaaP4160+rFLMX4jp?=
 =?us-ascii?Q?XEXrhlP+D7A95hc+gRTjST0u42GBWbrIN3GOxBKDvmSxPmVOrV5Iqhw0TI3v?=
 =?us-ascii?Q?t75Pz6d3VB2+Rfb0F/ThNLD9CJ3v8x7DMAbOIS69zcTm0RvVi7bhaZSyjWW6?=
 =?us-ascii?Q?UTMgszxZCaPZzU467wzYAfy49LDlNmYt+5nEpAYTL6PdSoaU0d3zdYtLlZiJ?=
 =?us-ascii?Q?aOzlb6f34XMMyt8AxY+fYCePRfo9QHkxb5raP+4vD1lbOfJcQo/CZg1QQ0NH?=
 =?us-ascii?Q?/0bXch1cVySaDCqZBkPcQQWNy4z4cFVnzg3UbpgGY1Vkd+tFn8AD3ZMo+J8I?=
 =?us-ascii?Q?93Ue23qFCvqatf20NFj02dqDkRk5+9F5Xs9MUYJTpJaI/DWJeOux/0AWoWFT?=
 =?us-ascii?Q?jXaqbUI0Bd1WVqPUWpKf8vXg2q1x0LP9ZqHSIFwLDST8SCWlt4F2hw0XL1zP?=
 =?us-ascii?Q?oUCnNha78Uen6AGeQiXi6tW8F+cv29Rs5eCIKOmhow7o0TP1wKDFD3Kh9Q/A?=
 =?us-ascii?Q?VJwsDtbIkFYWK7LWwFpPstffJzubaF0+hlkKr2M7duY3254wQjnNn6GS6Bb1?=
 =?us-ascii?Q?x4mPLO1F6rs33mLnvAOubpvVsb8Cr2/Eq39AqQIE0DWBBiiIBDUIpW8JJhqw?=
 =?us-ascii?Q?zMd1e63FLP7gdZqm4mx9LST/SAY4rH8ILerORyrGOZEpD6afQIvuPG+VzhLj?=
 =?us-ascii?Q?7p2ILw9XPiop31K2e54zP1rwKmEA08QsNRnmrY/+zxQlLa2F/DR1mkR8kaUl?=
 =?us-ascii?Q?SniiM81GfeNakUq70X0w/gPecLgCpsCRorUFRBV3a9SIPXpVfKckeIfMlduC?=
 =?us-ascii?Q?WPbMHcfPHA5xLuc9CnvvRfQ1QCcwOps2S4/ZiwFBAY2oh6rUe3v7RG4ktVQT?=
 =?us-ascii?Q?fuqgBCuxj2L8ldjviI66HdbBl1ZiGfCNgpCvN6bNtKauYif1kit81gtkMlD9?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebd090d-094e-4409-f5f0-08dc59a7489b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:43:39.3651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfDZ6idi1F31KS44I01zdo6DifYKaKXS2Vn4SRyp+sH/i6MJ1rxpk5C3OPELGlMFIr0ebersbmcjAA2KC8M0zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6805
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

On Tue, Apr 09, 2024 at 04:17:28PM -0400, Oak Zeng wrote:
> Introduce a helper to get xe_vma from xe_userptr.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 0b2790f697db..4860747592ad 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -178,6 +178,20 @@ static inline struct xe_userptr_vma *to_userptr_vma(struct xe_vma *vma)
>  	return container_of(vma, struct xe_userptr_vma, vma);
>  }
>  
> +/**
> + * xe_userptr_to_vma() - Return xe_vma from a xe_userptr pointer
> + *
> + * @userptr: The userptr struct pointer
> + */
> +

Extra newline. Otherwise LGTM.

Matt

> +static inline struct xe_vma *xe_userptr_to_vma(struct xe_userptr *userptr)
> +{
> +	struct xe_userptr_vma *uvma;
> +
> +	uvma = container_of(userptr, struct xe_userptr_vma, userptr);
> +	return &uvma->vma;
> +}
> +
>  u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
>  
>  int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> -- 
> 2.26.3
> 
