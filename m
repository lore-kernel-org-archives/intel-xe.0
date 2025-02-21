Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F44C021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 18:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E55510EB1B;
	Fri, 21 Feb 2025 18:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYnppMbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D20D10EB1B
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 18:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740161761; x=1771697761;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ltKu60xOEyifNL9SS5jzdSURO+WX9TuILtF/KactXOE=;
 b=SYnppMboop4Qyk/CMjRM4DE6kXbtT9oSHJ6ydA0fi42XfGsBhFgMnq6u
 2j8s4JuARFPBsT7q25991aK3ujQM8S+xKdwqBw7vS5/NfxjhuRs6zrvR9
 nqn5wQMgAHeocRdBgF0Oz4I8WQxwXLMN1JHWRxosHyQkbGaN6Ls6AoLyb
 bzBRY9LVP+BYTTsiLBySl6NGXBftOcFWqhl2NUbQ5dM2eaMDyRhtBsNf6
 DG+YRSAxyq6TaIrUUnx93lG/VAqs72tZ/6x5Wman5WVIfyQAusrRQGX4Z
 +zF/AaIfXZDqBRdrOHa3Hf3ivHdskxfNzRTc/2EaysnQI0VvAd/L51ddz g==;
X-CSE-ConnectionGUID: n4tQTOXhRnuIjUZgK5GeLA==
X-CSE-MsgGUID: dhsg0Q5ERG+AQuiNbJUnxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41194945"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41194945"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:16:01 -0800
X-CSE-ConnectionGUID: +NaeB6GiRZmlTdL5qY1Y7g==
X-CSE-MsgGUID: co8xkNdEQCilNSU5br0ibg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115269189"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:16:01 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 21 Feb 2025 10:16:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Feb 2025 10:16:00 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 10:15:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGBDTF6MW50qZpVkcfA7mHuoN9+hkkwKd642F+j2V9m9ICbVofxuJay9LKyFnxby4p3kg8wFcZCdRbszkK+fI/CQ2WU7eSBfCFUDHeSEGuK7PZmdmt5BWtvFv8tdGDYz+F8+ljkFIMBZDtGx5WyT2P4FRKAPr9n/37//m6fH1BaaO2XX5Muy+hM5ITLA+lJydrF6qSWtMNm75HRyduCaHKHi8Kphuc2lh050xE/z0+Va/WeJkmOiCCEP2lIDCdbgmM81wzporzD9z2R9NMHzhEvTPKWw+XDQX3goY/HCbVNt/L7gjyDBHUrVKu5vfj4UTqDfrN8YwdkLJ9llLt5RXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9OLcGtr0CMqaWfOFkMgvgD4nQeBM9Brti3axobY1uo=;
 b=qxcA1SrPr/dQgeJB8j+S2zYFQQItyi8h1HCesZK1lgckLrZx4Y1JZ3/H3ptxX3eBpXGIAgMLhclh0PyZQU04+dKUW93AfX+M4tzk5mtSKgTKD0Sf/DvJ5fUT1/PtqZ5gxLhrOZODMOdTZnb7zAAJnNcOiqSlt9UPX8Xl+hP8H5IN85asiuAD1GZDeWODD1WmsibH+patZj+8P48GJu9k7hYrYKenOPLz0a6MVfm8iiwptFK/wJlwDIr2QnVpTfWWrR4wFZeJMt5DnpCVIJDoOPcts8zQmBQ/RTDo6+jXNoW6INo9xnu66Vma2lNi3D1oNn12umQgLKMDabEPwtjsdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DM3PR11MB8671.namprd11.prod.outlook.com (2603:10b6:0:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 18:15:57 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8445.017; Fri, 21 Feb 2025
 18:15:57 +0000
Date: Fri, 21 Feb 2025 13:15:53 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <szymon.morek@intel.com>, <jose.souza@intel.com>, <matthew.auld@intel.com>
Subject: Re: [PATCH V8] drm/xe/uapi: Use hint for guc to set GT frequency
Message-ID: <Z7jC2UlmAGPTpQUP@intel.com>
References: <20250207061223.2072753-1-tejas.upadhyay@intel.com>
 <b0a880c9-2800-4087-85f4-42bd6c3cf77b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b0a880c9-2800-4087-85f4-42bd6c3cf77b@intel.com>
X-ClientProxiedBy: MW2PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:907:1::22) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DM3PR11MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ab2fbe-4cf4-41cc-f2a9-08dd52a3c991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rzmSnHUwPau+UV+ZBYFSh8RkyZy1TlcchfNXx1wGt3iWlgAMPdzph/leV4ZR?=
 =?us-ascii?Q?QiNw3nQV2JtEsPXmukhghND8i4lXy567MTIYv/zT4bpibLcmOpcSSCLhPQ3k?=
 =?us-ascii?Q?e98dGT0EAXdfPbbo+5P6MMDRXxRRpIJb5ObImrATxfvm7EpeLUaEfQ1gVnLy?=
 =?us-ascii?Q?w9IKNXcpMuQ0DevmEQcjV+z25gkgORHhxgNi4SIp1hsacXZtJzmlE7ksi27e?=
 =?us-ascii?Q?NJvm38i4KScb1ESygEJ+ByZJxCUm3ygHHSoex1M8vkJOwdMt0kseaokTvzak?=
 =?us-ascii?Q?v9lT6n4fw6C8sr2WCVSu0eFlJjYlaoEeYdGZpyNryy1AI2VJRrofLxBCugJE?=
 =?us-ascii?Q?JX2Pe/dOR/xXJweSDUAvxPo1j8+nGLCWN8gF+WZh/+zi/xrEcBJ4quIvZMec?=
 =?us-ascii?Q?S4hIHr8E/o9gTh/hUCBhDPqDlLJvaIL6MTuzFGRt2lrt8FIcpdgMFP4zurIJ?=
 =?us-ascii?Q?NYMLvCqE8ruI05sHGqnjiTlp0zdmETTKFWCaAfZIZ58MScwRel50PoDoKkrv?=
 =?us-ascii?Q?PcT5ulAKjM0dMiDgm8NRscowSwo3PxEWLvG3J9TveCmj8le3uNwaEm94wtCu?=
 =?us-ascii?Q?+rSaZQOucYBbUFaKXS76wrq4pt+mBSf+089FkJRO9QgO/kJAeqlzm0+xJts+?=
 =?us-ascii?Q?s3Cku7MG+AmH4LSoCfZQgkNRb6vN4FJj6MSz0GnaMsw4oav40kl406eigKOc?=
 =?us-ascii?Q?sjZe9UOsU+4PDsDd/JRkU1xJfeWQY6ud8Pvj2KeeUyOCWve+Z+x12Rd+U9+w?=
 =?us-ascii?Q?YOam2HrrHdyqEDQ6XNJNGMR1dsEraoJ9F9bBJJFMQdRf5xExqyP0cIfT92On?=
 =?us-ascii?Q?x2fdYDQL+0g4u1vnIIiDXbYN3iwHSDnhIzIQUDqcGO6Pu7c1Ee7zEW11omwY?=
 =?us-ascii?Q?jZPTZsGds+rZANl/GjJ77qcM6ghHSHHQgIFhRKZGk5tD0Om7u9+s5pymKKCH?=
 =?us-ascii?Q?DXqXbum/aW7Ocxy2YuMS2/a7BbAoYMgS/qVbPCp6T26/Q8LpFJqG8J+IDjJh?=
 =?us-ascii?Q?R0DV1k3XJrpgCq/UFBGvKuawgLFMd22uyzQkxU9t35D7qpLHeahnP/idfSlK?=
 =?us-ascii?Q?gvMA0W/h0fQYp/Gme5nMHP8tQ5qD0QQDQX+4rWFHpmtiunzkA9GpYqCUTSy9?=
 =?us-ascii?Q?VN/d5ofDCZsAAJCYZtdVVCw2Za6V7wagdanjhJHaXwDwjBcjTUhIsnsw7VWe?=
 =?us-ascii?Q?J68Uk30PM6QhlrDMQa+NezSpZISkNasUPi11XdGK4OSj7o5qg3IkJTyMwz2d?=
 =?us-ascii?Q?upOKdN4ziMtWq97r017WOt7GFbuqYxsd3eWW00PAX2Fno27xVNO79WLjZeGL?=
 =?us-ascii?Q?MTlMCiquPDhuQnCDG3RzlRMGzNexf43iufkXbAL+lqLKog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vkb0JqofHaO4QojyOB6vQhTuOXRUFw6X63/RfIMdQr6A9owOAoIFPlQ+gtDQ?=
 =?us-ascii?Q?dYuRF904AY7k/X5cAIi6UYUyj+zapZp4nhFsNJqlsUrm4omN8WrXrvYh7HJO?=
 =?us-ascii?Q?7LE4EDDctYmB8QLEXLLZeakP7/7KwtsL7bUBpQ6WIlQRpGDg08ljnq35yYEK?=
 =?us-ascii?Q?gtlpX9HLkPcfrewWCH+97NUB0JsCUIAGC5iCuoIxUsHpX3kYWFTOe+VCGDsy?=
 =?us-ascii?Q?fM7/lg/+iNqI2qCM4VX4QDPv6LGIUkw3aDKZY/5UL2RF1JdCdEOYgEuIXrbB?=
 =?us-ascii?Q?my3IjFqeCGLnrnTt5rkDRTNiIEwjgjXqedy4PJNOprA9sz59ibeQCPYBJiDp?=
 =?us-ascii?Q?swiX9exMgGL1lqaqxIoo7nmK5pKPTmJqejOHcebHm2GQ/FrKjz3x6A8lxE20?=
 =?us-ascii?Q?cUaAh/3D5/sl/y1J2Fu0gvNvMgF8LRW9OGfrZ4SRTATWTo3iqfKZ+9+VcWwN?=
 =?us-ascii?Q?YDZs5rqS8Yh3dqv6ExXqq+zz/Q08N2h4tbX8sU/JSOxxkQHczaI2/DLz/SE1?=
 =?us-ascii?Q?oKUfq61xusDmXNWxuxPGH/rFvTEZ+W3TWi9s6EAedhg7U75IQ+JOEO4iitv9?=
 =?us-ascii?Q?zDwfqwiTNzcv3Uru862qmziQBvuSIwmqKLMM6Vx7dbxSuPDQ4r5PiG/BZd9W?=
 =?us-ascii?Q?mEFudlDwUMdqfEjMJV6A1MEzhRRQOCuNgN3otWoTV4MyasV81dx5LNcXddJP?=
 =?us-ascii?Q?rvQ7GYtn2dhXO44DbieD4gIQUWniOrWoCdZz2NNhUf8Z6QBCEzuT8FRt1mh7?=
 =?us-ascii?Q?HP4Z7p3s8aXeMSpTxQO0RP4iOCyswI5uvdrmyBJtESjoxgZIu4KzbUL++bHr?=
 =?us-ascii?Q?eNMi/clZNbweln7rzW6YfeHzzNT+s4fvoexfL9tXUIsDRKfo25/BdOXsyY3I?=
 =?us-ascii?Q?6Z0xOAUSVetGi4wwyW4J9L45jgVAvDLe1fzPqJoOQQu6IAABSP/RZrwuc970?=
 =?us-ascii?Q?+bwT6gB2cBfDb8Gl15s+9FnjjeczIJyVjSJaf2bhHXfRr+N0nUNwsPblWL4l?=
 =?us-ascii?Q?/Yh/Qjvc2jz4H9VQxUUeNEvxcyebGfodCbDDpvfQORu53TywwZtqWU6/kYqU?=
 =?us-ascii?Q?E3NF/5+1u2i0vXgs4RhHGx77PhyH+oquGXhGZOBxIGFVBGUnTlcvm+RCu/gc?=
 =?us-ascii?Q?vtykciKy3+jcCdS1dhnaP0pbxF9d+DgdavcCFY3hr6M35z93y8h4pdqKO+TA?=
 =?us-ascii?Q?9lyftSeYaPgLYo7KrqawdgIcOW9EKIWg+kHJe+r0oOBh0GaK1Ae8nM+OM+JI?=
 =?us-ascii?Q?MPXvQl8OBi7pfsrfYliopH3TeZ7LEV6XsKKqA7d+MuO7GaXkWvWFPw/e2CFc?=
 =?us-ascii?Q?KV5f2D7NzxtZ+rVkqqPRM52iQsvyDHmOMMA7qWOEKLN9VwgdtMHIpmiY5K7D?=
 =?us-ascii?Q?iuHXHtK168KYQrCxZvd2BZ9G1ZUEXG1KOeQatkq2+N4mCWRDBk0an5wwbobb?=
 =?us-ascii?Q?g32veEFX2eDt2ItlFvRDU1RZzIc7z9++4qt/3mjvJ87jXSswxonDXsw9oAE1?=
 =?us-ascii?Q?CND0tLh/QWZDR+6jgHtMsPNs/cpuR8IDR1NwNZgZAIKPFu1myePMIq8sRBRq?=
 =?us-ascii?Q?AFuBiKNOXSK6uUfsRWz3OUmcDecJoEH826icR8OI8O5JJ4Zha5eHp/2DRrhX?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ab2fbe-4cf4-41cc-f2a9-08dd52a3c991
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 18:15:57.4038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifxM5fHbKmnVoVBfb5W5H0MvYSNsT4JNImRF9U3ocRWttS15tw1UJbSUxyT30DuPGTZww7YkDfIs8uqQyqp4NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8671
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

