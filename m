Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92D3C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 16:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7692110E3DB;
	Thu, 16 May 2024 16:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwRwup3O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0412010E1E9;
 Thu, 16 May 2024 16:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715878179; x=1747414179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wufiZITASEdUmRAnoktdCrPdvsQOsWc7eMZNoOmBZvs=;
 b=RwRwup3OgZ924q0un4U6Df5lo04algl6RKeyUTs1pzCAB6g5y6EqeXfy
 IuoQkkIM8Wx7xe8etcUw+1H0nnZq+CNvhyu2+SIU0tdrUuVn0oNaxvq+F
 fEJjQjl80o5oyrg4tNz+LhX3VquDzeVn13UYHnzblJGQLsaNuXQLv+IMj
 6xi9A5HXJDUxzcnQNGffcf7roujExZfEjwkspSObfqId2CcXZoFiTWUXn
 deCC54qFDGY2g/qd66mcHy30BS+hPSysmPbkNwh4l5YmefInu1lABXyRt
 KBZio/l+uwmDJVXvnLjJ/oMdatRnvMjFOpnRnuRtXg6g+FsIBSNQ2P6Yw A==;
X-CSE-ConnectionGUID: STL7/VN/TRW6CcA3Yj/zdQ==
X-CSE-MsgGUID: 8aKmxZceS3Oyo4YLhrJ2Cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15833006"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="15833006"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 09:49:38 -0700
X-CSE-ConnectionGUID: oac2XHWxSBq4rZ919LEihQ==
X-CSE-MsgGUID: Fd5sNMXaSCyqsOI2g0dXRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="68945778"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 09:49:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 09:49:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 16 May 2024 09:49:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 09:49:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 09:49:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGfx3E9hiNKNh4D+HgTvLQy+KWYE17rIeKybfMqzhOL2X8ybKKhBAEU6oeqU7NT4HzKLOKmqQSwFqhQCXBQSL0pll4maYU90+RFfLyjBn7vEN5LODsnfupmrs9wOVlWNjUImOKe/E1VOye4KwnDSd7dL8l4ZTdM0Qhg+jt/GGMz4ko+0VnLsdsx+EXmlGZPt5pBtJu2//gzHiAkTF5I2wiIfmjzAw1ky+gl2jQBiYq6r/gFqZzCo4YIuM0UDmpLbTry9BNfHhzDFkgGWtJAqN00wGvuDQ4F4mRLQLesrmsRb9l+RUz1Gv0m7Ajkwe+JhAWA/J3y/AwjhewptnG9Jhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKfpLrelQYCUtG8Q9QNSfDXtssVbGd8kmvJVSpmV+E4=;
 b=LzdABQ5DkK3PA05V1n1f4n+xKwk5KfMC0urW6mEe/EohD9Iql2hQcl+eoXrp9DscKNFKJy57MCrcBtBYJjgvLK0RFGbkd5jjG6fR6tKCJVQuBxFjhewPKZG127HAhWRJTTloS1bOXu6g7w5qzOmMR/sH6J8lkEoPssq/90peUbKQ5arvSbdqgMVdqmfGG9j9R+ksHkpokAH+2kJte57zGsxakWm29q9+59cHb6umz8/76iAsXDARloJ1HqPnTfrehbBLrvsThmNFqHYDbK+pup1LoDyr/oAyhDLEnRxKC5aR1tMjI5Vk2iRwUNF/2QvRo7Rz1WP2QuJCd5dAZU3zhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.58; Thu, 16 May
 2024 16:49:34 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a%3]) with mapi id 15.20.7587.025; Thu, 16 May 2024
 16:49:34 +0000
