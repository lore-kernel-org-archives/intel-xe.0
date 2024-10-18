Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61204D3DEA0
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 17:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E819E10E37D;
	Fri, 18 Oct 2024 17:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQBo40wd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04E410E37D
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 17:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729271550; x=1760807550;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9B6mup5rbrewk7PQw5qhz0NYr54+0598WdQRzJmaJOo=;
 b=FQBo40wdoIuO4I9k4Pu784jgGpo7AGoa6N0atuGP78IDpKWJjSiqYsDd
 udE1DI3prRU4hACsJgyTZY2anSjarpsP9//Xkxqml0ArmkF50E+85zgRk
 WMj8TBJb2tDDv/AxwLyZgWDOcWxh8dFycmbfkKOJn0dWrzhlefCZLUGX/
 aZjpEArnBfCTx7FVfS5pa/G4Z5ckVay7L/tmwgQCCLjpL7/o+0ap2F1qr
 bwnYNNa1qQ9Xmu0tQu4TuoW1bM/WGWWiPLvZZBv47IIgxQOKH7xh+RxqT
 girWry9pvNoXkweIQjPFH0flhEtnQcbKCVApYD6uvA76//jDlyqu38/L9 w==;
X-CSE-ConnectionGUID: 1u7BMBCzTwS+t1tyvgrzrg==
X-CSE-MsgGUID: d+jQnYfkS6aR6i+M7TwALg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28272185"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="28272185"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 10:12:29 -0700
X-CSE-ConnectionGUID: +BJL8cwQTPmt03QdhCkrJA==
X-CSE-MsgGUID: +PSmv0JbSnu2BAtPWLJryA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="78829148"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 10:12:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 10:12:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 10:12:28 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 10:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+rX+BKtImaAmUkpd/2j+Klu1tRddwGSRuIRNko6NFQBOVWAM75Kd6DTw4z7yVBtG3RiZ83j/rdYn86VvVVK17rDz7yjnbTj6txlyymzgB0igiYNqnylR+XyFAq+xtob+qMMO3oQjm2+R8iWhkhtxYdf7nyxETGmSjl1dttpBbxAOCAOkTJKTvyGpvbw6DTkccclpK/4+2kHJojDoYp53ZRHpUpz0/rKCIQlbopoYCsPxRk3tXwatgtMb/JQCTi5ahasmZTgYm7wSqRf+9uyWuPiTqBd+PfbQ21z0dphA41F8SlGuWYq5VoAITtNz2KzeLyp5W96P0dwRlDlEj4YmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eKuYCFrpU1La0BMgU8waitjb1/v2kGYIOwkfNspkRU=;
 b=JDB0hAL1O0TuRF1tNPamqzty5+L+USAnVoLo+Rp0WCY1Fi+fqQF0bVJACp0d953iQ+byUwMbY8wWig4/rOWD0qdCvb8Lyv9g1TmKO7iZPi6ckY8m0cyGiOGS9TktXnw5uc6oVgXPCzdPOHPduqEsHHbRjpzPtuIIIQO1yV9agzUnQmT/DtOL9KO/FQfD2FJuDK/IRVuYElUp6meJdqmqjKe7kZqulbCDwwxb/i0Dsep80NGC+aS3sxWgGnCNOgw2Sx5JiYkMeXGW+P6iu9qWUmwOv1e8V504YBVP0UfZq4DLzOm4f5zkiGlLMuGMqPDePdqXg/cdeE6HCtLONTsMHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN6PR11MB8171.namprd11.prod.outlook.com (2603:10b6:208:471::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Fri, 18 Oct
 2024 17:12:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 17:12:25 +0000
Date: Fri, 18 Oct 2024 12:12:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI v2 1/4] drm/xe: Remove double pageflip
Message-ID: <dbhtxmc6jibv76yggoov2343surhjrilmbpalybjsfuty4z7ya@qfnakm54ufvs>
References: <20241018170631.6598-1-maarten.lankhorst@linux.intel.com>
 <20241018170631.6598-2-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241018170631.6598-2-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0102.namprd04.prod.outlook.com
 (2603:10b6:303:83::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN6PR11MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c90e754-9b7d-4152-ace0-08dcef98095d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GnOBC3LxunHZuBA8eqdjv8ZY2ykjNFJD6RaewPar4//L8iM/CJxttRQ1Ab?=
 =?iso-8859-1?Q?vYnserfJkdrlMMDbbdIbkis027ALGqA2sPTTyOFX/1bokoqOtOSUuuIhx4?=
 =?iso-8859-1?Q?va+NUqbesAzsY9op+bn8OYzgu8bcZH8M+C+L5gJ5R9Poa15xVCDiA7HyLa?=
 =?iso-8859-1?Q?6wMGZ0rv5YVSGYv7sOOt/CcAFk/U1ErEeAfN2v3GzrDd3qky98mkWGm0xa?=
 =?iso-8859-1?Q?dvMfP4ocNDzLpH3hlTr2CO68nOPPldmPO12ZHjjbGyblG/NaW0eJOKlcgI?=
 =?iso-8859-1?Q?kVImh8v2gbi04uLHYLT88vPCCyVZBUdXjttCOmXBl9XIf/uLDe2KI8m6MI?=
 =?iso-8859-1?Q?PWlyPqQJgZOHQ3kkYXjiKKqR3z1BeP+r04+izaPFWvE0/tuwo0kvOVT6P9?=
 =?iso-8859-1?Q?LOdP4gQgzXM0hOuG6UC1Mwn2OhSZsrFQRpMfVartHX45PDxpPKMzbyHPrg?=
 =?iso-8859-1?Q?VB9fhPyhh18wY9tEiwoQJNutixPb5GNSxPLrmNY4/zFyD01wFPtHbfN5dM?=
 =?iso-8859-1?Q?IQ+TM9ADfKE226yx29m7f/YZjzsPatPwPS99YD/cRt9GV9QBNPkXmBdTNS?=
 =?iso-8859-1?Q?VS9w8mHgOsIQb329ovM060uwaXyE0dHalyi2cN6o/lwah5bkXMovBecdLZ?=
 =?iso-8859-1?Q?nh+hN3F2eHOYZjk9xLMLN1neGqFC3NqHYMs6cB3s1de3TKQGPRRoX+4C9E?=
 =?iso-8859-1?Q?ylB8C4ccZzMAA8kTZ592PoKB2sEHyWA4PpNbt5AfPyeyi9VFi51s87yyc8?=
 =?iso-8859-1?Q?xjK350DYaboJxGLZHA8H/VIhgrSXTayigwe0yndgX+X6Dgoyrha1g4HBis?=
 =?iso-8859-1?Q?QI2cJwsEwVla1tmExooF/HItgEvBSj/2G47lUyWtGNcEJHAjeMduiSe89g?=
 =?iso-8859-1?Q?OdT/+7p3yWajtkah63nuTuS8EcBdvMoPy1bOJZE9MGaCAvhuABAqviNfho?=
 =?iso-8859-1?Q?5u0u3xImlSZ+MCLcrBGc6AX1BY+WauSJgovGtUZhjhzo8AQ0EC1/kMCWPr?=
 =?iso-8859-1?Q?C/F8zonK1HRJewhfvT/j41hv/WzOSxSUpdzh9GMPnjAajherDHk4quENzb?=
 =?iso-8859-1?Q?DS4Zm37F/AB4iDa3D7s4G7/y3jQamQOH17oqO/DYNwR79aDmCtKB6MxsWK?=
 =?iso-8859-1?Q?QY4ZYaGfAgad/HTspTorPQWE6E5oYLwWqJnhNJhxvPcMXdbsF7zNf/N0Ax?=
 =?iso-8859-1?Q?Fo6QGEilogkb4Ww+Epl4k05rVEHdFXyQEpcsWTIP9QfcTduuB61FMimB2I?=
 =?iso-8859-1?Q?H3eUoaNBB2X7RubpRM7CWaNpobU2px8C/QiISSI973Q3dK0rUa541bb0Kw?=
 =?iso-8859-1?Q?N7TsbZOqI+1baYVb1S5E/i1qLAFSrJ5pJ+nSlnipboXR6b1eLukMRXMmEP?=
 =?iso-8859-1?Q?VliAeTTFd8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IfIXPDYPtWSI7KvjHD0ZDLj9j9BRddrrPoHoWS/NCtz3+m9aq8US9kL7I5?=
 =?iso-8859-1?Q?+eL0g8ibmkvzB8rtfSfqyhX7Sxe4ZgQ3VVxK2bOkb/Z7tXkAhYPUS92rKe?=
 =?iso-8859-1?Q?mNXr0tyvjKU+Q2kd0EdABlVOJiYaYddK9wLPkvdgTVdc4VOnCPiHRLtonH?=
 =?iso-8859-1?Q?EnhhorU9RbU9PD4Ul1UwUPsaitQhNtmqV/OWnXqqZjkIeso3Rb+er+19j8?=
 =?iso-8859-1?Q?h566B4wbsDibvamKV7NMjUarbdRKfDB1tZQHPZIzYslcct86ayxZPrZnen?=
 =?iso-8859-1?Q?Dwv0H3ZpDZfpUmJkcJOHhqcayrzWlS/GuIrAilqd71CEoTUqXzcqkT49aw?=
 =?iso-8859-1?Q?PrLVALR/TPHaFDyKWDYhylA/zjqfN00VvWsHNmyxUF+STCnMMYBmzfb6ZN?=
 =?iso-8859-1?Q?rZC+PvOOsz0cvCjjb/Bo644du6xXsjmw+dLGeBsysYLiKdWdlbNxaesm2y?=
 =?iso-8859-1?Q?Gf0LveNcMYKnRvyIj0ArlEbhkHfEE0hf6rcrQ5JpmIPOrlaLW7ZxuX7sRa?=
 =?iso-8859-1?Q?EJZWww5Omdttv4+AB61uASnEYr/8aj7VAZmGs1uzn9iz8baoYueoeIaP0u?=
 =?iso-8859-1?Q?xuHV4gEULr53qyHOmAoO4og33qNwIp3+0nwLlQ+VguFG8tMvkwxcGWMgYP?=
 =?iso-8859-1?Q?UN0HYHlI/BopqKgzVDTKfvTXmTHw+Lice+sl6QIGSrAnZam37F4Viv0mln?=
 =?iso-8859-1?Q?1y1OY/N7gmmjJaAPZaZh+P107IMowYKZFIP6xVosFW9BTzB9hmOg+M8pTv?=
 =?iso-8859-1?Q?D4QZvkKZ3wG47hASbIeH5Q6jlnaP1XPFFVe7KAxhHEYTF9Z8rTvne1gx5Q?=
 =?iso-8859-1?Q?GFIgxwM62anvVXPWFcCEtxwFfTmgcsR38svM74tP8ecUE0OYY5Ywg1Z3WL?=
 =?iso-8859-1?Q?JevrhHHc0kiR6kj1OoE6CPwEP3JuHpywysCm45Os4GCbVaHbrbClt0lFX5?=
 =?iso-8859-1?Q?m6MWzebHFOZgrJ+KbWWXyVJ5mQ0YxiuMX9qLKpf0vOqw5WZSQMbKhLhcCi?=
 =?iso-8859-1?Q?lzvpWGWEM4SlEJNAksxEdCg7Gpyv1GK0FBpn1E5VHscn5wGYbI7ZoTAhgC?=
 =?iso-8859-1?Q?RSrTzPRJZZvwVH1uzDKSydqmhK5dgs9FCn6GoIA5K7/iL5I0ps5lHHftnS?=
 =?iso-8859-1?Q?QsKzpBfaiT7ZLe0PAqVEr2DxhYapgREjxgFEnLlLQ0t3/7W8RePeTNYxki?=
 =?iso-8859-1?Q?5Ked7DOI3Fi306EbabIrtBNgHQl1RhoglkHkB3Vep20TqWBthBmiiqbYeF?=
 =?iso-8859-1?Q?pfjcfgw4hcB37SKKexH8g7uc8YXmqG8nGJIil8WmdqcSvoUBGzW4ISI72F?=
 =?iso-8859-1?Q?s8d7r7IDI0N1lofX2MLVVOeK2pxtX7Zr7BmJ1fFauqj+bMLn63Zowpivxx?=
 =?iso-8859-1?Q?VlIgp3ZeleeV5ylg4xLUymGuuSLxBKwCkB2ZC4joCCSLh3hTkXmyto+oRB?=
 =?iso-8859-1?Q?9Bjbw7ZckKLa5fLcRvxmtGzO/Au7eP3AZP3xHyLcgzbmeJugQVA58Y8Fiw?=
 =?iso-8859-1?Q?kMRH6hSfX6LQMS7hXVyIc+qGUlbmTums4MJW6/q2vhattOKxD/qmYlZDBh?=
 =?iso-8859-1?Q?5tQ5w9pcR4c5JNaMz69UqGyjozcneZrof31NoBIPdwKs7uMPBWIAcaJ0c0?=
 =?iso-8859-1?Q?beDY5Z/P9lVEWC2Hu0RODZlwjkn0LktUBU1TBP1pAjgL6aSih5tg3tuw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c90e754-9b7d-4152-ace0-08dcef98095d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 17:12:25.2724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KY/bp8pOZJDHTC9057WN1Le0QZp1rodGx3yAZnv7tUCmNiIvTJ4Fc5KKYtz5aHnzQSO8ACvUP09EMVdPJ3GQ2uQJ7kjekNsf0kB1AVqsQbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8171
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

On Fri, Oct 18, 2024 at 07:06:28PM +0200, Maarten Lankhorst wrote:
>This is already handled below by fixup_initial_plane_config.
>
>Fixes: a8153627520a ("drm/i915: Try to relocate the BIOS fb to the start of ggtt")
>Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
