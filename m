Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70472CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 01:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A48610EB23;
	Fri, 29 Aug 2025 01:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yzor0U+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E5210EB23
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 01:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756429605; x=1787965605;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K324HdwxdCLMuqxtAo2Ayj9pcrF+zKy+qn+a0cEcpsg=;
 b=Yzor0U+aVeQRDyoNLoDawk3hPc8hJby+rMW1vArkeRPBvL6SVi6wgJHW
 8XfTZ+Qv38xPNGPfNuvDHPHDItavARwvBTI1yP++n/akWRHQ7azw1IA2q
 gtBUm9/L1xY3RNiD8khOyyFRhqv2jHZH0h2VyRU7VFR2BRZAlC8cMuw0F
 mK/qIgPYLewL9NNEXU8BGgjZcoeZ1M/QnS7Gau1Lw8kVIWC+ZESXjs+8J
 aazcQU4MKoBBoMqlVPS6Ft4QmeiGdwkngVaerlrp+mfRx02Sd8O7dNkZ5
 BO8nHfDiSf4xappgVkv3uf3btvIBBR14WoXCv4CzTUcUDk3I2BmM2PZ5+ Q==;
X-CSE-ConnectionGUID: 8tYlFsh2Syy+zxPsPA3zeQ==
X-CSE-MsgGUID: 8hxsOhTGTVKN2xzE5O2f7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76165757"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76165757"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 18:06:45 -0700
X-CSE-ConnectionGUID: NxnZgjlYQ7CstqsWx5nF/Q==
X-CSE-MsgGUID: ebXnIkToTqOqozu1j7j9Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="201177168"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 18:06:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 18:06:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 18:06:44 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.59)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 18:06:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cz28sFdk2F3HEDsR4ab6Mj7UCmnHAeQn5qEOMOTLq1T2cWq1qnNWMCIaAfvdXD3Un8DKWtAIe9s3YFwbHSQygUjT0L3d+my9EQhp5zbx6zdGLwHHCetwuLPzgSrqP81CIkBPWwpqSobYtqgTlSqJZ/52aDh6VmmRlbOqnP1F+C3nscz/QRA8p9tdwkelABBwLAooYTioSjiENkkmHhJUUVE7bhkBv8FrfV5mAIPVptdohZiVeA80F983W6Wtbc/6YZv1qJaZAAEzMOUYF46nJ1ihpsfzWH2wTiwrRm+35V9nF7UIhBaosiz4JPXVXCGt7D5ThHnSf0UKyHHU85Y3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQYrDNaATPAkpg+0lg+o9Uyu7MjHxGp039oeopr7ThM=;
 b=kahAqcxoyQ2TwC4jYNqdU9ZkkrIrfnLv2Ux1PfYp30xM84Eez6opHsEhE6uBSt6yZ2AgL2guz/+8zJ0+ehTS29P73aKsitNxgm1AEDCpNAg4/dhan2ZbHwqiYS1wsNVwf7wPQ/98sVJ+Ag20wPVAz4ot26gofsuO/9w1ExzppwkntE8W89F+eU5NybT3iBhTJyuqkDdO+NTQnBGt7lmI6sn7GvZRlJCIHLYaH2fJ4GvMW+POn8iEmaQlXk9tI/xGjCbCwAZf/4Re3ZOvgph0QEefi9RcMk92hqMePa/WxHVz7fVuk7+6Zg50a+cBX53+K0mWE3hfGe6KjJwSRvY6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Fri, 29 Aug
 2025 01:06:38 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 01:06:38 +0000