Date: Thu, 16 May 2024 18:49:28 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH i-g-t 1/5] tests/intel/xe_pm: Update runtime pm conditions
Message-ID: <ZkY5GINHo2p8BYRo@fdugast-desk>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513185518.772398-1-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZP191CA0064.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a6c6ff8-9482-439e-d20d-08dc75c829fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mM4WM1cziG1oEAYsuN6V4V+pDqfTdx72H40dttyckqbYhcXVUnT9YqzKb1tD?=
 =?us-ascii?Q?NAUAuyYWCxjwIT01IWLV3Ept5TL3c1iTmPAiZihancKUHBNiviU48H8IdLgJ?=
 =?us-ascii?Q?2FJ0hxtMZeHOMKbufWqOeUGKE4fZsA15HHvYe6CgZ+qvvxr/UbYod4sZgNB2?=
 =?us-ascii?Q?GKrBz66rajJgkWWGUI2TXzxiZzQo9e7A82q8pDJPdvJa5JoiKJlne1TsCDGb?=
 =?us-ascii?Q?XIFC10ezpoqwHh7PRUUwLEvqOCt6YzbT1RQZq3tHjEeykffNsYBSIRYl6bHv?=
 =?us-ascii?Q?J5I567O6/SuinN/pcCU9SuAgbf5PhdlqCBBYNhS5SelLZZBNwgZMPl95Yg03?=
 =?us-ascii?Q?DCe52efDCMOiS6LoYexPfe3ceNMxJJNS62RfPGQge/Xi85CvkdPhfMV+FYRm?=
 =?us-ascii?Q?nySayCBK8+ecQrJ3TgyR5kBmEpiXqGQ1vgLAhCQVudpKHT89I5CnMf++6dxG?=
 =?us-ascii?Q?nOHNbziA/iAnMw6oP7ab3aUjJu7DLua7cEUcjJT8DuWHwBzQirGRf1n6O4sv?=
 =?us-ascii?Q?gre7o6uOIQ9JkgpQZmAcq9Qe8TMqCnKs1r40cSKEvEUhQlP87AWzUCeRe3GD?=
 =?us-ascii?Q?o+dSBLGdDE3jVWFItp3kOlPewpjFBxXKTLBj4GncCPzD/fH5qrO19kPSh3X2?=
 =?us-ascii?Q?nP0r8qEbICp8uMSRX+Dt47IXBlNYpaeh6wecDC8/PlcF1KdOB/U7P1MAPPsV?=
 =?us-ascii?Q?vIirhBKP63ZVPkQOC0NZSW8pb/M+uvkhY9ZA6hXoaPUZ9xnWsXXDpkhxRJ9j?=
 =?us-ascii?Q?JMiw6FyHV1k9Sw2FsDe8TYVidLDxxeNu7OapyaMqhrYsiBpgVPoLLQibiJX6?=
 =?us-ascii?Q?ZSybP+QKfr+sxOPzTWBfy2kvcpFJxnOPYDn0PhR3dUCfqq7Hy74HIQfeetGe?=
 =?us-ascii?Q?Rmu51Bim0tOJ1kZGkTrd161xRsO3huVzloyOge/mm+RrBpbNSdnpgkvJXbF2?=
 =?us-ascii?Q?YjLD1Rc6valBjv1ENXthpZMsCUqeDywmoBuFGYjq3hmYCg9loFuMyHJMBBho?=
 =?us-ascii?Q?o9RaQ4prnViAy4mfJn8XggsH1RsW871J1/WXyFSiYcYKOJ29fCeo8xj1WWAe?=
 =?us-ascii?Q?vdHNGfYc9ZPmhN/R+euQwVbpZk3qvqoZ0B3sJpn96qbozVDjfj0SNueq50My?=
 =?us-ascii?Q?q4aOov/bN95T7oge93agloH+PSAbhkeFtMn70gWOu20r2zBVFQn7bhfaP7BB?=
 =?us-ascii?Q?X/wsB/q+rq1Oufm8pssHN7B8A7Om36nXGmCxlARcObuFrdiCI1Vv0KAIz/rS?=
 =?us-ascii?Q?Wkgeycnl0DyZJ+vT98WIqPJ52Ig84DevEs4NmGJHvQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pDFoLPcRwcCJiVgaJ31mOh/98+jOfHBcBk/ZpCqOd6h43macNcijOx2Pm4tW?=
 =?us-ascii?Q?2yU56r7Smn6cN3LcBalJD5JVOwomLMfWODWoa6aGpxGjdVvZPQV3O3R8WPKh?=
 =?us-ascii?Q?lf9altMLoy97OMwAJv8ih02dfcvCRKlKJpy31aNzriktJt/wOzKNsokw2qtD?=
 =?us-ascii?Q?JlBF2EvgOZKJ2xoSL2RNlxEGoWz/4v/a6KRYrCul9W83IWoMIydFOJt+v82y?=
 =?us-ascii?Q?fBQxyCiRO87f5e0ryxUFC82Rmrt6QeEZYagkNzJ0vPEqgqHWuc74KoZ1Nu+e?=
 =?us-ascii?Q?K7aCy9IURz/pJXrixeAU4fusw/l+veOJPtaPcnU3aHTVFUj7u0GrIjgPgJ3u?=
 =?us-ascii?Q?GNGERqlhebPv1EAQwSt4t3j+qZ28DPXWymhwEKYRWh06+Ndn5on/SYtyooIP?=
 =?us-ascii?Q?xEUodfQ3/zdBc3pt9lJixG+d/OmRC+y1NMlYXESz/BGhAABeRKbjdg35SvK/?=
 =?us-ascii?Q?hdoqh251bSeyBLyQumIt4n0tSo11ZUPjxpzq7/+ZVZIuBcUj791jp4KlfeV3?=
 =?us-ascii?Q?YprEHRmpWMIwNtv+qJ92kshTHSPnNSZWqIJ9A9HC6SlBrKqASkylheYLXYwH?=
 =?us-ascii?Q?Oru08sJZwElf1n+IubBuPf4T2fPZ+Wb9k7vgLioN019Em7OsNZF1ZJKygSMT?=
 =?us-ascii?Q?Eyp4m+Xsl2u6kOJwXWJwVrOyWlk/qxFkWsa7BJcLRm28R+Xtn8D+hIqlU2x8?=
 =?us-ascii?Q?y2KeQvKAQzTMiKC6e2hF60pAV14ktjWVVuLlTk99859cJpMPlbSauY4EkSbp?=
 =?us-ascii?Q?bqTTIEs1lLaCBdLlMAb0caeqq1NYOeUUiNpqzKomZL/nvuBeOzUW/DGNyXyz?=
 =?us-ascii?Q?TY3riKB7bmMvAp4ZHpz1oteRbwTVEe2NQdvLg+pkTee1Itwl+gYHHFJnY8z7?=
 =?us-ascii?Q?uz3+rVTAQtEpGbqFHqsY/Fh3ls1yTRO3eHgJNQfiGR35cakGVgxxlu3El1AG?=
 =?us-ascii?Q?k74FFjoDXFex5Uge64aexwJYq6t/kScV1axP4DF0vROXp8hJ4/I/rYBbcKjA?=
 =?us-ascii?Q?ZoF0sNA9ouPIoyj4HWlgdxkovX6WD+JD9CgShNdc9lHsXsZdihZSsUyN4cA/?=
 =?us-ascii?Q?NfHXmGKXPH+fWy/fUXypZI2LeUC/OFhMGGKB3JL4tr7orsbrBwXYhGM04Dlh?=
 =?us-ascii?Q?c/SXlf/D/8/2VvtaVNsbMl6CFE6IGUik2coztVenYmy/JjsdI6cOCc4s+/st?=
 =?us-ascii?Q?BgOAg+EHxcYUoMeoWniY+1W5ELr9tI0fUnbRzep9RhUcGo2qT1x9/hniVs53?=
 =?us-ascii?Q?jYs1p3MWq1gr3MeoBoTFp72KYmRb9ANmxHDDiwr3/taCiVs8ykQCrS+C2ig8?=
 =?us-ascii?Q?sE3+bknDtI09tbx1gAJUFyTE9ccGIGnUUxBnEklTnhc37Yqs+qjsPst5I4jB?=
 =?us-ascii?Q?lfHd7B/rqTMMAxm4hqxnbPsErcn3jsHunx6Rdd+iVXaGoGZOZqH8fwQIe5t4?=
 =?us-ascii?Q?8INlr99E6qDRTQwYzMqC4Ao44y7LNRG8conO5Nf+NZU8qQuURQ5EJCWyiACK?=
 =?us-ascii?Q?rkJA557ljZgIXI1jQWsvZrVtIZG/hH3nCVqbFH5xdtHp5Gfq4dq5u87hf7fU?=
 =?us-ascii?Q?fC88vEOyE4e9FyGa8chn+xVTQGNBNYybY7AcTXLZN0SzfBkqOI8rRVxnSeYe?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6c6ff8-9482-439e-d20d-08dc75c829fa
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 16:49:34.0058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UGdhUwD8ZODDVbSG6xCcmugw8byOLU68nyTwTrIpJpPy/kHIN9AwCUE4bdjc/QR/RbwFOsikW5YK8W7StwczyxFKKWmYYzm5xbx9sA9Ruk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
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

