Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A04C02188
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 20:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF4D10EB78;
	Fri, 17 Jan 2025 20:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggbP9Pay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFDF10EB78
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737145853; x=1768681853;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C76kSBW/MgUjwRTTCMBLJBrKL1E53lHjksSm/qZp0Ac=;
 b=ggbP9Payg+P0QBXpy4r0WRkyzPNZdB+FS6fyHx0bs+ghS+p28SBDyLxu
 69WEdThD/35gUy0BkS5iKNUeKzXhT2QZxq6Wn+2z0juHnTGA5NSJdXYci
 nwXi9pRx5nbpkCdX8wM65B9AEt116FsMAFDXMTqkLb1Ckc72I7CK7SGxu
 BlYKOTV2mYu3ktU4u/YzNHD6DuS7QMVk/xGbXTtiZwjljeXQCZltc3ABc
 7EyPhN0vhbsfTOhcfXmcxrtZ2eYz4/OHFlklGEMxUGH5g82HmARaDfERN
 Yj/fZkZKKu05gpdlp6/VbzmSZFBUtOHpOuU5Yd7aWP0xNTycZi3ZC0L7x w==;
X-CSE-ConnectionGUID: i0yhcN1jRNio/qtLxKURSQ==
X-CSE-MsgGUID: VeT2EUN6TV2x/Av7RU/5IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="62964120"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="62964120"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 12:30:52 -0800
X-CSE-ConnectionGUID: oOeJBu9SSw2SAD5ByTehSw==
X-CSE-MsgGUID: UdpfmT/3Rk+MGMp/Dzs7cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110895964"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 12:30:52 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 12:30:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 12:30:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 12:30:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4lDhn9bm184rV/yGG45xAbP5gT1sQpbj8BP+GsnLRVUDGY91BjIlUYVqEOz5trBbhW1tYByF8aY+EqWADvfE4An9nhWdJW4P/qKRaK7DbOuKVqCBdya9GrY0qen227Y5HxldgItiHSG6MaKebFuacZROjhd9LRQS2kh5Ai3GE9ty3+8J5We0afQm25dLHZLO5QO0Si/IidfZKl0CF1N3Qm44KAwTuBrF2JNsJsehTo5PfhgiH214+6j75qn7gpIQSLSyQHpq4B2RpTT1AnaT515W5dIIbFya+Qw9zkCQVCO8nzaJMgQSyY3ClJwNZPlF7r3VCgiTDmrYRnpHD3zFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8rQnLiOL8fdEWHu+ggSq0nQZKeJ2pW/Opgv66Vdm2M=;
 b=bOhav1ruo5+JgQRwJAjTptJXLIyMHOP75cA3THR+8RzTwDNfNK9Z8ddWuaLWBdy3rvbqogUqD3WJxwsmFyQ5v5wD2WIrmkFWJr+krkYOiB9YSpcn+QffzRkoEuECKKOu1822ZtPTqigBsl1G3X3yqcqTprdwRuB/0wVMMIwDt6EvI+KsVE5vbzAXrIxk7u/QeBszYPF2eAYJ7TkGTl5xqQqwhunIqi8HGUa7i1jotXSwMGzKBR1HiEFxfHVxh4ylMDYcN0qTx5Ft+mzPkyDjxEF/i4i7GZ0kjKN7HiUm/nfscd2wuu8OB0+kJEMW5vmnetdxRuxwHUKtSGWTQ0TePw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB7699.namprd11.prod.outlook.com (2603:10b6:806:338::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Fri, 17 Jan
 2025 20:30:48 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 20:30:48 +0000
Date: Fri, 17 Jan 2025 12:30:46 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, <felix.j.degrood@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Preserve oa_ctrl unused bits
Message-ID: <Z4q99nsbSRx2w6Z1@orsosgc001>
References: <20250117032155.3048063-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250117032155.3048063-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW2PR2101CA0006.namprd21.prod.outlook.com
 (2603:10b6:302:1::19) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a3e47d-cc05-413e-25ec-08dd3735d3da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG9yTUl1QXZhOTVLN25ucTkxMmNVbllpSENWNWdDWURSZ2V3M05lc1VKbkQ1?=
 =?utf-8?B?aDdTekFWQjVKdGthZjBPcU8wVUdpUGMzT0JPNVFzQ2psKzJ0K3JROUtSSUZJ?=
 =?utf-8?B?S3ZMWldNdkw2YzQxWkFyeUwzT3REaGlXbFVxeGxCTUZpVlozV0NoRitxSU5Z?=
 =?utf-8?B?RjRuOVlGM0dDcDdQTVZ4RGl5ZzhwR0hhTWZtOXc2WmFEcnJ3NHZxdVVOWkQ1?=
 =?utf-8?B?eldhMHBXeThVK3paZ0pyeDF1TTBkT05zS05wOGhQQ3BIa1Z3dWthTHVCc2J2?=
 =?utf-8?B?YlZQUlZ1VjQrUHVRaGt3S2lnU3VvOFJ0M3U1OERrSDUyVlc4ZDNiRUlVT3FG?=
 =?utf-8?B?QlZ2Wnh5bDNsakJJK2taS0dLc3BOcXd1Y3d6OE5SUVpiUHFGNXhudng4TjhH?=
 =?utf-8?B?OTBSVUQzTmgyanQ1RWw4dUMweURkYXJ0MDZUbXp6VGxSRFdYU3ZWUUVCOW5Y?=
 =?utf-8?B?QjEzVS9WODhxNzJydkJjYkNGY01qY2JQNmtxRG1oTWtFQk5LaDdqMG9HN2xa?=
 =?utf-8?B?VGpCbWsza3dkWTVic3dDYmx0WXkvN2JRNmFld3lDa3d6bVc0VGdRRmxKd1Nt?=
 =?utf-8?B?L0RPWEZMUm5ZeGljWGpVQWFFVFAyV2ZMMk9KZnVRTEorUUdBNUFaLzdWYnBT?=
 =?utf-8?B?N2RScXU1ZzZlbW54a1FFbFU4MUk0cktIc0V0aHdST3dFKzhKK0dqN0EwVVdk?=
 =?utf-8?B?MGh1OWFDQ0RLYStqQzk2SjREZVlNemU4eE96L0xJVW8vNUxDT3h2VVN0SWxO?=
 =?utf-8?B?MWljQ2Y0eGpqS1AvRmVlbEFJbDJDRUJHeFloQ3QyWi9SRUZ1c0pPR09hcFpM?=
 =?utf-8?B?bHZZQncwNWFUajV6ZThyWjQrNkNCZVdJQll2S3lIRzU3SWlsNGl0dG8zblRu?=
 =?utf-8?B?TDVVb1g5NlJTeWJ1VnV2ckZQUDlMNXFwcHQzZjFnOFlxTWxSU3U0WE13bVNL?=
 =?utf-8?B?TW1EcWcraTY0dVlKem1aNFVjQkRUU1hOcFVaMjRNQ0NWNTFKQXI2R2Nmeitq?=
 =?utf-8?B?c0hXSHV4S0hPK0NYVHp5NzJwN0dicFBvRmkzNC9kRWJ0N1VsT0xvekNsRnh2?=
 =?utf-8?B?RUpLdWdydUNCNEZyb3pNRVc4YTFybnBRRXNiZG9PQWk2b1BDUHlqYnc1RXJ0?=
 =?utf-8?B?Mnd2STRINjBKZTZJRy9xcUU1VzlhRHkvK1NPbVg5VThONk0vTnVGbThBLzBI?=
 =?utf-8?B?Wko5NlBsN2srSzVOUis1dlVTdm1kSmxVZzZGN1hXdVIxZU5UV3Y3aFRiMzRC?=
 =?utf-8?B?aHRMaVhVYWVSWWFrdUJRVHAzbFZiWmcrVzNHTmoxTkQ2SVZicDdRVUpWL2cv?=
 =?utf-8?B?L2xOOGdPbWNVVVluNEdaajF2OFZiOFRwdmJhUG5GMXNTYXRSakdkUnJneVNR?=
 =?utf-8?B?WWlYQ3lGUXB2bm9iN0YrZnY4YmlhMnpzcFN2aS9KdkdxTVFCUlZwR2VUTElS?=
 =?utf-8?B?L2xMcjc1bzVyeU5UdnZqbFVpc2tEUkZnM2hDVGY1UWg5ZjRKUWQ0M1l6Mllu?=
 =?utf-8?B?WVdRNmlmU1ZuRWtWQ3pBaC8xNi9mNFJ0Y2xiMXlaaFhZK2NyS1kxUmhuY2l2?=
 =?utf-8?B?VmZJVEM2a3FDTVdVYnZmUVRGaVRaUlZEQTZ6QkFES1Nnck1pMmVNNWh0ZG9u?=
 =?utf-8?B?dGtmbEN2RmllNVJoTTUyemx0NWQ4NWVmRHNQSUJHbVdqb1RCUDMxVWpxbXpM?=
 =?utf-8?B?ZlJPcXF1NUtCY012SXNPRytTMW8vcGkzS0wzSFcvSEVtbHVBcU41SFZlM3Ji?=
 =?utf-8?B?NCs4YW1haDdaLzY4V1YzM3h6L01oS2JodEs2MmVDZWNhKytWTEM2aGJKeUFJ?=
 =?utf-8?B?KzJDa0xLOE9GMmFNRjR2d0RLenM2WktoZ0xWQmZhZFMxS2pKeUlkbHMxK2h6?=
 =?utf-8?Q?10e3sLKZTL30i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU9xVm9iMkR6eXRtRGZzdjhCamkybXo1Q1BQZTVSQ1R5NkFFTVhoR1VvNmdX?=
 =?utf-8?B?UEM5c00xNWYrSkdCQkpEYTdVa2VtQUg4T1dvRTRTYm1USHlLNUlzSVRMT21u?=
 =?utf-8?B?V3lRSWhxaEhKZGxySEFtVVA0Z3JVQ3laaElPMW5xYjJuNTNnK2Qya01RSVNh?=
 =?utf-8?B?TkRYZVVDMHZvU3FhV1NCUHQ5NFhLY3ZGUENOK2s3Q3A5QXI2bG9BK2tWeVpr?=
 =?utf-8?B?cXpjR0psWWtleTVZTjRwWnJGYjFZUVJKUzkyaUZlcUJrVGJZRDM5eHZKU0NF?=
 =?utf-8?B?UVRmOStab0Q4RFZyQzNzbjB5ZjJoa0d4cG9lZlFXWDdvanI1amVES3Jxc3R1?=
 =?utf-8?B?NmVVN2VLczF4ckZzMW1MaUIvdjV6d1E0VlU5cFpYYWM5cWFnNWd2UFNoNzNL?=
 =?utf-8?B?YU5PQ251c0V5YytDek9MSmFvMElYbVZBblQrZC90U2Y0UXFZcEY1czFrTVZJ?=
 =?utf-8?B?UzhVU3VhbkptMmJHREY3YjZTUjlvUUZHSXFDMzFYU3g1L3BvQnVZSmhoOFdE?=
 =?utf-8?B?cmFVTzAzRU9vVmxWcTZVZ1RkTmhBTUcyZU9uSEJQbUZkNUt6UERxN1UyVlJH?=
 =?utf-8?B?RTZscWtPbGhwWGFLY2w3SDVGWWJBWHNNeExsYmdvdmwrUUJRKy9aOHJ2U0s1?=
 =?utf-8?B?bitHOGoveTgyMlFUQTZOa282aW5iVWxCREY1MkcxWHFNNzNueXE0VE9RS3RQ?=
 =?utf-8?B?S1lpaVdZK2FPZ3dzbkdtbEJQb3dLSnlwaVY4SFUvaE9vNXhVcHR1WDRMNUll?=
 =?utf-8?B?SlB1RFlLRUhWTnhRa3loeE9YNlVHa25STEhxanI4OFFwM3ZZQzhUQWhGTlpH?=
 =?utf-8?B?WTRHMEppYUtnWkJaUURCRmYvRE9OKytiendtSm1FV0E0ZEF1MjJFbnBXL2ds?=
 =?utf-8?B?bFVkcHN6dnM3RmRrTHg3aENsWXBaUG9DZ2ZiMWtDbEtQbEdUZUJBZmtLaStP?=
 =?utf-8?B?aFIzRlFLZ1NOM1h2TmE4YXppQ29qcTF0VlgxL09aUkkrY0xSQjVCaXJsR3FT?=
 =?utf-8?B?dnVIR0lXQzN1RWpRRDBnVEFZNFZ4SHpZYkRUSWN6VHduWUI4SWVJV3BTeVJT?=
 =?utf-8?B?d0lLTGpUNGZncDh0d1FEMDUwVk9XZU1lbW5aYlJ4Uk00MHJVUVpBUHlQdWw4?=
 =?utf-8?B?bXUyUyttNFVBNEx6VkJORFZDTkNBU3FjWFg5ZU5uVTFxMEIwVkRqSUhzTG9a?=
 =?utf-8?B?MWEyZ2lwcU9ZcjY1Q3N6WEd4QVg1ZzlobW5EUVpvZkhBK09aN2U2RWtOZlJR?=
 =?utf-8?B?L2x6LzBlMUNjdGFmbUEvRURPSVdkWWMxaytZSDdJM0ZvZFRzL2MyL3oyZ0JM?=
 =?utf-8?B?SnJrMnZ5RzFqWFFYUTlvUEk1bHUwUUxqamo1NDZ4TEtJanlob0oxeFdmRlhm?=
 =?utf-8?B?K1VmOFh2M3ZsQitqVWd6d2I5WWJ1ak15V29lQXNRTUxyN2RuY2s3dk15WEhB?=
 =?utf-8?B?WkNxRkJSZTdpVGJnUlF3KzArbHo2YXhGWkM3L3FQQk0zWjlxb25IYStYanRn?=
 =?utf-8?B?WlNQemJheDVmemRZdGw3QjFvcEFlamdpSkJ5L3ZUODdxT1RPL0RiY2pNbUt5?=
 =?utf-8?B?UmhvQ0ZkYURJd0l0bDd0QW44STFERU9pMk5nZmpYNWlzV01DL3QwYTdybW8x?=
 =?utf-8?B?VFBRQ2hJandFQ3lBbkVkRExjeUZ5cWZwZUI1K2ZBUVhBT25YQmRMNDhWNURY?=
 =?utf-8?B?cHh5Mm1pNGVYZ1dkOHp1akt0QmFuVU5PeXFiOUphYk9IVG5wdUs0M2pEMUNC?=
 =?utf-8?B?ZG9ua3JjK3NhRjJKbWtxanFacjgzclNYelNCL2hCcGNQTnRjQTBDRWVJcUVa?=
 =?utf-8?B?Q0RVQ2xoc2YxbGNOODZNenVYYWhnWm4va1dNTG0zUFh0SzJqUDdtS3B4VnBY?=
 =?utf-8?B?d2JjZlgreEUzVllaY05CMzVjZmxFUjc0MWtZaGRvZGx2aHFYTy9kcWlqaFlE?=
 =?utf-8?B?Z0pFRk1VemZ6SVZROVVJOGNtMzFPazk4eXNiZ1VoZlVKZDFlWS85d2RnV2lV?=
 =?utf-8?B?Yi9tcnVyMTM5ZDd1Tno0M0tsay8xZU1paDR6d2RzME03QzBRSVZsY3Y0cXBq?=
 =?utf-8?B?VTJFaDJ4M05Qd2htZ2w0bEhhWUZwdUFVa1lKQjVMaVk0bXlvd2FBblIzV3lM?=
 =?utf-8?B?azBNOUQrcnQzWC9BMXEwNVdaUCs1QWVGZEQzNy9ML1RTTDR1QndmdEh4RU5M?=
 =?utf-8?Q?OLZsWyZlbaVH7oCQMPQfiyE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a3e47d-cc05-413e-25ec-08dd3735d3da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 20:30:48.4817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyiJ8YxX5WozTjegKPlJulUmriMAME9zwY8s3tWEf/loA2QZlOSmte4JajYr9/EPXFCoCvxKNOw7GYshDUJUdmmqHl3S2tqlZwFvWkyaPr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7699
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

On Thu, Jan 16, 2025 at 07:21:55PM -0800, Ashutosh Dixit wrote:
>UMD's have interest in setting unused bits of the oa_ctrl register "out of
>band" for certain experiments. To facilitate this, don't clobber previous
>oa_ctrl unused bits, i.e. rmw the values rather than simply write them.
>
>Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/regs/xe_oa_regs.h |  6 ++++++
> drivers/gpu/drm/xe/xe_oa.c           | 12 ++++++++++--
> 2 files changed, 16 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>index a49561e9f3c31..a79ad2da070c2 100644
>--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>@@ -51,6 +51,10 @@
> /* Common to all OA units */
> #define  OA_OACONTROL_REPORT_BC_MASK		REG_GENMASK(9, 9)
> #define  OA_OACONTROL_COUNTER_SIZE_MASK		REG_GENMASK(8, 8)
>+#define  OAG_OACONTROL_USED_BITS \
>+	(OAG_OACONTROL_OA_PES_DISAG_EN | OAG_OACONTROL_OA_CCS_SELECT_MASK | \
>+	 OAG_OACONTROL_OA_COUNTER_SEL_MASK | OAG_OACONTROL_OA_COUNTER_ENABLE | \
>+	 OA_OACONTROL_REPORT_BC_MASK | OA_OACONTROL_COUNTER_SIZE_MASK)
>
> #define OAG_OA_DEBUG XE_REG(0xdaf8, XE_REG_OPTION_MASKED)
> #define  OAG_OA_DEBUG_DISABLE_MMIO_TRG			REG_BIT(14)
>@@ -78,6 +82,8 @@
> #define OAM_CONTEXT_CONTROL_OFFSET		(0x1bc)
> #define OAM_CONTROL_OFFSET			(0x194)
> #define  OAM_CONTROL_COUNTER_SEL_MASK		REG_GENMASK(3, 1)
>+#define  OAM_OACONTROL_USED_BITS \
>+	(OAM_CONTROL_COUNTER_SEL_MASK | OAG_OACONTROL_OA_COUNTER_ENABLE)
> #define OAM_DEBUG_OFFSET			(0x198)
> #define OAM_STATUS_OFFSET			(0x19c)
> #define OAM_MMIO_TRG_OFFSET			(0x1d0)
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index eeb96b5f49e2a..6a08e6c92835f 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -452,6 +452,12 @@ static u32 __oa_ccs_select(struct xe_oa_stream *stream)
> 	return val;
> }
>
>+static u32 __oactrl_used_bits(struct xe_oa_stream *stream)
>+{
>+	return stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG ?
>+		OAG_OACONTROL_USED_BITS : OAM_OACONTROL_USED_BITS;
>+}
>+
> static void xe_oa_enable(struct xe_oa_stream *stream)
> {
> 	const struct xe_oa_format *format = stream->oa_buffer.format;
>@@ -472,14 +478,14 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
> 	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
> 		val |= OAG_OACONTROL_OA_PES_DISAG_EN;
>
>-	xe_mmio_write32(&stream->gt->mmio, regs->oa_ctrl, val);
>+	xe_mmio_rmw32(&stream->gt->mmio, regs->oa_ctrl, __oactrl_used_bits(stream), val);
> }
>
> static void xe_oa_disable(struct xe_oa_stream *stream)
> {
> 	struct xe_mmio *mmio = &stream->gt->mmio;
>
>-	xe_mmio_write32(mmio, __oa_regs(stream)->oa_ctrl, 0);
>+	xe_mmio_rmw32(mmio, __oa_regs(stream)->oa_ctrl, __oactrl_used_bits(stream), 0);
> 	if (xe_mmio_wait32(mmio, __oa_regs(stream)->oa_ctrl,
> 			   OAG_OACONTROL_OA_COUNTER_ENABLE, 0, 50000, NULL, false))
> 		drm_err(&stream->oa->xe->drm,
>@@ -2534,6 +2540,8 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
> 			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
> 		}
>
>+		xe_mmio_write32(&gt->mmio, u->regs.oa_ctrl, 0);
>+
> 		/* Ensure MMIO trigger remains disabled till there is a stream */
> 		xe_mmio_write32(&gt->mmio, u->regs.oa_debug,
> 				oag_configure_mmio_trigger(NULL, false));
>-- 
>2.47.1
>