On Tue, Feb 11, 2025 at 11:16:50AM -0800, Belgaumkar, Vinay wrote:
> 
> On 2/6/2025 10:12 PM, Tejas Upadhyay wrote:
> > Allow user to provide a low latency hint. When set,
> > KMD sends a hint to GuC which results in special handling for that process.
> nit: realign this line length, seems to be longer than others in the commit
> message.
> > SLPC will ramp the GT frequency aggressively every time
> > it switches to this process.
> > 
> > We need to enable the use of SLPC Compute strategy during init, but
> > it will apply only to processes that set this bit during process
> > creation.
> > 
> > Improvement with this approach as below:
> > 
> > Before,
> > 
> > :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> > Platform: Intel(R) OpenCL Graphics
> >    Device: Intel(R) Graphics [0xe20b]
> >      Driver version  : 24.52.0 (Linux x64)
> >      Compute units   : 160
> >      Clock frequency : 2850 MHz
> >      Kernel launch latency : 283.16 us
> > 
> > After,
> > 
> > :~$ NEOReadDebugKeys=1 EnableDirectSubmission=0 clpeak --kernel-latency
> > Platform: Intel(R) OpenCL Graphics
> >    Device: Intel(R) Graphics [0xe20b]
> >      Driver version  : 24.52.0 (Linux x64)
> >      Compute units   : 160
> >      Clock frequency : 2850 MHz
> > 
> >      Kernel launch latency : 63.38 us
> > 
> > UMD Compute PR : https://github.com/intel/compute-runtime/pull/794
> > UMD Mesa PR :  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33214
> > 
> > v8(Vinay):
> >    - Add separate example for using low latency hint
> > v7(Jose):
> >    - Update UMD PR
> >    - applicable to all gpus
> > V6:
> >    - init flags, remove redundant flags check (MAuld)
> > V5:
> >    - Move uapi doc to documentation and GuC ABI specific change (Rodrigo)
> >    - Modify logic to restrict exec queue flags (MAuld)
> > V4:
> >    - To make it clear, dont use exec queue word (Vinay)
> >    - Correct typo in description of flag (Jose/Vinay)
> >    - rename set_strategy api and replace ctx with exec queue(Vinay)
> >    - Start with 0th bit to indentify user flags (Jose)
> > V3:
> >    - Conver user flag to kernel internal flag and use (Oak)
> >    - Support query config for use to check kernel support (Jose)
> >    - Dont need to take runtime pm (Vinay)
> > V2:
> >    - DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT 1 is already planned for other hint(Szymon)
> >    - Add motivation to description (Lucas)
> > 
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >   Documentation/gpu/drm-uapi.rst                | 18 ++++++++++++++++
> >   drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
> >   drivers/gpu/drm/xe/xe_exec_queue.c            | 10 ++++++---
> >   drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 ++
> >   drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++
> >   drivers/gpu/drm/xe/xe_guc_submit.c            |  8 +++++++
> >   drivers/gpu/drm/xe/xe_query.c                 |  2 ++
> >   include/uapi/drm/xe_drm.h                     | 21 ++++++++++++++++++-
> >   8 files changed, 76 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> > index b75cc9a70d1f..234c38ef26e3 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -583,3 +583,21 @@ dma-buf interoperability
> >   Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
> >   information on how dma-buf is integrated and exposed within DRM.
> > +
> > +Low latency hint by user
> > +========================
> > +
> > +Allow users to provide a hint to kernel for cases demanding low latency profile.
> > +
> nit: extra line.
> > +user need to indicate low latency hint with flag while creating exec queue
> s/user need to/User can/ - this was in the last review as well. Might be
> good to indicate that this will affect power consumption.
> > +as mentioned below,
> > +
> > +     struct drm_xe_exec_queue_create exec_queue_create = {
> > +          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT
> missing "," at eol
> > +          .extensions = 0,
> > +          .vm_id = vm,
> > +          .num_bb_per_exec = 1,
> > +          .num_eng_per_bb = 1,
> > +          .instances = to_user_pointer(&instance),
> > +     };
> > +     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> > index 85abe4f09ae2..b28c8fa061f7 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
> > @@ -174,6 +174,9 @@ struct slpc_task_state_data {
> >   	};
> >   } __packed;
> > +#define SLPC_CTX_FREQ_REQ_IS_COMPUTE		REG_BIT(28)
> > +#define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
> > +
> >   struct slpc_shared_data_header {
> >   	/* Total size in bytes of this shared buffer. */
> >   	u32 size;
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 6051db78d706..f68b597f5270 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -605,11 +605,12 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >   	struct xe_tile *tile;
> >   	struct xe_exec_queue *q = NULL;
> >   	u32 logical_mask;
> > +	u32 flags = 0;
> >   	u32 id;
> >   	u32 len;
> >   	int err;
> > -	if (XE_IOCTL_DBG(xe, args->flags) ||
> > +	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
> >   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >   		return -EINVAL;
> > @@ -626,6 +627,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >   	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
> >   		return -EINVAL;
> > +	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> > +		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
> > +
> >   	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
> >   		if (XE_IOCTL_DBG(xe, args->width != 1) ||
> >   		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
> > @@ -634,8 +638,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >   		for_each_tile(tile, xe, id) {
> >   			struct xe_exec_queue *new;
> > -			u32 flags = EXEC_QUEUE_FLAG_VM;
> > +			flags |= EXEC_QUEUE_FLAG_VM;
> >   			if (id)
> >   				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
> > @@ -682,7 +686,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >   		}
> >   		q = xe_exec_queue_create(xe, vm, logical_mask,
> > -					 args->width, hwe, 0,
> > +					 args->width, hwe, flags,
> >   					 args->extensions);
> >   		up_read(&vm->lock);
> >   		xe_vm_put(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 6eb7ff091534..cc1cffb5c87f 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -85,6 +85,8 @@ struct xe_exec_queue {
> >   #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
> >   /* kernel exec_queue only, set priority to highest level */
> >   #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> > +/* flag to indicate low latency hint to guc */
> > +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> >   	/**
> >   	 * @flags: flags for this exec queue, should statically setup aside from ban
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 02409eedb914..25040efa043f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -995,6 +995,17 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
> >   	return ret;
> >   }
> > +static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
> > +{
> > +	int ret = 0;
> > +
> > +	ret = pc_action_set_param(pc,
> > +				  SLPC_PARAM_STRATEGIES,
> > +				  val);
> > +
> > +	return ret;
> > +}
> > +
> >   /**
> >    * xe_guc_pc_start - Start GuC's Power Conservation component
> >    * @pc: Xe_GuC_PC instance
> > @@ -1054,6 +1065,11 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> >   	}
> >   	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
> > +	if (ret)
> > +		goto out;
> > +
> > +	/* Enable SLPC Optimized Strategy for compute */
> > +	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
> >   out:
> >   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 913c74d6e2ae..f2ce3086838c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -15,6 +15,7 @@
> >   #include <drm/drm_managed.h>
> >   #include "abi/guc_actions_abi.h"
> > +#include "abi/guc_actions_slpc_abi.h"
> >   #include "abi/guc_klvs_abi.h"
> >   #include "regs/xe_lrc_layout.h"
> >   #include "xe_assert.h"
> > @@ -400,6 +401,7 @@ static void __guc_exec_queue_policy_add_##func(struct exec_queue_policy *policy,
> >   MAKE_EXEC_QUEUE_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
> >   MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
> >   MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
> > +MAKE_EXEC_QUEUE_POLICY_ADD(slpc_exec_queue_freq_req, SLPM_GT_FREQUENCY)
> >   #undef MAKE_EXEC_QUEUE_POLICY_ADD
> >   static const int xe_exec_queue_prio_to_guc[] = {
> > @@ -414,14 +416,20 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
> >   	struct exec_queue_policy policy;
> >   	enum xe_exec_queue_priority prio = q->sched_props.priority;
> >   	u32 timeslice_us = q->sched_props.timeslice_us;
> > +	u32 slpc_exec_queue_freq_req = 0;
> >   	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
> >   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
> > +		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> > +
> >   	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
> >   	__guc_exec_queue_policy_add_priority(&policy, xe_exec_queue_prio_to_guc[prio]);
> >   	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
> >   	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
> > +	__guc_exec_queue_policy_add_slpc_exec_queue_freq_req(&policy,
> > +							     slpc_exec_queue_freq_req);
> >   	xe_guc_ct_send(&guc->ct, (u32 *)&policy.h2g,
> >   		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 042f87a688e7..102923d3dc74 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -336,6 +336,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> >   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> >   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> >   			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> > +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > +			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> >   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> >   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> >   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 892f54d3aa09..7f8a51fa54a3 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
> >    *
> >    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
> >    *      has usable VRAM
> > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - Flag is set if the device
> > + *      has low latency hint support
> >    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
> >    *    required by this device, typically SZ_4K or SZ_64K
> >    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> > @@ -409,6 +411,7 @@ struct drm_xe_query_config {
> >   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> >   #define DRM_XE_QUERY_CONFIG_FLAGS			1
> >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
> >   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> >   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> >   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > @@ -1204,6 +1207,21 @@ struct drm_xe_vm_bind {
> >    *     };
> >    *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> >    *
> > + *     Allow users to provide a hint to kernel for cases demanding low latency profile.
> > +
> same issues as above, extra line
> > + *     user need to indicate low latency hint with flag while creating exec queue
> s/user need to/User can
> > + *     as mentioned below,
> > + *
> > + *     struct drm_xe_exec_queue_create exec_queue_create = {
> > + *          .flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT
> missing "," at eol
> > + *          .extensions = 0,
> > + *          .vm_id = vm,
> > + *          .num_bb_per_exec = 1,
> > + *          .num_eng_per_bb = 1,
> > + *          .instances = to_user_pointer(&instance),
> > + *     };
> > + *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> > + *
> >    */
> >   struct drm_xe_exec_queue_create {
> >   #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
> > @@ -1222,7 +1240,8 @@ struct drm_xe_exec_queue_create {
> >   	/** @vm_id: VM to use for this exec queue */
> >   	__u32 vm_id;
> > -	/** @flags: MBZ */
> > +#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> > +	/** @flags: flags to use for this exec queue */
> >   	__u32 flags;
> 
> With above minor cosmetic issues fixed, this is

Any v9 coming soon? It looks we don't have further concerns with this and
we could get this in soon...

> 
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> >   	/** @exec_queue_id: Returned exec queue ID */