Date: Thu, 28 Aug 2025 18:06:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 10/11] drm/xe: Thread prefetch of SVM ranges
Message-ID: <aLD9GoVSVlaGoRMe@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-11-matthew.brost@intel.com>
 <73b83c23809f8d205f60c6828ff9dee0047797a9.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73b83c23809f8d205f60c6828ff9dee0047797a9.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff8c880-6ddc-4508-442b-08dde6984e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?xv1IqJmyiTFyrX6qne6/u8leEuVYmStYRfpNBzcRz/uthgJ9lHDLM+ucQI?=
 =?iso-8859-1?Q?qcc5MtxzorGqiIKtThypfTM7lK62uDels6FqioTBLY7rZRvlbhZiBtfXs8?=
 =?iso-8859-1?Q?NPNsPB3k8p1f8rGbJFYBwPGkHSYIi+AwXgSmhuFsyl6GwjPhT1y7Q7ZLQ0?=
 =?iso-8859-1?Q?jA/3x70RVlBc+T60l/8qOd50CyGnzeMoQHQyYP8XUPMO2ZrVivpHbmQaCq?=
 =?iso-8859-1?Q?jlTzlfQS3DtWF3BpUZ0bcpzGaCb0zuiMbAQVvJcwUfFUjDZ1V/SCDostJw?=
 =?iso-8859-1?Q?4pnCvmniU8/W6Kc8DSTZ1fUZI3tlKWqmuvkHQcqjyKs1ZNn/cEF/Tb2man?=
 =?iso-8859-1?Q?Aq/jmQo4tmdZaL+05AAg4zCh5kpfR+JAO9mFbeeknZ2xZqFTI9NYaf9XPN?=
 =?iso-8859-1?Q?4Ymap/qJdGCosyk3oftDv/K/F1VAdIn7kde6zxpsAiQ/1JTNvX9OZ29zNU?=
 =?iso-8859-1?Q?MK1czeHjXd8ZpQzCARxGqcOliCMk0zit5WF2gPFZd89+qpWwG82oyCclQ6?=
 =?iso-8859-1?Q?t51ciZ0elTKrtVUjepIscyC/uKOOTGCijlmymNzqKb5JEBo1SKm+FxtziR?=
 =?iso-8859-1?Q?njhQFSMCiSKwCD4/ipUY1PGUd/rwRQETD501/BMcUABehsRzUUZO0Z3pa+?=
 =?iso-8859-1?Q?84qPJ4bjeAcqcXRX/Y9QhoEiu+TOogJ0JX+NkpYUUiIgfezDyctQB2afLX?=
 =?iso-8859-1?Q?uA9+XYSYcAEgQArxbDQ6zfesBvmQiAfHnlWu8ps+jWsAKCT0kJSyg4X6sN?=
 =?iso-8859-1?Q?kZ16GL2lFewYUV8aCSg9aJkMJ22em07vn0ZNfbnfueAr+crSosRefKG1wg?=
 =?iso-8859-1?Q?xFwkwebRDbDXKyk6QvhJe2/z4tsYUo48axk5R6KscARA94oqr6iQxwL4Kr?=
 =?iso-8859-1?Q?IFSiGY/jKNXrOBunpWWtKJCO4ZAL195UDfHW2rxFZBp+E/MoCoW+bZuVaA?=
 =?iso-8859-1?Q?2mAfkBK+wcTWbKFW7QUO2JjXH7LrIRlXWh5mpHnPzLy83fGI+kSz2oEPkn?=
 =?iso-8859-1?Q?sXUBe15wOddpr2kKtrUHyI0VGOK+UFfHeNkOmvMOzqVMfeQy7ADFgUyVLn?=
 =?iso-8859-1?Q?lSAfI2ppEeK25361AnIJyVYaxVcOlk7tEb3v9yntw5P0rUDHPN795jswDb?=
 =?iso-8859-1?Q?ZnR196OUr/xBdfNh7jUNmo/3H3vzyClItFwS6FKOQ4OGLoILDa6gwKrTOA?=
 =?iso-8859-1?Q?GNm1q+xkOAZOYU2kN8tb0H5jnMBtRhcbcF1sK+pw1kUH7Xx7BkC6MXVQRb?=
 =?iso-8859-1?Q?NeRin7cIS/nRsHm2ikGILEOojNSGX7CtnmYFpYJDMV87gsQuiDDZe8+bch?=
 =?iso-8859-1?Q?aWFrasDHhdqvzMiQq4mxzaAfsIzpGHTO+T3As/32wf1BQilVQcYdCp0ztr?=
 =?iso-8859-1?Q?rxic/lOeA07dFK4WK0WTZzTr6gATqMouhYzpMyAZ2gbur/GRRQj3H1K6iV?=
 =?iso-8859-1?Q?wMTR/I8F6cPbfYmMI535m4ZbxtN79Hk7bijpjAB/SyM9mF+s1qo5I0xWC/?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7oKmrYksE83TAxQtG+aUaQvLtm93wZQY6fD4yf5SN2eXDMMvwp5VbcwNe+?=
 =?iso-8859-1?Q?cOL++oIUB6mQpdZisRDHIdhMKt+SmHWTqq+lvRmEU4BiF26T07FC6Cp3u6?=
 =?iso-8859-1?Q?Veegzik3B6NZKLw1ualJ+w0tr0cCJv14eGW93V3W0Em6lxli2XKn+kxNV7?=
 =?iso-8859-1?Q?cTCGJqjG2SVq9Z5qoMZsBsXUoDUtf42oDqnHNVCpGRoXjEyVZ2DPPee/aZ?=
 =?iso-8859-1?Q?6j2kbPp++IZY7UirSzf6Tt4jFXdxiOrbbwOPqrBxYNQCTBa2fD9Ft4ok+W?=
 =?iso-8859-1?Q?rjOuYfQSlUc6CZe7JVuby5RmZp/s3UDFNzLZNHFDUebYwT+dEyHcniVUDi?=
 =?iso-8859-1?Q?BDUZRlZDjPWeJ1hjlFP4beZpUqRVqnw+NGoghFbfazKPsIupoAwzsz/ffw?=
 =?iso-8859-1?Q?pXdx0gF2uwZRD9+WlfRqtEmNpZiROnD86iQSD4kQt0vIfonqFp7BjpFx3m?=
 =?iso-8859-1?Q?pKKLHxE65FYSgoeC7UQoagFV6EPWu9QSqx6i6XzypYYDBlFYPm9XKHoyn+?=
 =?iso-8859-1?Q?Ji37oEnzcRz2RSxztWz3VVst0VBm91t0PsF8SaIYW3C5zF8Pqramxk6YsI?=
 =?iso-8859-1?Q?eSaUUck98kINxg7JZ75LaW+tUwJs4M2nSyvPxsKAFpzZ+Hp4PRsbEmovKI?=
 =?iso-8859-1?Q?Ota3YMkIcmXraa8a6+FFXnvrmPszkoAO1/95DidQw2JqayjGoXFYGnEJqP?=
 =?iso-8859-1?Q?+g2CaUOsXIw9DV1aeWKhQZDaLXzHHMgPz2ANonVf1XkuHsf8Heg5QsaeGi?=
 =?iso-8859-1?Q?yycbikX8lT1424KrqhCPahUXX5QDObQVvUNfgANSsaWJENbpltIO1MwLQo?=
 =?iso-8859-1?Q?GzGlatcjOicsTfk0+YOWK9abqLJFD7AXOuB6vUg01wodaTBqbCZUKeOAjV?=
 =?iso-8859-1?Q?sR+cNKGbHWYWBFnpoUviHQ00mulzvyFXODfoxP0dFO6mb63crk/0Vs5lG4?=
 =?iso-8859-1?Q?wyfLpMiiRMwsL6XXzhphFaSVlIdmoOKKtJvlWaGqSZ0v+9rpwIOovsO8KT?=
 =?iso-8859-1?Q?T6y8Z3OrB8cGrMlLdiEQOpl1Qyo6L70KjOe9Clkedc2K/Iq+7Udj85oEpm?=
 =?iso-8859-1?Q?hRW9Oxidb50PA7GK/yyzbQDnPJeHxxCVBi7tPeQsAfLmDaC3RJxP1Rjqlm?=
 =?iso-8859-1?Q?urOPuj1jnydjINK/gV7K3aDIFrbqESmte5b9yHMRuhccsSa4N9GIlV0XzS?=
 =?iso-8859-1?Q?T00aqdRFUcsEjeLOxoFtlbp/q3TU1Z2RkmHoszYci7P101GB3izvKy7CnB?=
 =?iso-8859-1?Q?N/bgliQyBxj7ltcAlm23HQ7nWGPPzsD38oAuzI50MlBNEZ720QBtxl6nsY?=
 =?iso-8859-1?Q?Yf63j4KO7MrwtMfISGxtyW/7Wfr3UaFiosKH5qn/kYnYwXcbDfV0nEWgKc?=
 =?iso-8859-1?Q?ek41ZGwSKWouuOadLrmQ9QvWAl/k+szsuaOdUIWR2RlX8K4GIDDdaos1/1?=
 =?iso-8859-1?Q?VCnTQ8ut3uDtNj6oCPdYjWlp9QQ3l7wbBFxB85GwNsS0AhNgeHgNIwJt6X?=
 =?iso-8859-1?Q?OvitSkjnfKXW/UAHj7sTACiBkXrr5uK0zbTF/AvEC9aYtNmW+K89gS1lKS?=
 =?iso-8859-1?Q?o1s3aHwztSVv9oHFQia2ST+MTWFFenLA/wfQSU/PJPUW4UiVt95OPvV5LF?=
 =?iso-8859-1?Q?NsFgufynzKN3tVegXdThxs1/Jf8ok74Nbsx8X1e6Ny7BYKZ6rhvassVQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff8c880-6ddc-4508-442b-08dde6984e38
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 01:06:38.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2Ut9MEKLbJ6c8u+4AIL0ppK2+5F8/hjfPIRRZf71lgloDhjbQ+cZx/ps0CWkDEUNnwEDS39L7MBdrRDCq66sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
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

