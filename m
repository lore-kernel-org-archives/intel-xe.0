Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CD5C02198
	for <intel-xe@archiver.kernel.org>; Sat, 15 Feb 2025 01:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B12C10E4AF;
	Sat, 15 Feb 2025 01:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJM2hfA5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE27210E4AF
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Feb 2025 01:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739582884; x=1771118884;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tiocrXWuahCMNklKjZQtuiAzuB+N25jMlROuIarOGB8=;
 b=eJM2hfA5lZK8iBunshdkMJZLENoaF5m7cVS5js76MiL5KV6WyHFjqrnH
 RV1K94X7inUdU/L4/wVIjQnLBKFIbvkiO/ulF6LprTTZyhrzfZld0K0p0
 LcorifU9om/G6v9nUS8ak2HxAEBbkiIduH4P9bGcRru8qwyC34y/ZIJG2
 WuUm/Kh91373QNsPtG1occ/Z/EtZrw2S2JYDLyRoG3vthq6+WQ/WlNaAt
 0nVXTfPK0m262yxbEg9p9LF13LTPYkc6alzVvPRThnFRz/kT88MyJUR9E
 dTdwW+QRhOXurDnm+rv2CxssPgjXa3MXbbm6IEcikhGTSbcb420lBVban w==;
X-CSE-ConnectionGUID: EAtvL8fbRz+vsQs5n/ni3g==
X-CSE-MsgGUID: a1L4wq4BTWGVHdF/f+ws5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="51758490"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="51758490"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:28:03 -0800
X-CSE-ConnectionGUID: WdmDSC37SKyPsm3nPktNPA==
X-CSE-MsgGUID: FjxJLE8bQKq+N/ny6yHloQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144524540"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:28:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 17:28:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 17:28:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 17:28:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCPEZFnlWOkjiU/88mctvx8cm4w5O6aisXMyUSS/h6w36PRuMevbJJJci275dkiNRzxnJ5hS0NP4mPVHI5SNDroHZhFpQCAixmo3PB1yYDgr3RX7T1YKm/yqXZqxV0OQ/WPrtvfUWm5BSteve3CQ6AUVwaqqBUt2zF4Po6qAt4dR/Bk1mI5s/TFr/TMOP+v3+Y3utOxWdfBSmFBGX49qYshTTwvnMT/qfvseWXGbdGcfyTS6jgGHWb18iCpx3/hYAohxAlpgZGV/yKAbiflt+Id1NIVYkSxbGOxSo49zdY6Olyy8w1GCjYTdf8KedFZDzKF1IBRTM9gkpv2NI7uozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tc97TzcWOlMFMcQTx7qA1x372eHQGaYzIzIqkJQHW80=;
 b=vq+ocxiddk3alPonjLMMxQN8H2dg9hNvU5SSPYu/R3Unn9zDqcsXpWX2Un9xk1MLG/LIaGGrXqrE6cONZXEMksxiGVpTG40QCvidmdceNc2/6SGmRtyZOZ9/E6KUTk4oW5pT1mWKA95VqEhOJhjTEA9moPTOwpjIXMKvGKB0P6e34v71VHwV9qiYBB3d7gBDvEIKIsSav447L0kSo7ZVTMnmlhnBtWUtobNxFW9fu/Dd45sa43CgLbWtjhswqRpiuCSyPbn68kKTELlPXbvD3igzHCnOGd98IIdA43NPCtHX+UdyJX9q7TYwRZsmRgxSE9xwG+5kYz8Z1PWZ5j+DUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6146.namprd11.prod.outlook.com (2603:10b6:208:3ee::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Sat, 15 Feb
 2025 01:27:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8445.015; Sat, 15 Feb 2025
 01:27:19 +0000
Date: Fri, 14 Feb 2025 17:28:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] drm/xe/userptr: restore invalidation list on error
Message-ID: <Z6/ttCTrEuwNsD6w@lstrano-desk.jf.intel.com>
References: <20250214170527.272182-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214170527.272182-4-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: ce0fd508-5887-45c2-e80d-08dd4d5fe3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7lCYQF1aDRWbylRFxQ1a4sBra3tzY1G5oCfyzQ78SZCAdd8OuCmheEttbW?=
 =?iso-8859-1?Q?RZGmTYAL0alEojWqj7VCMMYOuDYYSshAlvXNnZB3dkXK/hPJsZs4i/Fkho?=
 =?iso-8859-1?Q?UkSDVTiPndQfBcdE93CD8MlLiEc2bI1iQasRDgT118py2+vsxMk+3sfriW?=
 =?iso-8859-1?Q?nJ0OoW5ZhooQ32/my4BOTJOS0tL156ZThG5VBO67VQCQYF17aGfdor8XcA?=
 =?iso-8859-1?Q?ilprB/E4azJftbN1WrFkgvRzQnvFGiVG33nH+Bbg2T1pP59ceVb4yL2cq7?=
 =?iso-8859-1?Q?9OWRIdGvzLQtePLjbckoVTuPF9EEBcmehpiNfEiUeEwgjOJiohKQleaH6G?=
 =?iso-8859-1?Q?2TEuCzedusxaCZyl7HQzmDIF85NY5NSVdXMrhKSDqJVfJ8/PNYH4TreXC1?=
 =?iso-8859-1?Q?0ifspLy+uXU8q0g1Rx7d7ew6IAsU5z9Qvat2YAfDtZ6UVev+YGQhuxeQww?=
 =?iso-8859-1?Q?MdCTjborR5ylbfHqXFx1Wfgr44DKqdGs68eaOjaXiw76skfdgOaKklpOvD?=
 =?iso-8859-1?Q?kSFXiqvq5TybsyH5j1uveK5zoqw8vcj2jXr6hwsNCNtXGoXXPRsa7VUeO5?=
 =?iso-8859-1?Q?m2VTMPQBgZVDrdgpvhS3tCMq85H8GMSEimjDZOIyeVFCsi/QoRQSVjQqzX?=
 =?iso-8859-1?Q?ALH4L4yPl5i93jkdgULVvBxuwjBzpivWqZiU7CDReseQMPjx2/VzW+erNy?=
 =?iso-8859-1?Q?EP/6iC7R+KJ9Ice/n+IIoYoxJP7Gb0a6ofiE6XlW8bCnIu27TpCGO9CAFW?=
 =?iso-8859-1?Q?EZjKTtVmhYOueKS1LBZv/Bz76ErcAtPlUtDCiaIvhzGJt3Ke8Pd7qfM9dT?=
 =?iso-8859-1?Q?euzEkjOOTMwUgQuBztjGwKxAt5HJeRF65JYHT8xwxNOoBOlipMoX2rqMI1?=
 =?iso-8859-1?Q?9Aa+xEEz//oJoQZzaESS7QWMplta0pCQOZeYqi7UhVqkcjiv9Nac9defVT?=
 =?iso-8859-1?Q?cFnic0EqJHysM3CqLOy1Pai9YgYud5r+Tv/6sWgI4jcbvGQPojPcn7xDN3?=
 =?iso-8859-1?Q?2ns0vFXd2+0aJXHnpa0kcXpSRRfgsHBBngmP+qvr+hYBtOe2NKGHVU11kL?=
 =?iso-8859-1?Q?+1LihYIRw9SerDoZtW0QGXVWgrngIrlGO2dlsMZSFnsQ9XqDzlucGZjyo/?=
 =?iso-8859-1?Q?BmJfEaBy8KDlizwoiHJ1j16FItoAwQUgVbqd+4UXFUG/SRVEgT+jCoo9V6?=
 =?iso-8859-1?Q?8PHpfNrM2GGDBqB2r2vNFiA+chrDgR3THpeHFqYEjENSWbdK4FxnOdKkiy?=
 =?iso-8859-1?Q?hLHdzPB3x7/XfzFOWl1+TKSA1xq9iHcN7jdArjESqOXzMnEJyqoJytNu60?=
 =?iso-8859-1?Q?eo1YjyRMXgsv3Q2dod3IWlhoMfh12GZ8a1WCbUChmMTbdgwRJy6EhlFDou?=
 =?iso-8859-1?Q?yjJ3QCO4pO9uUrYGwG74qkk749SENy6S2lcviUJXfZc47pwvWxtcpn6d7l?=
 =?iso-8859-1?Q?2HpJlEUiekhhL59G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uwUu3UlqgPp7kRHkb4MS92bKag95hp14wSjEBziqqg/QUa+dqvI7Yp88Hj?=
 =?iso-8859-1?Q?WywZy5MQf6+6NiPlEpVUAKwxWulTj4J23+4ab5cM9anmuv7jffS8yHiYso?=
 =?iso-8859-1?Q?I0FXrWofn4KhKQFyxCN6mM/na81xAXyH55CELS+LthAVdYinHjHwl+u+9P?=
 =?iso-8859-1?Q?EEuX86xgr1NX52oWsTD1858RJCKQ8ltHQLCO671eg3kbm5jyDQFqLTn2jW?=
 =?iso-8859-1?Q?JBgh47GBp9EuuoXYbWc40/N1dMsu0+1b+kFJ7lLFehsaz7usCidhjDg9o7?=
 =?iso-8859-1?Q?R76n5HbQ6XXTw8D+seXuPDLEInl3Z3zlBXGyo0pssAw+xpoXQvIfwo0mKI?=
 =?iso-8859-1?Q?WARQF3EQnZDs9wwIGi+rKUm3bpGL+MhVIc2u30/RnIm1airXwpfgDGwJYZ?=
 =?iso-8859-1?Q?85JP94ALukVNF5Hv6EenlzNtE3r4WENVkH7inv7f0OSFbzQA7Oa9qiGb1b?=
 =?iso-8859-1?Q?+p9Z4WBX4u1ARvNMkOGsanpQK/qf5YCQCDhiIjvbAmNCcQArNwiAWRGZyV?=
 =?iso-8859-1?Q?dmId+Cy/2Y4oRWMKwyXd0NTprLEqu7HSwnNI7QF84z0BP13o04a0oSw8AD?=
 =?iso-8859-1?Q?tmT7GAKGVbJYLPAD47h9HcG4VCIybI6rpuHoFkbUgqPdcxWnaV9tto38v6?=
 =?iso-8859-1?Q?OHY6R7r0mcPgH0z0Bip3VP++a3TIpJwZmNzoBdEzDhTAVbDak/otwvF9eE?=
 =?iso-8859-1?Q?BWa5eAOW53grIEPBt3BfP4Ypw8Lf9wWNUMpGk+s9VmZet5zmbyJDzbhFCy?=
 =?iso-8859-1?Q?YUpUup4f3J2Tgzfmf8sxhYn3gX34Fq2oxGoOonawKHRqflOb9Pi+vl+E5q?=
 =?iso-8859-1?Q?MUrw2mUpr6chuehxhVt3ReP2lv7K8oLd4B+isuB9+i6tGicgDjq4UsorJq?=
 =?iso-8859-1?Q?vgwltH6z+3R4QznxxpvI+HTjU+GfHzXgAv3g6u65Mv4pTnhiJgP5hTYko5?=
 =?iso-8859-1?Q?JPxYdPQCewaaHmI/pAoe+nMjwIuxIc1Kr9zjC+NIQpakNxOHhwdsCBao4l?=
 =?iso-8859-1?Q?Yh1FoWqkAOtUN+ye6vf5a0NCrwUtgoir9tNmPxtzfjegAm7Jhv7GRBJeiS?=
 =?iso-8859-1?Q?8jio9nMEHMFXQSi9GA+PBnXtXZnuR3y8f7hlbTOQQ2jPzEPM36xyetZtzh?=
 =?iso-8859-1?Q?ahYme4lyPkeq85e03xFooaz9VNCNMynxPX0qvqXkwi1kM33NN+Rh+Bqccg?=
 =?iso-8859-1?Q?HvuxwA5wkFHVCJxCFDvitgORuKRQbpaZSYZaRAJyl0jBdhJHLqXBDU/Ypa?=
 =?iso-8859-1?Q?y2yCoroabHgX1fwScVPAuNYvKnav1lFsTsLY/obEyf6SOSAudNUzie85f7?=
 =?iso-8859-1?Q?+tLYwj5Yp6DcSCDar2YeeDDA3oa8zNF3IY3LXYWhUfe7AVZrhNIeYJF+5b?=
 =?iso-8859-1?Q?FCfxnDc+p87Qq0JdxhMYDXVbn5bbfeUcHgsOXZscGDvpBtFGPSbbDYv8Ab?=
 =?iso-8859-1?Q?ANqmrFSngfK4fY6qGWC1nn/fvfOXMrjJKu03qsd4JDTpA2JIFZonbvyC0E?=
 =?iso-8859-1?Q?39lh47htubBlnHGnZTC/6vRAM+xDk7ut9Rb9Sq27b792dZq+UL7ggojwlp?=
 =?iso-8859-1?Q?QiCHu1PoeYrlzZM4dVWT0Fg4FuNkN90OFSwOHm4YDfjb+coq6h/bN3KRI/?=
 =?iso-8859-1?Q?ke0yKEYgUfwIlE7X0pg5wPThxGxJidVd+IPoyfdnrnydru/lnUz5HVXA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0fd508-5887-45c2-e80d-08dd4d5fe3b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2025 01:27:19.5370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rOQYRhARRu65UA6eEF3sJdchjLSQWxQex6BqxLsV1vB9ayGG5YSBP4ZQl04fE0qJcX2/mCs28bGd5+yVWC6QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6146
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

