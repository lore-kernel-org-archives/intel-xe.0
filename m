Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C53C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 15:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A06810E829;
	Wed,  7 May 2025 15:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTqBqB6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D1710E829
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746632454; x=1778168454;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OvR50F09CeODXHK9nOYCdJ6bT968AWv3jw6TtJwqzGk=;
 b=jTqBqB6ZbAlnWuh0HG1uc0a9WLDXE+/o3Ia3zS7LDKNLbhLKG7O8mBYs
 sozBL8oIi1i3bfHm9rsFnkHCnImp8evhVNd48fMVzAYDn35naeZ7bDKXM
 5eCuhqRad23rPwnNhdobtQvYkOkWGlb4wREr5EanjueSYySsysyZVezni
 9hnPM1CqiEuVhDqfbFMQ8sKa+sxR4pKrQyM4pjPjZ3LO6hjou53kYx0XQ
 32WI4v4rgRDLHWOTMVxlaoeUnoPlfxYD7FtDxdcrGgHrtcc552xUL/Au2
 MGLdW6asns017igs7YydBY6SAEISZsuB1IEL79YsYE39DsSm10HoNbCnv A==;
X-CSE-ConnectionGUID: uSE5CSXQRPqmkH+G1Z4jNg==
X-CSE-MsgGUID: 65D8A7hNRVeAzioyoO/3+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59000384"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="59000384"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 08:40:54 -0700
X-CSE-ConnectionGUID: ror6m6GLRYCZw0CcVTXTnA==
X-CSE-MsgGUID: 1+HLTG1qT3GmoIqdN4UKog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="136014431"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 08:40:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 08:40:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 08:40:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 08:40:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERWwJjr4MshsNZkWHI/CWLizX+pq23iDvXN69QprhptE8fxwb9FMzMXwNzu9kFK1gBpR+LT1nUWi97seUbMwKgYiSKPqtu9KD7LCnnUgxvQ3ZiiN4t/vvSVAlRSsuBbtUgG1/tZ6wa95ObRYwthcfJGEvgzrMqk3XyIoaHYmT94X+wi9+DGh0WmwfLs49A66mdLdHNx9RYlvkUBT4Y1x6vsBjpvaXptwmfbAgmvofsk3TjYvet3ry6dALhoVIcOpJZo4TRdklLA5S+TXS7RC/YAsJZKAWhU0kMCjlHDNttfe2PNM1DWoHFbRKdRDPojuaIx2F+f7o8lOz6iamSLihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Db6tTnEQsuj7F2QafCneAD+c2fqwVw6qFVmVHtYKUM=;
 b=XLgy8i9CAVlRfPxnl4+EmsH5DxvRjMgcVvQ7FBgc+QlZsITYF1dVLl6FVSSm+pPbGekRwglToj631AwIT3OVR907n0sGFRxczZohzzm4hS2V51OPcXU66r+Uv0R5w6Y/8IG09IEVysZD5tZ5oSN3fLAnLM1p/6JA+9bkzAWQdhgDGfydngtR+LRm6prQD3xdCp343Xp8VqhTjpyqcjttDNc3+wBi80Bb/WnkauU99amF3rpQ4Hue2vcPsXISAQgka+Cmb0f7XAd406n6bjtfplP9KV0tq4HvnSFpA1age5F6dRPyyNZJlZrsRs85e/UEHzrdzmROErwvCyluhpDPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 15:40:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 15:40:30 +0000
Date: Wed, 7 May 2025 08:41:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v6 2/5] drm/xe: Strict migration policy for atomic SVM
 faults
