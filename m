Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF66C25B10
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 15:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2C810E3D5;
	Thu,  9 May 2024 15:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRd065dF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A036510E3D5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 15:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715269764; x=1746805764;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZYGz0hhEAaMUWDcNntNJZKyLjdyUFs0GH2gICilwKhw=;
 b=PRd065dFFOLPbdTYwTDgVuCi5TX/mWzhxcr5RqjzU9T/fzhUJzMY4MwK
 riYsKg9WSPtXhnsSjhwM+fV2TVwsQa1cQe/qzWmb/rsmmKdm7Axm/n8Gd
 KD1JzFjynAo9WZhkro5yvQVaTYmP84cAEaQcafgBFrQWTKpqhcaH2ekt3
 y3H+532h/LUW7vVY+//tstdYkV4CYvqBVtY+bwxl99BDKiC5CM1LlOVlH
 +g73uCdP1S+rE9KfoflhqH9iszXCwRRDVaSNaj29JPazrmg5IHEtlN2em
 +EBqo4ci/adodGImUNncCMgefiXKR1qUfCHwWFc4oXt5jmkxPCh2yrvji w==;
X-CSE-ConnectionGUID: z9qgpDvIQpaObxwFBJRXKQ==
X-CSE-MsgGUID: iU6UG4NXS3SVzLwZ+DZsRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11327859"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="11327859"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 08:49:23 -0700
X-CSE-ConnectionGUID: n4zILWfJQpi/YeGp+OxzdA==
X-CSE-MsgGUID: Dz8/U2v9Rj2lsmBXxxYsGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="60139187"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 08:49:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 08:49:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 08:49:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 08:49:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4hmA+kTg+lK5OkHwSK8kpbRvyeRtqhRUCVf0q168i8fVP8laIi/AllFsg3Wzsc0W+kDPhJytHsK/4hDSxpcxDhN5DhGSrBBER1m6pX2v6lK2t0zgRt2FrirVtCldEHgrZaDXJbPIBIdPgUaiau0kjWUkCN8wB2mdlW41+tK5yTYNCMSF8GwZeL744zeWepXSkfgIWafeo5HVecz2iJGAlVz1XD70FlHB4mDz7srajPQg8yaXWU1PMxajIEk2Cps5r2wgO8N+bzLTZggl/JjoJYAqVCH3j8KnEzfdPuKDvSsF/fx1UPiPeg9gkCsrY/jTVXJcgfOByvqQBmXCjGvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSDoKjYdX7xstCNUk4agatCjOwaoSeECzr0Up0nFotU=;
 b=i2CtKo4/gP0NsJZzOLRx1/7NgCGhdboKzmox0Yie8RbJhAL/2s7UFyMK3lUgsFYvETpvhQKQ+F2NNaB2LCiKbURKdFonzI+KREaaK9tJmAxLPkHNv9pOq88y7NPidkSgt447FAL9bIx9WYbnKZnTTCd5NiZZPEkucctfywOnCHc+0QIY/AkVXCd8K+82Nez+mlD15bfXilgqy/9GNJLyjN7NtJ6O+7S1eIjPlMw+KuYjwqN9uU19bkMVyOocA/TYl5mzGtOwK7A36ZOYS2iZkSL2Jb3gsBQ7PKTeVTlwvArOGF+6ksHrLfCfeaPd4Cfs6IonhWBiIN+t/wWUU4qpkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8403.namprd11.prod.outlook.com (2603:10b6:a03:53c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 15:49:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 15:49:16 +0000
Date: Thu, 9 May 2024 15:48:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
Message-ID: <ZjzwZvy5ZwHsYuLF@DUT025-TGLU.fm.intel.com>
References: <20240508200707.375414-1-rodrigo.vivi@intel.com>
 <20240508200707.375414-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240508200707.375414-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0355.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: e54bcf47-c186-4a24-69a2-08dc703f952c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?W5zOVt6k3rL3gULVDB/wUkncrxirFDWR655lj6az+rVHtrz6QHSr6RISjT?=
 =?iso-8859-1?Q?ve75i2ywg6/9FXHi0WmbJYgaZGELJETTj0ji988U9Z+yWqrqNWUeH5iMR5?=
 =?iso-8859-1?Q?vyZanuVYMy5HDF9Jm0VOHriuOXrN/w2zYI0pWEgu0Ayy1Yxo5zeVEpymTu?=
 =?iso-8859-1?Q?/Ym3qGLv/DoryxRSQEpM9Pu/IHZ4aJy0ZIfDKoBZqnbcjmEzlCLkpn5fYF?=
 =?iso-8859-1?Q?zSR/bed+U+MNfHur/BkQf56rLeF1uXfNYAc6TFrBDT6zB0bywzX4fZB/u3?=
 =?iso-8859-1?Q?Bl48St5U+ESBub2HuFYQEOWRWPt7a1C5oUoxZScay3N2Zow0yq/+Aybpsw?=
 =?iso-8859-1?Q?BLu5JBR2Qeb43vWo1ltjRuD39/OpvuyEkW8ThI5syDhc3Ej5wX4yY5ZpbF?=
 =?iso-8859-1?Q?UHqSnflyhrdx0Ac/OT124hPpwTQNKMQXEnvPa95OGVCEdNB5Mbz/j17IPp?=
 =?iso-8859-1?Q?uXo5cpSjll9yKKsEKHA1TgHfyhqEEBPCTXO2EXTJdUePiDchNvUpr4r/lh?=
 =?iso-8859-1?Q?ED7xUzKX3Mg0DFrLjI14ij8/rOj8kfAPk3IA3Od3i0Ut0qhzF9JBO84nBl?=
 =?iso-8859-1?Q?pPr65vbYuXoDQX1kBn2X0ltxlZp25kYgZqYWcExrc4uA5/thu3phxvs8RO?=
 =?iso-8859-1?Q?LgVD/xEx7he2UojLy/9YEnwWsVETGyeq0POPKgWS1ifrljmImVQWFQiTsF?=
 =?iso-8859-1?Q?L7CtGWISolfz8sERU0yz9JnAX2JV7jrV5l8RoA4TwnQL8kFHfQyEYJK/sg?=
 =?iso-8859-1?Q?0iEiBAuyiSODbNmQ4n+qq7w4Aqp/L0mi+C2RAyq5JThOLKwvra4SL2h+IC?=
 =?iso-8859-1?Q?EZyWbwgSJLDKyPBgiggXu37jWkOUfpcb32jNbRxZyFd48zob/ZPVBHk/zu?=
 =?iso-8859-1?Q?UUyNpYPg1sm5MDvK0qkro3LE/i4Q6qwHMUvDXOl7LcOwTDK95U5X9x138k?=
 =?iso-8859-1?Q?6yQ1HjpyQ7S3jWmTBMOdLqjVbqQaygroY6P6a4GIse4WRp4cmYwPWxyOy/?=
 =?iso-8859-1?Q?I7rVC8/Lne4NjAp4ru2H7ZbsnZdLd0i0YH+cDrjVNI1Q1Y/x2/6dj9hnf7?=
 =?iso-8859-1?Q?CQGDO0VX1HcpgC7d9mV8V1fmKz0QIcagPypKypxPnKZATI8hoTKu/c3Vds?=
 =?iso-8859-1?Q?OtwIHRZzdfRcnll+PnMFwaJwI7UNfTAaetcw3fy2qMtQbAIzQxyanTu2XW?=
 =?iso-8859-1?Q?LeCG8mJGlVh9eYThrkuL488FIGPtXKwfNx82IKPqrX2ppuJxoFNhcudsCN?=
 =?iso-8859-1?Q?9rRSSvbS+U8XIVrLAWGiN8nPaNdtIl87qoLmT1976I37SBV0v675p2oBRq?=
 =?iso-8859-1?Q?Lpg+UHKK6CtdgepL8NSU33u4hw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?C3Yy3nBw+xjDoWFk0QAz1mimMhA+cueA/Czllou37/HQdPIQzpZ0Et+KEz?=
 =?iso-8859-1?Q?MDMpaG+iFwvaVTxz/Hht7HXHijzpuSi4+JrR7LK6byl2jhyYCC4Fos5a9G?=
 =?iso-8859-1?Q?hE/6wMirS/quEpN3NneTYh84b7533r1GioFYV8VhYAS0irF0Qar1Bt9eR3?=
 =?iso-8859-1?Q?/o5j2O+nAW78k6Bzqgz8SLzMiVDiZWcjV9MuGhSxuctRCz/V9YXBFtgjpk?=
 =?iso-8859-1?Q?timePsmxFIubm/rOv9ed6dt4BlUfPsF01YmlKm6gtBiZHjADzIAewRyNal?=
 =?iso-8859-1?Q?Ptv0kuGGDpPHIWnn1Ch2WBhAkKf7CSk5pp55c9ItveAF1dVC8tjjT8cGCE?=
 =?iso-8859-1?Q?IoWmvtPJMyiWopH0QB+SOJCnf12BzWBVWzmTFw6FqKrAzPa9xIqqArw3IK?=
 =?iso-8859-1?Q?bGWvzBWpY9ZCzuxgWUaGj0tRPQDMxpQA2KLFRAL/Jq1Dd+8HQdNQugC5vb?=
 =?iso-8859-1?Q?NySZEvXzsAztcnorttMpGzqokEyPAh3wQHiwO/wpNH/78DYU0R+AYDlE0F?=
 =?iso-8859-1?Q?GGi9ORedEQAEetMWupgc0wEcNukFrlGJ9s3ujbqMpEDapyHcKLVu5PfXKN?=
 =?iso-8859-1?Q?eBW4EyhlSqeYW0iCpT379hd5cZ9xzp2Mqa2h7mGbZWeneX5HXfKATfTT4E?=
 =?iso-8859-1?Q?E0Xu2M7rOZmdvCmK2MMvAzgC7T4kkhj3M74slvkWa8gu4WgpX4iwsNf4yD?=
 =?iso-8859-1?Q?vYGSMZJ7RHWJYg9HOrTSyZMzmISVmF6M2mOJ1UPyf8pCmV4NO/KXnxvffU?=
 =?iso-8859-1?Q?maWDEGoYBOFrthqWRCByypXO/l0YGt5xDAJB3PRZQOs0GiTXmQ461Oof+7?=
 =?iso-8859-1?Q?BG7ojKL/Ir0r3tv6o3+qaqcLVmf7E7oGcNn5iAvBlr4pq5Pt60aNQi0rpg?=
 =?iso-8859-1?Q?39sCw96B7ge9thM87uMzD/rpxSbGy/lZ6svUrZkn92afIP/f3I6dX3Ihnv?=
 =?iso-8859-1?Q?2rxDsJFjJpqRzba0n3R7R6UTwXWs5DcAq7KyUrdwe3VQ1RvpymCoPG96YD?=
 =?iso-8859-1?Q?MZxotNBxxbyljjiM+0w2GVg43s0B/RhCvnzNGFMdA/TX4fk5tQt751Xoc8?=
 =?iso-8859-1?Q?YH3wc9peSGvUWuZtTum1Yh3oKkZJ5YB7i31iVQ5Q7VskOkMLDlXePfXwpq?=
 =?iso-8859-1?Q?8a2PGO2km2VCv0tfMuxByIXO5jvCupcsq8BSs3yEyuuCWQI4/4G7OM9nBO?=
 =?iso-8859-1?Q?Rx/EgtA/Nv/NWxjZataaVUpm5pmeky9SercVtvBLGt/dGaMTM37OydjOcD?=
 =?iso-8859-1?Q?uaW6RxguxI2qZMvJQK9ELcdhP4o/yJCgueRt7265BUQuXWCF9A9I0RGBO/?=
 =?iso-8859-1?Q?9UL1DCzbLmhO+RY55K8a//E7yZFvvuooWTg1DcAhmAsSlE/jzH57wGoBrz?=
 =?iso-8859-1?Q?Ehd1GqQsGA3T8XFVIyFGMKqfUBuIEGENqT0oGteEvch+2q89kM7EZm0Ox7?=
 =?iso-8859-1?Q?KTcAThYqtFQXTcUuAJ36pzzq07yXs/wU8YPA7HLYCAUOhuJXwfjXiXsb3N?=
 =?iso-8859-1?Q?Sg3smcMC4WF8zJaF/h2YyJ7N+FF+0U0H1BqfOHIJIjmPGIc9IMprTMo8T1?=
 =?iso-8859-1?Q?CAVSDi2fW7smC90m3ssfk2tdulpZ3AfNMsE0WRuKiq0jGeLNLJDb2FCNcl?=
 =?iso-8859-1?Q?f898O6lNHc6OnEQuWmYuYzy0TcEfKhycUO6Tt+UALfEX+fanpPBdcOlQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e54bcf47-c186-4a24-69a2-08dc703f952c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 15:49:16.9055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwkfWYW4q2h7g2l7Ft1D2nQCSDOVOlMfprRwn78yZpyPZzuxtJbEY9equdisc2TPvUPMQUEf/6+xcod3fiIajw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8403
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

On Wed, May 08, 2024 at 04:07:04PM -0400, Rodrigo Vivi wrote:
> In the regular use case scenario, user space will create a
> VM, and keep it alive for the entire duration of its workload.
> 
> For the regular desktop cases, it means that the VM
> is alive even on idle scenarios where display goes off. This
> is unacceptable since this would entirely block runtime PM
> indefinitely, blocking deeper Package-C state. This would be
> a waste drainage of power.
> 
> Limit the VM protection solely for long-running workloads that
> are not protected by display cases nor by the scheduler
> references. By design, run_job for long-running workloads
> returns NULL and the scheduler drops all the references of it,
> hence protecting the VM for this case is necessary.
> 
> This indeed opens up a risk of use case without display, and
> without long-running workload, where memory might be mapped
> and accessed with direct read and write operations without
> any gpu execution involved. Because of this, extra protection
> for the special vm_op access callback.
> 
> In the ideal case of the mmapped scenario of vm_ops, we would
> also get references in the 'open' and 'mmap' callbacks, and
> put it back on the 'close' callback, for a balanced case.
> However, this would also block the regular desktop case.
> 
> v2: Update commit message to a more imperative language and to
>     reflect why the VM protection is really needed.
>     Also add a comment in the code to let the reason visbible.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
>  drivers/gpu/drm/xe/xe_vm.c | 12 +++++++++---
>  2 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 03f7fe7acf8c..7980efe139ed 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1171,11 +1171,26 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	return ret;
>  }
>  
> +static int xe_vm_access(struct vm_area_struct *vma, unsigned long addr,
> +			void *buf, int len, int write)
> +{
> +	struct ttm_buffer_object *tbo = vma->vm_private_data;
> +	struct drm_device *ddev = tbo->base.dev;
> +	struct xe_device *xe = to_xe_device(ddev);
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = ttm_bo_vm_access(vma, addr, buf, len, write);

Trying to understand this case. Looking at ttm_bo_vm_access it appears
to be a function in which a CPU VMA is read / wrote when it has a
backing store of a TTM BO. System an TT placement defaults to a TTM
function while VRAM access is implemented via the access_memory vfunc
which we do not implement in Xe. Is this something we are missing?

Patch itself makes sense, have a PM ref when accessing memory.

Matt

> +	xe_pm_runtime_put(xe);
> +
> +	return ret;
> +}
> +
>  static const struct vm_operations_struct xe_gem_vm_ops = {
>  	.fault = xe_gem_fault,
>  	.open = ttm_bo_vm_open,
>  	.close = ttm_bo_vm_close,
> -	.access = ttm_bo_vm_access
> +	.access = xe_vm_access
>  };
>  
>  static const struct drm_gem_object_funcs xe_gem_object_funcs = {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d17192c8b7de..f2915741fe16 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1347,7 +1347,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	vm->pt_ops = &xelp_pt_ops;
>  
> -	if (!(flags & XE_VM_FLAG_MIGRATION))
> +	/*
> +	 * Long-running workloads are not protected by the scheduler references.
> +	 * By design, run_job for long-running workloads returns NULL and the
> +	 * scheduler drops all the references of it, hence protecting the VM
> +	 * for this case is necessary.
> +	 */
> +	if (flags & XE_VM_FLAG_LR_MODE)
>  		xe_pm_runtime_get_noresume(xe);
>  
>  	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
> @@ -1457,7 +1463,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>  	kfree(vm);
> -	if (!(flags & XE_VM_FLAG_MIGRATION))
> +	if (flags & XE_VM_FLAG_LR_MODE)
>  		xe_pm_runtime_put(xe);
>  	return ERR_PTR(err);
>  }
> @@ -1592,7 +1598,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  
>  	mutex_destroy(&vm->snap_mutex);
>  
> -	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> +	if (vm->flags & XE_VM_FLAG_LR_MODE)
>  		xe_pm_runtime_put(xe);
>  
>  	for_each_tile(tile, xe, id)
> -- 
> 2.44.0
> 