On Mon, May 13, 2024 at 02:55:14PM -0400, Rodrigo Vivi wrote:
> Xe is no longer holding a runtime pm reference for the life
> of a VM or exec_queue.
> 
> Also, IGT changes autosuspend time to a minimal time, so we
> cannot guarantee that rpm is still suspended after the execution
> has finished.
> 
> So, the reference usage is not a reliable reference.
> 
> Hence, start using runtime_active_time as the indicator
> that runtime_pm resumed upon our actions.
> 
> v2: Usage of runtime_active_pm and inclusion of mmap tests.
> v3: Add doc for the exported lib function (Kamil)
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Seeing failures and getting some "ACPI Error: " in dmesg when running
tests for a state which is not the platform default, for example s3-*
on a laptop which defaults to s2idle. But this is not caused by this
patch, which LGTM, so:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/igt_pm.c        | 24 ++++++++++++++
>  lib/igt_pm.h        |  1 +
>  tests/intel/xe_pm.c | 77 +++++++++++++++++----------------------------
>  3 files changed, 53 insertions(+), 49 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index fe7692960..928b72685 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1412,6 +1412,30 @@ int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
>  	return -1;
>  }
>  
> +/**
> + * igt_pm_get_runtime_active_time:
> + * @pci_dev: PCI device struct
> + *
> + * Return: The total time that the device has been active.
> + */
> +int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
> +{
> +	char time_str[64];
> +	int time, time_fd;
> +
> +	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
> +	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
> +		igt_assert(sscanf(time_str, "%d", &time) > 0);
> +
> +		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %d\n",
> +			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
> +
> +		return time;
> +	}
> +
> +	return -1;
> +}
> +
>  /**
>   * igt_pm_get_runtime_usage:
>   * @pci_dev: pci device
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 91ee05cd1..b71f7c440 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -94,6 +94,7 @@ void igt_pm_print_pci_card_runtime_status(void);
>  bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
>  bool i915_is_slpc_enabled(int drm_fd);
>  int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
> +int igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
>  int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
>  
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index e81a75d88..3f963bd9b 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -184,34 +184,6 @@ static bool in_d3(device_t device, enum igt_acpi_d_state state)
>  	return true;
>  }
>  
> -static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
> -{
> -	uint16_t val;
> -
> -	/* Runtime resume needs to be immediate action without any wait */
> -	if (runtime_usage_available(device.pci_xe) &&
> -	    igt_pm_get_runtime_usage(device.pci_xe) <= 0)
> -		return false;
> -
> -	if (igt_get_runtime_pm_status() != IGT_RUNTIME_PM_STATUS_ACTIVE)
> -		return false;
> -
> -	switch (state) {
> -	case IGT_ACPI_D3Hot:
> -		igt_assert_eq(pci_device_cfg_read_u16(device.pci_xe,
> -						      &val, 0xd4), 0);
> -		return (val & 0x3) == 0;
> -	case IGT_ACPI_D3Cold:
> -		return igt_pm_get_acpi_real_d_state(device.pci_root) ==
> -			IGT_ACPI_D0;
> -	default:
> -		igt_info("Invalid D3 State\n");
> -		igt_assert(0);
> -	}
> -
> -	return true;
> -}
> -
>  static void close_fw_handle(int sig)
>  {
>  	if (fw_handle < 0)
> @@ -326,27 +298,27 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		uint64_t pad;
>  		uint32_t data;
>  	} *data;
> -	int i, b, rpm_usage;
> +	int i, b, active_time;
>  	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
>  			  d_state == IGT_ACPI_D3Cold);
>  
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  	igt_assert(n_execs > 0);
>  
> -	if (check_rpm)
> +	if (check_rpm) {
>  		igt_assert(in_d3(device, d_state));
> +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +	}
>  
>  	vm = xe_vm_create(device.fd_xe, 0, 0);
>  
>  	if (check_rpm)
> -		igt_assert(out_of_d3(device, d_state));
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(device.fd_xe, bo_size);
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> -
>  	if (flags & USERPTR) {
>  		data = aligned_alloc(xe_get_default_alignment(device.fd_xe), bo_size);
>  		memset(data, 0, bo_size);
> @@ -384,8 +356,10 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		xe_vm_prefetch_async(device.fd_xe, vm, bind_exec_queues[0], 0, addr,
>  				     bo_size, sync, 1, 0);
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) > rpm_usage);
> +	if (check_rpm) {
> +		igt_assert(in_d3(device, d_state));
> +		active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +	}
>  
>  	for (i = 0; i < n_execs; i++) {
>  		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> @@ -429,9 +403,6 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
>  				NULL));
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
> -
>  	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>  	if (n_vmas > 1)
>  		xe_vm_unbind_all_async(device.fd_xe, vm, 0, bo, sync, 1);
> @@ -459,15 +430,13 @@ NULL));
>  		free(data);
>  	}
>  
> -	if (check_rpm && runtime_usage_available(device.pci_xe))
> -		igt_assert(igt_pm_get_runtime_usage(device.pci_xe) < rpm_usage);
> -	if (check_rpm)
> -		igt_assert(out_of_d3(device, d_state));
> -
>  	xe_vm_destroy(device.fd_xe, vm);
>  
> -	if (check_rpm)
> +	if (check_rpm) {
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  		igt_assert(in_d3(device, d_state));
> +	}
>  }
>  
>  /**
> @@ -561,10 +530,13 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  	size_t bo_size = 8192;
>  	uint32_t *map = NULL;
>  	uint32_t bo;
> -	int i;
> +	int i, active_time;
>  
>  	igt_require_f(placement, "Device doesn't support such memory region\n");
>  
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
> +
>  	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
>  
>  	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
> @@ -575,7 +547,8 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
>  
>  	igt_assert(fw_handle >= 0);
> -	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +	igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +		   active_time);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		map[i] = MAGIC_1;
> @@ -585,22 +558,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>  
>  	/* Runtime suspend and validate the pattern and changed the pattern */
>  	close(fw_handle);
> +	sleep(1);
> +
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		igt_assert(map[i] == MAGIC_1);
>  
>  	/* dgfx page-fault on mmaping should wake the gpu */
>  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
>  
>  	for (i = 0; i < bo_size / sizeof(*map); i++)
>  		map[i] = MAGIC_2;
>  
>  	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
> -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
> +			   active_time);
>  
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>  
> -- 
> 2.44.0
> 