Message-ID: <aBt/QzswRYhm8wgx@lstrano-desk.jf.intel.com>
References: <20250506230132.1188732-1-matthew.brost@intel.com>
 <20250506230132.1188732-3-matthew.brost@intel.com>
 <7a7385b2d2a81961963e4df4a34ad4c55bd49bfb.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a7385b2d2a81961963e4df4a34ad4c55bd49bfb.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:303:8f::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d16cda9-dcec-47ca-b923-08dd8d7d7f5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?M7mZLkPVH0H7G/ENukpYHKsfgeA63sSTcok3Sl95WYzq7VD33jfq0MxPst?=
 =?iso-8859-1?Q?cXAoDNMKE5/PsnMo9C32rdCY37vMmUhqWylzU1YxJB5nTq+iLHXIxejTxL?=
 =?iso-8859-1?Q?fYR0qFDUUNCOyjpps9AUrKxR0Z/L0kJRYgiaEJ+0UAnzkBR8SQoS/6ukh7?=
 =?iso-8859-1?Q?dWJYdnPGFZfxDBXHitVsYK8qcYYLUuc4CriDWI6zWIfFORbRjwJAN1jvqQ?=
 =?iso-8859-1?Q?IsoD4hUYc0mgc0ASxUF3O0dR0ava132B9nludrVuGFkLPIs9lG6pg6CS8G?=
 =?iso-8859-1?Q?mz7UkZc3biDx91BLCIUB5o/n+W7o8FcvfVKuPNgUswBcmfPMiAlcSC7hJu?=
 =?iso-8859-1?Q?Zd4i8hpw7G+a7WdUJaxibhv+dc2LiHQtJpGOgVwicIOxl993DnTG8iPaHm?=
 =?iso-8859-1?Q?S6zHajxX++ajMEbaa5ZmbPNOa3WYzAaZb9A/O5doBxX1oJxFxejyCEPojm?=
 =?iso-8859-1?Q?r8oIfWLh7xErc6UHgm2FhCo4oeLb1hC7mGFBwoElsbaclAYhzC35Gx5wxB?=
 =?iso-8859-1?Q?MXZplHpIElR3Vl8sb/VY8t14p0zyK7u7nWE6vIatiecPOHWPtqoTcTm8V0?=
 =?iso-8859-1?Q?v2yZx9zA09cAGeBd3jBqpP7smePIUM2a6GrqFhY6isJBAalE86/OhOy2ZO?=
 =?iso-8859-1?Q?idX/K14pwvxrjB3fYS9GhSzuOcnRwuDOJYR6PTUUsW+gBlLeafyephDdKr?=
 =?iso-8859-1?Q?m6//CL7oC1rXPdu/B2CefwWE2Y1aWMfIFBb7m3dkuMqDEvlpNBjgqB4IDr?=
 =?iso-8859-1?Q?gYS+PF00d8h+i3cleTrE5CRC34tfw7dy/+/0OEJYWrlO6uPH83kWnnyAVp?=
 =?iso-8859-1?Q?ZcDrd1fJRIdSmeP2WqgWc+BoY6tAsUVSiKle0l2Xrax+HlVYJ97aGvW+lE?=
 =?iso-8859-1?Q?eJbUF/rc6Kr+LxHeI+pdvwYuRBPZHnITyb4eDIfrhe/cO6ZbZhVA43gZtq?=
 =?iso-8859-1?Q?OP/A8WI5Cv/O1pSxr2jHJLmNBUFSQMXlfFwiQxvvgXX6vuKZPe9BnJoiai?=
 =?iso-8859-1?Q?1Lf3GKxONr3m3vJ+j3nvnAcKkVwVqdRRq9Jl9kASYVuVFmqbvJQpqxtjds?=
 =?iso-8859-1?Q?bOPV3ca0S8vrlHwvFBGRibXCG/Ac6zxt4YsPG78k2XJFGfdCMMthKJSP08?=
 =?iso-8859-1?Q?jbpIRelI+qLdRIFjryaMna09ffD27oCxxFiUVXtsKRwsMKIoY6EX5fWqmx?=
 =?iso-8859-1?Q?yUHbnggXCNvJ6r7u0i0x4p5yu9ZvQdpYkJZxeACLMcyGi++8rIyoceKZ1z?=
 =?iso-8859-1?Q?WG7q+CL2uqxyG+U5vaGwGKI0YG6rwkyvsB9L+bGGCnniFy8vt2vanq8iUP?=
 =?iso-8859-1?Q?D/doVVt3tnMRsFuniLhACCxPPrgRxXs3KtvBnO0NFAOdv3AESNrtUshwh1?=
 =?iso-8859-1?Q?P7hY2lo1L6vE5If2Nj5QuiRJuFmW+5IM0xf1An5yksCLfUwea46xZg+1iX?=
 =?iso-8859-1?Q?f5v5HZcNBo3fVGRQV+ojPXLGMF0lFu26h2h3PXuSdJPfINCrRjmuledCjf?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PVRbC+usT8+fGsgiLL6r7B6psa1n7ox96Q++SpBwGuTN0pKVIuZfOTK6ew?=
 =?iso-8859-1?Q?kMIb+T1N7MnFHOTp0wkgAohUQsYjY4VyFEt1RQEuy2nEXYNKLVIPQ96bXl?=
 =?iso-8859-1?Q?Aolh+aWNNZqemc/+zCAC/tu/8TI0VUFHfyp0L6t1uOq4xr67lQ9YKpnhDN?=
 =?iso-8859-1?Q?gg2qV5waSjhSHQ/mk97c4+A4p1TJ7UtG9+gl5SpftKTz1UH+bsngNpDrV5?=
 =?iso-8859-1?Q?8BTM8QnPFDSF2XXynbzjY03O19aQxh/nANMZDExlGLips7GpwxI9GgW6XZ?=
 =?iso-8859-1?Q?sIq34jGy0f3u9uaClK9QgmY04hmIVtOJXpTexmLgmvsrZzwsiDsbHpTOFB?=
 =?iso-8859-1?Q?yVkOvL3twq6qQT36QVqVpIP5EO8LWOcL56jUXvcl4F70uh5wd05oV5IQYN?=
 =?iso-8859-1?Q?oGlZw3SwiUp3YUeclqdT8doeBPNLrzZKjSI5Kfyr2KbislFsHOV2TaDMXS?=
 =?iso-8859-1?Q?wYHJiBtW1uhqow2iaWHeTaTsa+s7Z5HO++jJKOIN0kdBXM6lELUkxvXdMT?=
 =?iso-8859-1?Q?xBj5XG6bcNKPkaToJYBmAmPCmA4o9hcWb5puU7ITUtGXNsoRmVnZrakg22?=
 =?iso-8859-1?Q?2KvWsoDD/pC2a6fYqYVxjhMKXLDq2VRsDXoEUpFV2k5zpsRHKO5NlrDrEq?=
 =?iso-8859-1?Q?zIeny02KDM5OA3oG6W5uuHTbu4WK2+a+wchYu3LN9hydigP87kAm2dBsm/?=
 =?iso-8859-1?Q?Dfo24vYkEAYQxDGOBKpnqhQOcbUPTnDXFOOhYVczH/gnn1MMwQqYMV8+Gj?=
 =?iso-8859-1?Q?XuSgqaIBaCuSRG1RlTxamMUpIxIP5NusnaP5dETjKqE9rzE1cV3dgQOOXQ?=
 =?iso-8859-1?Q?SP5tI1uPApbDgHH2Z6fpEVlWhEulGY1N4vHfuly1VbIymvIKOxWvAtTnQ2?=
 =?iso-8859-1?Q?rEatRBechQ/mK+fWjBfcdyUo3Ounl3pnaW6p/rKnKrnmHMbTU1UZHqLVF4?=
 =?iso-8859-1?Q?xGaa3QILCNF0JyQQGnw9Grrxw1n1hG826AFfBMItzxj6eqXP/UV9hVHoIH?=
 =?iso-8859-1?Q?lOv5Y0h0HLmE5FripjYcyDo3BdRM4jBBNxU+L0qp0d3i0PWTmPgV9u87xn?=
 =?iso-8859-1?Q?gRPS/DNG14ItGN3J1bw6961sv0wus6uifXPuxBbSpxeR+HD4797Os5r/2n?=
 =?iso-8859-1?Q?dayT5aWs0lbfB3vF1A3zPGBoCG07vfbBgt2ArfWR25zxZhYg+nCyIgmSAw?=
 =?iso-8859-1?Q?RnksiH/0JEJmQmwiF6rM/mUouIrKp0tMaXWpaaYfcSTBBmxgUbsq7/IWvv?=
 =?iso-8859-1?Q?oTQg7U/gfGUgT0NpiKBngLwvVRj8WnzjLwuafvzu/ZChdjLkmypCwoXW8V?=
 =?iso-8859-1?Q?uXu0/x2uCjB0FoF3PJlHHn01BcdoI6CnKaqrfeGJjiiZP6oKI2nGwDv7xe?=
 =?iso-8859-1?Q?KJrfj2roriYQZVOpNrbfESrgzPqdCtAO/kCCcojMXFR16nn7K0sYQVBelQ?=
 =?iso-8859-1?Q?Qlhz05+38VjAfpZcu4+FBeiwRaDa/5E5GVrnfz4gqZpVxTLnDb2siLpN/W?=
 =?iso-8859-1?Q?xduyRc5fXbcrvETv93YcD/GZiA2MrhgB6EZEM99rWYnPkt9NhgEI5Mvt5G?=
 =?iso-8859-1?Q?/dDsScocG2tHX2t9Q5JCMW6/o0ECkaemX0+7kkLLeTvqnAZqwqZAe+TEXI?=
 =?iso-8859-1?Q?nUaVRNNSqV4luRyhsPzN1oH5MfukJQyRLHKYmIgG7iBnhDiNg5Id1vSw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d16cda9-dcec-47ca-b923-08dd8d7d7f5c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 15:40:30.5422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNizl9MYH6MMLouTL7DYOxeAaDkXHiKqSA5xx28YEa3ATRuxfzQAqn+8cbnfDwA0kK3s06EvQaLJPt2l21Odyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
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