On Thu, Aug 28, 2025 at 04:55:20PM -0600, Summers, Stuart wrote:
> On Tue, 2025-08-05 at 23:22 -0700, Matthew Brost wrote:
> > The migrate_vma_* functions are very CPU-intensive; as a result,
> > prefetching SVM ranges is limited by CPU performance rather than
> > paging
> > copy engine bandwidth. To accelerate SVM range prefetching, the step
> > that calls migrate_vma_* is now threaded. Reuses the page fault work
> > queue for threading.
> > 
> > Running xe_exec_system_allocator --r prefetch-benchmark, which tests
> > 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s with
> > this patch on drm-tip. Enabling high SLPC further increases
> > throughput
> > to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16 GB/s.
> > Both
> > of these optimizations are upcoming.
> > 
> > v2:
> >  - Use dedicated prefetch workqueue
> >  - Pick dedicated prefetch thread count based on profiling
> >  - Skip threaded prefetch for only 1 range or if prefetching to SRAM
> >  - Fully tested
> > v3:
> >  - Use page fault work queue
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pagefault.c |  30 ++++++-
> >  drivers/gpu/drm/xe/xe_svm.c       |  17 +++-
> >  drivers/gpu/drm/xe/xe_vm.c        | 144 +++++++++++++++++++++++-----
> > --
> >  3 files changed, 152 insertions(+), 39 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 95d2eb8566fb..f11c70ca6dd9 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -177,7 +177,17 @@ static int xe_pagefault_service(struct
> > xe_pagefault *pf)
> >         if (IS_ERR(vm))
> >                 return PTR_ERR(vm);
> >  
> > -       down_read(&vm->lock);
> > +       /*
> > +        * We can't block threaded prefetches from completing.
> > down_read() can
> > +        * block on a pending down_write(), so without a trylock
> > here, we could
> > +        * deadlock, since the page fault workqueue is shared with
> > prefetches,
> > +        * prefetches flush work items onto the same workqueue, and a
> > +        * down_write() could be pending.
> > +        */
> > +       if (!down_read_trylock(&vm->lock)) {
> > +               err = -EAGAIN;
> > +               goto put_vm;
> > +       }
> >  
> >         if (xe_vm_is_closed(vm)) {
> >                 err = -ENOENT;
> > @@ -202,11 +212,23 @@ static int xe_pagefault_service(struct
> > xe_pagefault *pf)
> >         if (!err)
> >                 vm->usm.last_fault_vma = vma;
> >         up_read(&vm->lock);
> > +put_vm:
> >         xe_vm_put(vm);
> >  
> >         return err;
> >  }
> >  
> > +static void xe_pagefault_queue_retry(struct xe_pagefault_queue
> > *pf_queue,
> > +                                    struct xe_pagefault *pf)
> > +{
> > +       spin_lock_irq(&pf_queue->lock);
> > +       if (!pf_queue->tail)
> > +               pf_queue->tail = pf_queue->size -
> > xe_pagefault_entry_size();
> > +       else
> > +               pf_queue->tail -= xe_pagefault_entry_size();
> > +       spin_unlock_irq(&pf_queue->lock);
> > +}
> > +
> >  static bool xe_pagefault_queue_pop(struct xe_pagefault_queue
> > *pf_queue,
> >                                    struct xe_pagefault *pf)
> >  {
> > @@ -259,7 +281,11 @@ static void xe_pagefault_queue_work(struct
> > work_struct *w)
> >                         continue;
> >  
> >                 err = xe_pagefault_service(&pf);
> > -               if (err) {
> > +               if (err == -EAGAIN) {
> > +                       xe_pagefault_queue_retry(pf_queue, &pf);
> > +                       queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> > +                       break;
> > +               } else if (err) {
> >                         xe_pagefault_print(&pf);
> >                         xe_gt_dbg(pf.gt, "Fault response:
> > Unsuccessful %pe\n",
> >                                   ERR_PTR(err));
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 6e5d9ce7c76e..069ede2c7991 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -306,8 +306,19 @@ static void
> > xe_svm_garbage_collector_work_func(struct work_struct *w)
> >         struct xe_vm *vm = container_of(w, struct xe_vm,
> >                                         svm.garbage_collector.work);
> >  
> > -       guard(rwsem_read)(&vm->lock);
> > -       xe_svm_garbage_collector(vm);
> > +       /*
> > +        * We can't block threaded prefetches from completing.
> > down_read() can
> > +        * block on a pending down_write(), so without a trylock
> > here, we could
> > +        * deadlock, since the page fault workqueue is shared with
> > prefetches,
> > +        * prefetches flush work items onto the same workqueue, and a
> > +        * down_write() could be pending.
> > +        */
> > +       if (down_read_trylock(&vm->lock)) {
> > +               xe_svm_garbage_collector(vm);
> > +               up_read(&vm->lock);
> > +       } else {
> > +               queue_work(vm->xe->usm.pf_wq, &vm-
> > >svm.garbage_collector.work);
> > +       }
> >  }
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > @@ -1148,5 +1159,5 @@ int xe_devm_add(struct xe_tile *tile, struct
> > xe_vram_region *vr)
> >  void xe_svm_flush(struct xe_vm *vm)
> >  {
> >         if (xe_vm_in_fault_mode(vm))
> > -               flush_work(&vm->svm.garbage_collector.work);
> > +               __flush_workqueue(vm->xe->usm.pf_wq);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 3211827ef6d7..147b900b1f0b 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2962,57 +2962,132 @@ static int check_ufence(struct xe_vma *vma)
> >         return 0;
> >  }
> >  
> > -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> > +struct prefetch_thread {
> > +       struct work_struct work;
> > +       struct drm_gpusvm_ctx *ctx;
> > +       struct xe_vma *vma;
> > +       struct xe_svm_range *svm_range;
> > +       struct xe_tile *tile;
> > +       u32 region;
> > +       int err;
> > +};
> > +
> > +static void prefetch_thread_func(struct prefetch_thread *thread)
> >  {
> > -       bool devmem_possible = IS_DGFX(vm->xe) &&
> > IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> > -       struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > +       struct xe_vma *vma = thread->vma;
> > +       struct xe_vm *vm = xe_vma_vm(vma);
> > +       struct xe_svm_range *svm_range = thread->svm_range;
> > +       u32 region = thread->region;
> > +       struct xe_tile *tile = thread->tile;
> >         int err = 0;
> >  
> > -       struct xe_svm_range *svm_range;
> > +       guard(mutex)(&svm_range->lock);
> > +
> > +       if (xe_svm_range_is_removed(svm_range)) {
> > +               thread->err = -ENODATA;
> > +               return;
> > +       }
> > +
> > +       if (!region) {
> > +               xe_svm_range_migrate_to_smem(vm, svm_range);
> > +       } else if (xe_svm_range_needs_migrate_to_vram(svm_range, vma,
> > region)) {
> > +               err = xe_svm_alloc_vram(tile, svm_range, thread-
> > >ctx);
> > +               if (err) {
> > +                       drm_dbg(&vm->xe->drm,
> > +                               "VRAM allocation failed, retry from
> > userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> > +                               vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > +                       thread->err = -ENODATA;
> > +                       return;
> > +               }
> > +               xe_svm_range_debug(svm_range, "PREFETCH - RANGE
> > MIGRATED TO VRAM");
> > +       }
> > +
> > +       err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
> > +       if (err) {
> > +               drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u,
> > gpusvm=%p, errno=%pe\n",
> > +                       vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> > +               if (err == -EOPNOTSUPP || err == -EFAULT || err == -
> > EPERM)
> > +                       err = -ENODATA;
> > +               thread->err = err;
> > +               return;
> > +       }
> > +
> > +       xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES
> > DONE");
> > +}
> > +
> > +static void prefetch_work_func(struct work_struct *w)
> > +{
> > +       struct prefetch_thread *thread =
> > +               container_of(w, struct prefetch_thread, work);
> > +
> > +       prefetch_thread_func(thread);
> > +}
> > +
> > +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
> > *vops,
> > +                          struct xe_vma_op *op)
> > +{
> > +       struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > +       u32 region = op->prefetch_range.region;
> >         struct drm_gpusvm_ctx ctx = {};
> > -       struct xe_tile *tile;
> > +       struct prefetch_thread stack_thread;
> > +       struct xe_svm_range *svm_range;
> > +       struct prefetch_thread *prefetches;
> > +       bool sram = region_to_mem_type[region] == XE_PL_TT;
> > +       struct xe_tile *tile = sram ? xe_device_get_root_tile(vm->xe)
> > :
> > +               &vm->xe->tiles[region_to_mem_type[region] -
> > XE_PL_VRAM0];
> >         unsigned long i;
> > -       u32 region;
> > +       bool devmem_possible = IS_DGFX(vm->xe) &&
> > +               IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> > +       bool skip_threads = op->prefetch_range.ranges_count == 1 ||
> > sram ||
> 
> Starting to work through these.. shouldn't we also allow the user to
> opportunistically skip this (cgroup/sysfs/etc)? I realize the
> microbenchmark shows some improvement, but some of the workloads might

Prefetch without this on tip is so slow, no one would ever use it.

> also be much more heavy on the CPU side and we don't want to throttle
> that with the extra kernel threads if they aren't heavy on the fault
> side.
> 

The next patch adds this, via debugfs. We could make it a bit more
offical via sysfs or configfs eventually.

Also once we land THP device pages, all we need is 2 threads on BMG as
the CPU time of a 2M prefetch goes from ~350us to 10us. This should
scale to a CPU <-> GPU bus 8x faster - by scale I mean we can hit peak
bandwidth on the bus. Also once THP device pages land, most of what
prefetch threads are doing is just sleeping waiting for the copy to
complete, so CPU is free to do other things. Hopefully we that in 6.19
timeframe.

Matt 

> Thanks,
> Stuart
> 
> > +               !(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
> > +       struct prefetch_thread *thread = skip_threads ? &stack_thread
> > : NULL;
> > +       int err = 0, idx = 0;
> >  
> >         if (!xe_vma_is_cpu_addr_mirror(vma))
> >                 return 0;
> >  
> > -       region = op->prefetch_range.region;
> > +       if (!skip_threads) {
> > +               prefetches = kvmalloc_array(op-
> > >prefetch_range.ranges_count,
> > +                                           sizeof(*prefetches),
> > GFP_KERNEL);
> > +               if (!prefetches)
> > +                       return -ENOMEM;
> > +       }
> >  
> >         ctx.read_only = xe_vma_read_only(vma);
> >         ctx.devmem_possible = devmem_possible;
> >         ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> >  
> > -       /* TODO: Threading the migration */
> >         xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > -               guard(mutex)(&svm_range->lock);
> > -
> > -               if (xe_svm_range_is_removed(svm_range))
> > -                       return -ENODATA;
> > -
> > -               if (!region)
> > -                       xe_svm_range_migrate_to_smem(vm, svm_range);
> > +               if (!skip_threads) {
> > +                       thread = prefetches + idx++;
> > +                       INIT_WORK(&thread->work, prefetch_work_func);
> > +               }
> >  
> > -               if (xe_svm_range_needs_migrate_to_vram(svm_range,
> > vma, region)) {
> > -                       tile = &vm->xe-
> > >tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> > -                       err = xe_svm_alloc_vram(tile, svm_range,
> > &ctx);
> > -                       if (err) {
> > -                               drm_dbg(&vm->xe->drm, "VRAM
> > allocation failed, retry from userspace, asid=%u, gpusvm=%p,
> > errno=%pe\n",
> > -                                       vm->usm.asid, &vm-
> > >svm.gpusvm, ERR_PTR(err));
> > -                               return -ENODATA;
> > -                       }
> > -                       xe_svm_range_debug(svm_range, "PREFETCH -
> > RANGE MIGRATED TO VRAM");
> > +               thread->ctx = &ctx;
> > +               thread->vma = vma;
> > +               thread->svm_range = svm_range;
> > +               thread->tile = tile;
> > +               thread->region = region;
> > +               thread->err = 0;
> > +
> > +               if (skip_threads) {
> > +                       prefetch_thread_func(thread);
> > +                       if (thread->err)
> > +                               return thread->err;
> > +               } else {
> > +                       queue_work(vm->xe->usm.pf_wq, &thread->work);
> >                 }
> > +       }
> >  
> > -               err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> > -               if (err) {
> > -                       drm_dbg(&vm->xe->drm, "Get pages failed,
> > asid=%u, gpusvm=%p, errno=%pe\n",
> > -                               vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > -                       if (err == -EOPNOTSUPP || err == -EFAULT ||
> > err == -EPERM)
> > -                               err = -ENODATA;
> > -                       return err;
> > +       if (!skip_threads) {
> > +               for (i = 0; i < idx; ++i) {
> > +                       thread = prefetches + i;
> > +
> > +                       flush_work(&thread->work);
> > +                       if (thread->err && (!err || err == -ENODATA))
> > +                               err = thread->err;
> >                 }
> > -               xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET
> > PAGES DONE");
> > +               kvfree(prefetches);
> >         }
> >  
> >         return err;
> > @@ -3079,7 +3154,8 @@ static int op_lock_and_prep(struct drm_exec
> > *exec, struct xe_vm *vm,
> >         return err;
> >  }
> >  
> > -static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm,
> > struct xe_vma_ops *vops)
> > +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm,
> > +                                            struct xe_vma_ops *vops)
> >  {
> >         struct xe_vma_op *op;
> >         int err;
> > @@ -3089,7 +3165,7 @@ static int
> > vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
> >  
> >         list_for_each_entry(op, &vops->list, link) {
> >                 if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> > -                       err = prefetch_ranges(vm, op);
> > +                       err = prefetch_ranges(vm, vops, op);
> >                         if (err)
> >                                 return err;
> >                 }
> 