On Fri, Feb 14, 2025 at 05:05:28PM +0000, Matthew Auld wrote:
> On error restore anything still on the pin_list back to the invalidation
> list on error. For the actual pin, so long as the vma is tracked on
> either list it should get picked up on the next pin, however it looks
> possible for the vma to get nuked but still be present on this per vm
> pin_list leading to corruption. An alternative might be then to instead
> just remove the link when destroying the vma.
> 
> Fixes: ed2bdf3b264d ("drm/xe/vm: Subclass userptr vmas")
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d664f2e418b2..668b0bde7822 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -670,12 +670,12 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  	list_for_each_entry_safe(uvma, next, &vm->userptr.invalidated,
>  				 userptr.invalidate_link) {
>  		list_del_init(&uvma->userptr.invalidate_link);
> -		list_move_tail(&uvma->userptr.repin_link,
> -			       &vm->userptr.repin_list);
> +		list_add_tail(&uvma->userptr.repin_link,
> +			      &vm->userptr.repin_list);

Why this change?

>  	}
>  	spin_unlock(&vm->userptr.invalidated_lock);
>  
> -	/* Pin and move to temporary list */
> +	/* Pin and move to bind list */
>  	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
>  				 userptr.repin_link) {
>  		err = xe_vma_userptr_pin_pages(uvma);
> @@ -691,10 +691,10 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  			err = xe_vm_invalidate_vma(&uvma->vma);
>  			xe_vm_unlock(vm);
>  			if (err)
> -				return err;
> +				break;
>  		} else {
> -			if (err < 0)
> -				return err;
> +			if (err)
> +				break;
>  
>  			list_del_init(&uvma->userptr.repin_link);
>  			list_move_tail(&uvma->vma.combined_links.rebind,
> @@ -702,7 +702,19 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  		}
>  	}
>  
> -	return 0;
> +	if (err) {
> +		down_write(&vm->userptr.notifier_lock);

Can you explain why you take the notifier lock here? I don't think this
required unless I'm missing something.

Matt 

> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
> +					 userptr.repin_link) {
> +			list_del_init(&uvma->userptr.repin_link);
> +			list_move_tail(&uvma->userptr.invalidate_link,
> +				       &vm->userptr.invalidated);
> +		}
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +		up_write(&vm->userptr.notifier_lock);
> +	}
> +	return err;
>  }
>  
>  /**
> -- 
> 2.48.1
> 