On Wed, May 07, 2025 at 02:01:56PM +0200, Thomas Hellström wrote:
> 
> This is v7, right? (Says v6 in the subject).
> 

Yea, I somehow mismatched version in change log and patches sent.

Ok, getting a little bogged down on comments, let try fix them inline in
this reply to make sure they look good before sending next rev.

> On Tue, 2025-05-06 at 16:01 -0700, Matthew Brost wrote:
> > Mixing GPU and CPU atomics does not work unless a strict migration
> > policy of GPU atomics must be device memory. Enforce a policy of must
> > be
> > in VRAM with a retry loop of 3 attempts, if retry loop fails abort
> > fault.
> > 
> > Removing always_migrate_to_vram modparam as we now have real
> > migration
> > policy.
> > 
> > v2:
> >  - Only retry migration on atomics
> >  - Drop alway migrate modparam
> > v3:
> >  - Only set vram_only on DGFX (Himal)
> >  - Bail on get_pages failure if vram_only and retry count exceeded
> > (Himal)
> >  - s/vram_only/devmem_only
> >  - Update xe_svm_range_is_valid to accept devmem_only argument
> > v4:
> >  - Fix logic bug get_pages failure
> > v5:
> >  - Fix commit message (Himal)
> >  - Mention removing always_migrate_to_vram in commit message (Lucas)
> >  - Fix xe_svm_range_is_valid to check for devmem pages
> >  - Bail on devmem_only && !migrate_devmem (Thomas)
> > v6:
> >  - Add READ_ONCE barriers for opportunistic checks (Thomas)
> > v7:
> >  - Pair READ_ONCE with WRITE_ONCE (Thomas)
> > 
> > Fixes: 2f118c949160 ("drm/xe: Add SVM VRAM migration")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Himal Prasad Ghimiray
> > <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Acked-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/drm_gpusvm.c   |  23 +++++--
> >  drivers/gpu/drm/xe/xe_module.c |   3 -
> >  drivers/gpu/drm/xe/xe_module.h |   1 -
> >  drivers/gpu/drm/xe/xe_pt.c     |  14 ++++-
> >  drivers/gpu/drm/xe/xe_svm.c    | 109 +++++++++++++++++++++++++------
> > --
> >  drivers/gpu/drm/xe/xe_svm.h    |   5 --
> >  include/drm/drm_gpusvm.h       |  40 +++++++-----
> >  7 files changed, 138 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > b/drivers/gpu/drm/drm_gpusvm.c
> > index a58d03e6cac2..41f6616bcf76 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -1118,6 +1118,10 @@ static void
> > __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> >  	lockdep_assert_held(&gpusvm->notifier_lock);
> >  
> >  	if (range->flags.has_dma_mapping) {
> > +		struct drm_gpusvm_range_flags flags = {
> > +			.__flags = range->flags.__flags,
> > +		};
> > +
> >  		for (i = 0, j = 0; i < npages; j++) {
> >  			struct drm_pagemap_device_addr *addr =
> > &range->dma_addr[j];
> >  
> > @@ -1131,8 +1135,12 @@ static void
> > __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> >  							    dev,
> > *addr);
> >  			i += 1 << addr->order;
> >  		}
> > -		range->flags.has_devmem_pages = false;
> > -		range->flags.has_dma_mapping = false;
> > +
> > +		/* WRITE_ONCE pairs with READ_ONCE for opportunistic
> > checks */

Is this one ok? Can't really quote driver side here...

> > +		flags.has_devmem_pages = false;
> > +		flags.has_dma_mapping = false;
> > +		WRITE_ONCE(range->flags.__flags, flags.__flags);
> > +
> >  		range->dpagemap = NULL;
> >  	}
> >  }
> > @@ -1334,6 +1342,7 @@ int drm_gpusvm_range_get_pages(struct
> > drm_gpusvm *gpusvm,
> >  	int err = 0;
> >  	struct dev_pagemap *pagemap;
> >  	struct drm_pagemap *dpagemap;
> > +	struct drm_gpusvm_range_flags flags;
> >  
> >  retry:
> >  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > @@ -1378,7 +1387,8 @@ int drm_gpusvm_range_get_pages(struct
> > drm_gpusvm *gpusvm,
> >  	 */
> >  	drm_gpusvm_notifier_lock(gpusvm);
> >  
> > -	if (range->flags.unmapped) {
> > +	flags.__flags = range->flags.__flags;
> > +	if (flags.unmapped) {
> >  		drm_gpusvm_notifier_unlock(gpusvm);
> >  		err = -EFAULT;
> >  		goto err_free;
> > @@ -1474,14 +1484,17 @@ int drm_gpusvm_range_get_pages(struct
> > drm_gpusvm *gpusvm,
> >  		}
> >  		i += 1 << order;
> >  		num_dma_mapped = i;
> > -		range->flags.has_dma_mapping = true;
> > +		flags.has_dma_mapping = true;
> >  	}
> >  
> >  	if (zdd) {
> > -		range->flags.has_devmem_pages = true;
> > +		flags.has_devmem_pages = true;
> >  		range->dpagemap = dpagemap;
> >  	}
> >  
> > +	/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks
> > */

Same as above.

> > +	WRITE_ONCE(range->flags.__flags, flags.__flags);
> > +
> >  	drm_gpusvm_notifier_unlock(gpusvm);
> >  	kvfree(pfns);
> >  set_seqno:
> > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > b/drivers/gpu/drm/xe/xe_module.c
> > index 05c7d0ae6d83..1c4dfafbcd0b 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -33,9 +33,6 @@ struct xe_modparam xe_modparam = {
> >  module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size,
> > uint, 0600);
> >  MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in
> > MiB), must be power of 2");
> >  
> > -module_param_named(always_migrate_to_vram,
> > xe_modparam.always_migrate_to_vram, bool, 0444);
> > -MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on
> > GPU fault");
> > -
> >  module_param_named_unsafe(force_execlist,
> > xe_modparam.force_execlist, bool, 0444);
> >  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > b/drivers/gpu/drm/xe/xe_module.h
> > index 84339e509c80..5a3bfea8b7b4 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -12,7 +12,6 @@
> >  struct xe_modparam {
> >  	bool force_execlist;
> >  	bool probe_display;
> > -	bool always_migrate_to_vram;
> >  	u32 force_vram_bar_size;
> >  	int guc_log_level;
> >  	char *guc_firmware_path;
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index b42cf5d1b20c..b487e094178d 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -2270,11 +2270,19 @@ static void op_commit(struct xe_vm *vm,
> >  	}
> >  	case DRM_GPUVA_OP_DRIVER:
> >  	{
> > +		/* WRITE_ONCE pairs with READ_ONCE opportunistic
> > checks */
> > +

/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */

> >  		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
> > -			op->map_range.range->tile_present |=
> > BIT(tile->id);
> > -			op->map_range.range->tile_invalidated &=
> > ~BIT(tile->id);
> > +			WRITE_ONCE(op->map_range.range-
> > >tile_present,
> > +				   op->map_range.range->tile_present
> > |
> > +				   BIT(tile->id));
> > +			WRITE_ONCE(op->map_range.range-
> > >tile_invalidated,
> > +				   op->map_range.range-
> > >tile_invalidated &
> > +				   ~BIT(tile->id));
> >  		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
> > -			op->unmap_range.range->tile_present &=
> > ~BIT(tile->id);
> > +			WRITE_ONCE(op->unmap_range.range-
> > >tile_present,
> > +				   op->unmap_range.range-
> > >tile_present &
> > +				   ~BIT(tile->id));
> >  		}
> >  		break;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 890f6b2f40e9..8c0ef55cfd57 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -16,8 +16,15 @@
> >  
> 
> So what I meant in the review comments is something along
> 
> /* Advisory only check whether the range is currently backed by VRAM
> memory. */
> 
> (As said we shouldn need to look at the function implementation to
> understand that it's opportunistic).
> 
> >  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
> >  {
> > -	/* Not reliable without notifier lock */
> > -	return range->base.flags.has_devmem_pages;
> > +	/*
> > +	 * Not reliable without notifier lock, opportunistic only,
> > pairs with
> > +	 * WRITE_ONCE
> 
> So if we assume that this function should is never be called with the
> notifier lock held, we can leave that comment out, just
> 
> /* Pairs with WRITE_ONCE() in xe_pt.c */ 
> 
> 
> And similar for the other places.
> 
> Thanks,
> Thomas
> 
> > +	 */

/*
 * Advisory only check whether the range is currently backed by VRAM
 * memory, READ_ONCE pairs with WRITE_ONCE in drm_gpusvm.c
 */

> > +	struct drm_gpusvm_range_flags flags = {
> > +		.__flags = READ_ONCE(range->base.flags.__flags),
> > +	};
> > +
> > +	return flags.has_devmem_pages;
> >  }
> >  
> >  static bool xe_svm_range_has_vram_binding(struct xe_svm_range
> > *range)
> > @@ -650,9 +657,16 @@ void xe_svm_fini(struct xe_vm *vm)
> >  }
> >  
> >  static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> > -				  struct xe_tile *tile)
> > +				  struct xe_tile *tile,
> > +				  bool devmem_only)
> >  {
> > -	return (range->tile_present & ~range->tile_invalidated) &
> > BIT(tile->id);
> > +	/*
> > +	 * Not reliable without notifier lock, opportunistic only,
> > pairs with
> > +	 * WRITE_ONCE
> > +	 */

/*
 * Advisory only check whether the range currently has a valid mapping,
 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
 */

> > +	return ((READ_ONCE(range->tile_present) &
> > +		 ~READ_ONCE(range->tile_invalidated)) & BIT(tile-
> > >id)) &&
> > +		(!devmem_only || xe_svm_range_in_vram(range));
> >  }
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > @@ -726,6 +740,36 @@ static int xe_svm_alloc_vram(struct xe_vm *vm,
> > struct xe_tile *tile,
> >  }
> >  #endif
> >  
> > +static bool supports_4K_migration(struct xe_device *xe)
> > +{
> > +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range
> > *range,
> > +					       struct xe_vma *vma)
> > +{
> > +	struct xe_vm *vm = range_to_vm(&range->base);
> > +	u64 range_size = xe_svm_range_size(range);
> > +
> > +	if (!range->base.flags.migrate_devmem)
> > +		return false;
> > +
> > +	/* Not reliable without notifier lock, opportunistic only */

Drop this one as xe_svm_range_in_vram has a comment.

Matt

> > +	if (xe_svm_range_in_vram(range)) {
> > +		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
> > +		return false;
> > +	}
> > +
> > +	if (range_size <= SZ_64K && !supports_4K_migration(vm->xe))
> > {
> > +		drm_dbg(&vm->xe->drm, "Platform doesn't support
> > SZ_4K range migration\n");
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> >  
> >  /**
> >   * xe_svm_handle_pagefault() - SVM handle page fault
> > @@ -750,12 +794,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> >  		.check_pages_threshold = IS_DGFX(vm->xe) &&
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> > SZ_64K : 0,
> > +		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> > +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> >  	};
> >  	struct xe_svm_range *range;
> >  	struct drm_gpusvm_range *r;
> >  	struct drm_exec exec;
> >  	struct dma_fence *fence;
> >  	struct xe_tile *tile = gt_to_tile(gt);
> > +	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> >  	ktime_t end = 0;
> >  	int err;
> >  
> > @@ -776,24 +823,30 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	if (IS_ERR(r))
> >  		return PTR_ERR(r);
> >  
> > +	if (ctx.devmem_only && !r->flags.migrate_devmem)
> > +		return -EACCES;
> > +
> >  	range = to_xe_range(r);
> > -	if (xe_svm_range_is_valid(range, tile))
> > +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
> >  		return 0;
> >  
> >  	range_debug(range, "PAGE FAULT");
> >  
> > -	/* XXX: Add migration policy, for now migrate range once */
> > -	if (!range->skip_migrate && range->base.flags.migrate_devmem
> > &&
> > -	    xe_svm_range_size(range) >= SZ_64K) {
> > -		range->skip_migrate = true;
> > -
> > +	if (--migrate_try_count >= 0 &&
> > +	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
> >  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
> >  		if (err) {
> > -			drm_dbg(&vm->xe->drm,
> > -				"VRAM allocation failed, falling
> > back to "
> > -				"retrying fault, asid=%u,
> > errno=%pe\n",
> > -				vm->usm.asid, ERR_PTR(err));
> > -			goto retry;
> > +			if (migrate_try_count || !ctx.devmem_only) {
> > +				drm_dbg(&vm->xe->drm,
> > +					"VRAM allocation failed,
> > falling back to retrying fault, asid=%u, errno=%pe\n",
> > +					vm->usm.asid, ERR_PTR(err));
> > +				goto retry;
> > +			} else {
> > +				drm_err(&vm->xe->drm,
> > +					"VRAM allocation failed,
> > retry count exceeded, asid=%u, errno=%pe\n",
> > +					vm->usm.asid, ERR_PTR(err));
> > +				return err;
> > +			}
> >  		}
> >  	}
> >  
> > @@ -801,15 +854,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> >  	/* Corner where CPU mappings have changed */
> >  	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> > -		if (err == -EOPNOTSUPP) {
> > -			range_debug(range, "PAGE FAULT - EVICT
> > PAGES");
> > -			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> > &range->base);
> > +		if (migrate_try_count > 0 || !ctx.devmem_only) {
> > +			if (err == -EOPNOTSUPP) {
> > +				range_debug(range, "PAGE FAULT -
> > EVICT PAGES");
> > +				drm_gpusvm_range_evict(&vm-
> > >svm.gpusvm,
> > +						       &range-
> > >base);
> > +			}
> > +			drm_dbg(&vm->xe->drm,
> > +				"Get pages failed, falling back to
> > retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> > +				vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > +			range_debug(range, "PAGE FAULT - RETRY
> > PAGES");
> > +			goto retry;
> > +		} else {
> > +			drm_err(&vm->xe->drm,
> > +				"Get pages failed, retry count
> > exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
> > +				vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> >  		}
> > -		drm_dbg(&vm->xe->drm,
> > -			"Get pages failed, falling back to retrying,
> > asid=%u, gpusvm=%p, errno=%pe\n",
> > -			vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > -		range_debug(range, "PAGE FAULT - RETRY PAGES");
> > -		goto retry;
> >  	}
> >  	if (err) {
> >  		range_debug(range, "PAGE FAULT - FAIL PAGE
> > COLLECT");
> > @@ -843,9 +903,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	}
> >  	drm_exec_fini(&exec);
> >  
> > -	if (xe_modparam.always_migrate_to_vram)
> > -		range->skip_migrate = false;
> > -
> >  	dma_fence_wait(fence, false);
> >  	dma_fence_put(fence);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 3d441eb1f7ea..0e1f376a7471 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -39,11 +39,6 @@ struct xe_svm_range {
> >  	 * range. Protected by GPU SVM notifier lock.
> >  	 */
> >  	u8 tile_invalidated;
> > -	/**
> > -	 * @skip_migrate: Skip migration to VRAM, protected by GPU
> > fault handler
> > -	 * locking.
> > -	 */
> > -	u8 skip_migrate	:1;
> >  };
> >  
> >  /**
> > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > index 9fd25fc880a4..653d48dbe1c1 100644
> > --- a/include/drm/drm_gpusvm.h
> > +++ b/include/drm/drm_gpusvm.h
> > @@ -185,6 +185,31 @@ struct drm_gpusvm_notifier {
> >  	} flags;
> >  };
> >  
> > +/**
> > + * struct drm_gpusvm_range_flags - Structure representing a GPU SVM
> > range flags
> > + *
> > + * @migrate_devmem: Flag indicating whether the range can be
> > migrated to device memory
> > + * @unmapped: Flag indicating if the range has been unmapped
> > + * @partial_unmap: Flag indicating if the range has been partially
> > unmapped
> > + * @has_devmem_pages: Flag indicating if the range has devmem pages
> > + * @has_dma_mapping: Flag indicating if the range has a DMA mapping
> > + * @__flags: Flags for range in u16 form (used for READ_ONCE)
> > + */
> > +struct drm_gpusvm_range_flags {
> > +	union {
> > +		struct {
> > +			/* All flags below must be set upon creation
> > */
> > +			u16 migrate_devmem : 1;
> > +			/* All flags below must be set / cleared
> > under notifier lock */
> > +			u16 unmapped : 1;
> > +			u16 partial_unmap : 1;
> > +			u16 has_devmem_pages : 1;
> > +			u16 has_dma_mapping : 1;
> > +		};
> > +		u16 __flags;
> > +	};
> > +};
> > +
> >  /**
> >   * struct drm_gpusvm_range - Structure representing a GPU SVM range
> >   *
> > @@ -198,11 +223,6 @@ struct drm_gpusvm_notifier {
> >   * @dpagemap: The struct drm_pagemap of the device pages we're dma-
> > mapping.
> >   *            Note this is assuming only one drm_pagemap per range
> > is allowed.
> >   * @flags: Flags for range
> > - * @flags.migrate_devmem: Flag indicating whether the range can be
> > migrated to device memory
> > - * @flags.unmapped: Flag indicating if the range has been unmapped
> > - * @flags.partial_unmap: Flag indicating if the range has been
> > partially unmapped
> > - * @flags.has_devmem_pages: Flag indicating if the range has devmem
> > pages
> > - * @flags.has_dma_mapping: Flag indicating if the range has a DMA
> > mapping
> >   *
> >   * This structure represents a GPU SVM range used for tracking
> > memory ranges
> >   * mapped in a DRM device.
> > @@ -216,15 +236,7 @@ struct drm_gpusvm_range {
> >  	unsigned long notifier_seq;
> >  	struct drm_pagemap_device_addr *dma_addr;
> >  	struct drm_pagemap *dpagemap;
> > -	struct {
> > -		/* All flags below must be set upon creation */
> > -		u16 migrate_devmem : 1;
> > -		/* All flags below must be set / cleared under
> > notifier lock */
> > -		u16 unmapped : 1;
> > -		u16 partial_unmap : 1;
> > -		u16 has_devmem_pages : 1;
> > -		u16 has_dma_mapping : 1;
> > -	} flags;
> > +	struct drm_gpusvm_range_flags flags;
> >  };
> >  
> >  /**
> 
