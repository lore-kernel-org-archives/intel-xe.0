Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C795C7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 16:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E150F10E2D8;
	Thu, 26 Jun 2025 16:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZt0aMYi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD8610E2D8
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750956329; x=1782492329;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4U1v8tAzdmGcCceAJl2SK8RM7rL8NJrri0bnHJO5vVk=;
 b=FZt0aMYijvR8RJbfHd2Z8cRFnWP/8c4MnLJQ1XP4MxqS2YUuMFSUvntK
 CKfDGuARMYcnGbHL/i/t0AVKcXYdCEEYT7ElpYjyfFy5g2ph0pXp5717v
 dP0vNIwPNrs3P6ZQm0G/092izjj8SxTgH0f6zrIk+PH+1spUgn7ieTU+T
 INof7zgH3yzxCBy8dfnxSdzpIFDVF3Zxu0PQlPn+pJBwOZaHQV6ADzq32
 JTGIBTEBB+mG7NgpuAtW91VTJzYCInfh9HvfCeCOqbqm/KMuMgyUC67mj
 2lvbOzpldAHw6Y1JKOPac3j1YqnJ9PULsWIgn0EiGvCV7WJy2BWsODCQn A==;
X-CSE-ConnectionGUID: rS0gUnErTV66z6I2O8XSyw==
X-CSE-MsgGUID: VfDDmQexRmCx/oY8MWeOZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64322095"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="64322095"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 09:45:29 -0700
X-CSE-ConnectionGUID: eilC6WUKRBSCjDjVpV/yHw==
X-CSE-MsgGUID: jELEHL5SQ0WsHNVI4Y6kDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="151980806"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 09:45:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 09:45:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 09:45:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 09:45:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxNVdGxjZpUEFVCYjI6kX6C8vJCdNnndtZym1wu7QB8PRkq4mcWsoEvT2bTNXFmvUnYY0rzESQ/7r/uDQZqrL76ipjfYX6DlakFK+YWiCymJHuRC2GEn+wwMgMFYrKICYciYaHgR7Ui6SIKG0dwweoGWgsY7xKL8dMYVkl7wFttQ20/DumILXiFwr33gNPGG1kWw0s3aA4TNm0f4VJz68lb3Z5fKPZkz1kElXvwVk2332LR8jZmqjXNZITOkYivTv1+dVIPWpa+rEVMPac+Hb8Hl26HhGCGhDx4GS5mOo5pPOtIBbIW2rlviboN13lbFDRLWw2jglYcB0zC/bavgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOG3VYszS0uj0Ntb7+qNV9vqHo5uAX9/b0U3kpDWgtg=;
 b=POmKj9pXI2LdTnGdrR0ECsgoB79O7LjgwCIk2eTMqxag3zR75mMKysQz0WlHnnWeyFs1DcOwcVv1Me0KDzcnX04KjrNXbv//GtREV5OYvwzR439E7v2TuBH/VucT1vFThuIuupXXBwwHBYr0kw46+lbSv4T4xsdSyWsSMe0wNwt0YjXXJOXmHc4NnAhTgGzkBZk8k0bw8CZb0RxfeTGJ5RvtEsEBHElNwg6WvoDik5LgVB1BdIUtEeJ3rfkC31A43L9phV2h+rdUyjUV4nv5n6RnO29pFeo2sqeEMY6anbyJN0p1fTifmY9xoicqIPj169YNut6uOeA8ZXRNG0jmwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6827.namprd11.prod.outlook.com (2603:10b6:806:2a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Thu, 26 Jun
 2025 16:44:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 16:44:59 +0000
Date: Thu, 26 Jun 2025 09:46:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 1/2] drm/xe/guc: Enable extended CAT error reporting
Message-ID: <aF15b6ivF3VZlGGg@lstrano-desk.jf.intel.com>
References: <20250625205405.1653212-3-daniele.ceraolospurio@intel.com>
 <aFyMS/7ZBu+Gafm9@lstrano-desk.jf.intel.com>
 <1785c4a5-31db-4963-8f4e-4a693c740bd1@intel.com>
 <aFy8IhvCJG8ci6vR@lstrano-desk.jf.intel.com>
 <aFy8fLIMg3raxA/z@lstrano-desk.jf.intel.com>
 <bfe228ce-af2c-46ac-8054-aa3ec311f3e8@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bfe228ce-af2c-46ac-8054-aa3ec311f3e8@intel.com>
X-ClientProxiedBy: BY5PR20CA0004.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6827:EE_
X-MS-Office365-Filtering-Correlation-Id: 82976c19-23fa-42d7-1628-08ddb4d0c9d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V3f3KhWzygYXq+VEsX69pSbKwAUp3R930Xvsvn3d6W9tQjnQQ6Z3HuoPKbkp?=
 =?us-ascii?Q?Up8tgL0Xxtt7VZU1/buKRUj10JgCSEqDM78ZndTQmmjgGJ4Tnb7VokWLSy8E?=
 =?us-ascii?Q?/5adXS13wIybYDUvZUTNQkbuZA1+n5+F8lnOpQn7CRe20oW5D60EiUGdfnDW?=
 =?us-ascii?Q?FyC9TVScyjM+/FBPifn/u/fBPAUDO14ZBAdm/xxUgEbGBVqSzPh1b/Dvr0vL?=
 =?us-ascii?Q?/BhF1D6bNMdchasDNIxk1g+Q7Rd5LwovzTl3StQfLzRbbIpTOsrSxUUpGegH?=
 =?us-ascii?Q?8CkwCa8uud/XcSChA/vaBQPyqH9rjeg5MXedE6T3ahoYx7dIWktTmdijZqRl?=
 =?us-ascii?Q?Gb1lJ/LK3HiVgLrVIFqtivo60n/lf8zIKd3xKfoHl9Ifd9JQJI09q4NbajGa?=
 =?us-ascii?Q?nyzk+t0YXqpdJ4yujSp9tbi2mqpgICHwkKIjWngi44o6PanuCMewkr/jkezC?=
 =?us-ascii?Q?9FO1UursPNP9Xl6FIoGHZfEjMOpfLoyZcB4kNXpkTKkljqA0U7Yg+A6evLuH?=
 =?us-ascii?Q?57d7pLd7okec01wpGnaoZbT5sHNj+bpbYSIydQ0mgx7YF2F5rg+woR0Y0KAs?=
 =?us-ascii?Q?aVGdrNj3xindrF0MjojSIA2qnnTU9Grr5iWSWth0D135LyXpS89BnoqF4tYz?=
 =?us-ascii?Q?+ESuc7mxf4Fh30NCKcwpT5nr4x73I2WRFctLYaQwdabfTm5S3d/P6d/Dp23o?=
 =?us-ascii?Q?5Tjx8L9M06W6ov/tpvv8/q8+1C+GQWFWjpJnPtdyt0NJQ+O2BrUtYevWnoLc?=
 =?us-ascii?Q?IAZI8g/gYYxO+bzpUly493HQRch36BtQSgJdcF0iNvpmAZqC4pW0fr6y1ePj?=
 =?us-ascii?Q?A4tDcCuuTdRulfkLxiuAKfpjcb/wOqtiqcH4SFVH7qikTP753fOl/vXCWcEL?=
 =?us-ascii?Q?Uvdj145LBPTjgjjBVMTS7g6G1YmMOYkotF84fXGcAvQ092d1l6cHLOSf5fX4?=
 =?us-ascii?Q?S+qFTe+ZtRcVHY85wMS9ATki4sr4zeEBUBnys9gnoMvGzVUn/pE26TioxzAg?=
 =?us-ascii?Q?nfoy0KGbKuRB3ZbN93D2iQWpf3YFQ+j3qEFaJLDOlolvTpsUnbpbeaMlUL7X?=
 =?us-ascii?Q?lDQHYlgAEXKWOsXep6ufEbbNoZoeBdKELGm6PMtUaz4rUPZZaBmZPNaHAAjE?=
 =?us-ascii?Q?AA5FCFVlqVuVpHd2T9Ukyw7t8Gz5vIfqv53azix88+70nb2xoTW1Sy2vGpn+?=
 =?us-ascii?Q?W4rms77N830js6CUjwgeskTTxRanyFSrj5IHex0to9rh5KauvpLZDtG8oJ1t?=
 =?us-ascii?Q?owZGCuv0QOL3QSotOcHwYyJveyfMxBT1xNm5jc/L5mV00LL+D80Wm8vu1pn7?=
 =?us-ascii?Q?RnV3HMzoGfzGzmAlusUeXX7/3wqizguYLfZ4JDrU5pQnunQscj0ObKtnQEKx?=
 =?us-ascii?Q?nBdiQBJm3hrUFnEap/nnvOKL3IAK5IXEuvPUDsP/OmXl9OKN2T7jGveJHvZd?=
 =?us-ascii?Q?BUznNOlARAI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z1l0CFpvi02UVGS52oauFUgnLgi/wD2331pP6M9d+gT6DYDSTO1GLSc5JH4d?=
 =?us-ascii?Q?RkUm/UmjaXHoKIwT4+BygnTDNX8N1lIbLQ1SKurwL/oZWhH7eLEfuukt33z4?=
 =?us-ascii?Q?ldx6ra5zeWtBYyRWu3FY+l7NeerHpGTdYTUN3uCAyzUWIk8iLkOns2c7vb8l?=
 =?us-ascii?Q?hxdc63IH4+udAqwWxAryusBYz2Jjilr3+qeD9Bv901dwshXu13mLRRzt6nAa?=
 =?us-ascii?Q?opl+t/92HR+hj3ms6OvF6F7K9uKZz0jfYVQhW0CLlLpt+sjQEhv+f6ru96r2?=
 =?us-ascii?Q?OkhQK0MNiw0dewq/kDujSL/Tuo3w+9gSKfY8xEScvQnZFZHiBchsilcmMFAG?=
 =?us-ascii?Q?vzZ/stsbAMCmGzLArAr0OS5pFbv1EiEtqfXAfU2ophx0Xy3iV762wGekXTz4?=
 =?us-ascii?Q?GLdt4F7dmsIQlFDmywu2HFnfziK9sWJ+MtTRfpxzUtBRHkZ+i/bfRb6hwPXg?=
 =?us-ascii?Q?WiIbQQZsf29HBIHoY/1nrxmdAtnnfoA6sXwC7GfpKvmT1Fl6xlYOr12keEwf?=
 =?us-ascii?Q?1gaExRmrwJM1Rjz2wBhNPFoRaXs2KLp0Gz46onpLVmxJSnQzF7OosHTG7ttM?=
 =?us-ascii?Q?KfShlOixmKLYqKST4IU6pEHYfhwaPYP531csrAKaoDCBv2N+8P/HM6CXgM2+?=
 =?us-ascii?Q?Ghif4sSWLvj1UV9+ucLhvTLgIVqX8PAp463uBHtET2mxO+Ih/fi2Vv9BCEs5?=
 =?us-ascii?Q?zdXN1jZo5Hk9InL1Xd77L15V8tB8i36KvU2YJcAzzQhWv/wVCs78rWHlYdF+?=
 =?us-ascii?Q?mp3yJVUX3AqwCwJ1fm6s44gKEd/mpE8VkjOECtS+5//oLPvyMxRgfWMep+oH?=
 =?us-ascii?Q?qkwQmd3NQPcpDH7550vwX/N5M1P1XQkzhbmSXymuUgw7qAh5bJtC3AgpmfzA?=
 =?us-ascii?Q?wOmztQLU3T8bS35koyNtbrpHri13vN4t3wmm2mqVI7zO/ImI4J5vNm4m6YOK?=
 =?us-ascii?Q?I5ZnnyXudD76KgN5nFzyZHX9d863oet+F8YfmqOKRbRVHvcMAb0m4514BZv2?=
 =?us-ascii?Q?vzk5O0pbnWyWLLEEL1ZwaahsJz6HBvLk/GUI7yMEhKWT9MgXxpV2aVGIdqAT?=
 =?us-ascii?Q?IyNLc5D0uJF0mObSa0AnlPNRUj7YXEi7j00eAhzdCsn0xji6cCCW3jEWuXSI?=
 =?us-ascii?Q?m8Z7uVhxscOuyPc22w0MUXtqbznbJlFru667v/iJuRwAC6lMqpWU8Ohp6Gwe?=
 =?us-ascii?Q?IP5p38rtrpwgpiosSJUyyZRjL8vggX8VBT1hWLmmjC3wojproWiv11+Ktxxf?=
 =?us-ascii?Q?qsu96TqQ0UbimZKEExjJiAOCFwp2WWILWAfDtUr6W4n/99gJvpwsGkWIyv/e?=
 =?us-ascii?Q?kdUEEZFZqC07m6RTXFMW4VaID2Nj4G6d/W9S7tiKq9dDA8DNfaWww89Qdzrh?=
 =?us-ascii?Q?iTgH3CosS3aanbMrCLrrlxLR6snvtawtyY34bZ3CtSBUQPibu6me8uuNoIEv?=
 =?us-ascii?Q?zbO7nrz7rRiHtL01C6XJZ8qBPW2w0OxBU/bVPIHXEevY1fcdiQgKm8fIcNAP?=
 =?us-ascii?Q?E68JAJ1NU7mRNEO1/lGg/ZVpArJkGoPJHSUjdtJrfnf0OG8TFQciTk0fM1Rr?=
 =?us-ascii?Q?VdZ40MIW2YdXs4rHg71zHrJb+pnyFkkLJVxnYDn5pMK2MXVXVnheOGVFSncP?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82976c19-23fa-42d7-1628-08ddb4d0c9d9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 16:44:59.0907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDYYUMZDkuflSd3FdIXvKo8iO7d0umfU8vhHgEvDK2X+m1/cKjxZQCkTRBdM1DsZIcIn8Z98qqfMJkHPQza1Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6827
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

On Thu, Jun 26, 2025 at 09:43:21AM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/25/2025 8:20 PM, Matthew Brost wrote:
> > On Wed, Jun 25, 2025 at 08:18:58PM -0700, Matthew Brost wrote:
> > > On Wed, Jun 25, 2025 at 05:05:59PM -0700, Daniele Ceraolo Spurio wrote:
> > > > 
> > > > On 6/25/2025 4:54 PM, Matthew Brost wrote:
> > > > > On Wed, Jun 25, 2025 at 01:54:06PM -0700, Daniele Ceraolo Spurio wrote:
> > > > > > On newer HW (Xe2 onwards + PVC) it is possible to get extra information
> > > > > > when a CAT error occurs, specifically a dword reporting the error type.
> > > > > > To enable this extra reporting, we need to opt-in with the GuC, which is
> > > > > > done via a specific per-VF feature opt-in H2G.
> > > > > > 
> > > > > > On platforms where the HW does not support the extra reporting, the GuC
> > > > > > will set the type to 0xdeadbeef, so we can keep the code simple and
> > > > > > opt-in to the feature on every platform and then just discard the data
> > > > > > if it is invalid.
> > > > > > 
> > > > > > Note that on native/PF we're guaranteed that the opt in is available
> > > > > > because we don't support any GuC old enough to not have it, but if we're
> > > > > > a VF we might be running on a non-XE PF with an older GuC, so we need to
> > > > > > handle that case. We can re-use the invalid type above to handle this
> > > > > > scenario the same way as if the feature was not supported in HW.
> > > > > > 
> > > > > > Given that this patch is the first user of the guc_buf_cache on native
> > > > > > and VF, it also extends that feature to non-PF use-cases.
> > > > > > 
> > > > > > v2: simpler print for the error type (John), rebase
> > > > > > v3: use guc_buf_cache instead of new alloc, simpler doc (Michal)
> > > > > > 
> > > > > > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > > > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> #v1
> > > > > > Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
> > > > > >    drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 15 +++++++
> > > > > >    drivers/gpu/drm/xe/xe_guc.c              | 56 ++++++++++++++++++++++++
> > > > > >    drivers/gpu/drm/xe/xe_guc.h              |  1 +
> > > > > >    drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++++--
> > > > > >    drivers/gpu/drm/xe/xe_uc.c               |  4 ++
> > > > > >    6 files changed, 93 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > > > index ff4f412c28d8..81eb046aeebf 100644
> > > > > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > > > > @@ -142,6 +142,7 @@ enum xe_guc_action {
> > > > > >    	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> > > > > >    	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> > > > > >    	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
> > > > > > +	XE_GUC_ACTION_OPT_IN_FEATURE_KLV = 0x550E,
> > > > > >    	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
> > > > > >    	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
> > > > > >    	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
> > > > > > @@ -271,4 +272,7 @@ enum xe_guc_g2g_type {
> > > > > >    #define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
> > > > > >    #define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
> > > > > > +/* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
> > > > > > +#define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
> > > > > > +
> > > > > >    #endif
> > > > > > diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > > > > > index 7de8f827281f..5b2502bec2dc 100644
> > > > > > --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > > > > > +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> > > > > > @@ -16,6 +16,7 @@
> > > > > >     *  +===+=======+==============================================================+
> > > > > >     *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
> > > > > >     *  |   |       |   - `GuC Self Config KLVs`_                                  |
> > > > > > + *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
> > > > > >     *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
> > > > > >     *  |   |       |   - `GuC VF Configuration KLVs`_                             |
> > > > > >     *  |   |       |                                                              |
> > > > > > @@ -124,6 +125,20 @@ enum  {
> > > > > >    	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
> > > > > >    };
> > > > > > +/**
> > > > > > + * DOC: GuC Opt In Feature KLVs
> > > > > > + *
> > > > > > + * `GuC KLV`_ keys available for use with OPT_IN_FEATURE_KLV
> > > > > > + *
> > > > > > + *  _`GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE` : 0x4001
> > > > > > + *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
> > > > > > + *      containing the type of the CAT error. On HW that does not support
> > > > > > + *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
> > > > > > + */
> > > > > > +
> > > > > > +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
> > > > > > +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
> > > > > > +
> > > > > >    /**
> > > > > >     * DOC: GuC VGT Policy KLVs
> > > > > >     *
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > > > index 209e5d53c290..4a7c467ad669 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > > > @@ -29,6 +29,7 @@
> > > > > >    #include "xe_guc_db_mgr.h"
> > > > > >    #include "xe_guc_engine_activity.h"
> > > > > >    #include "xe_guc_hwconfig.h"
> > > > > > +#include "xe_guc_klv_helpers.h"
> > > > > >    #include "xe_guc_log.h"
> > > > > >    #include "xe_guc_pc.h"
> > > > > >    #include "xe_guc_relay.h"
> > > > > > @@ -570,6 +571,57 @@ static int guc_g2g_start(struct xe_guc *guc)
> > > > > >    	return err;
> > > > > >    }
> > > > > > +static int __guc_opt_in_features_enable(struct xe_guc *guc, u64 addr, u32 num_dwords)
> > > > > > +{
> > > > > > +	u32 action[] = {
> > > > > > +		XE_GUC_ACTION_OPT_IN_FEATURE_KLV,
> > > > > > +		lower_32_bits(addr),
> > > > > > +		upper_32_bits(addr),
> > > > > > +		num_dwords
> > > > > > +	};
> > > > > > +
> > > > > > +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> > > > > > +}
> > > > > > +
> > > > > > +#define OPT_IN_MAX_DWORDS 16
> > > > > > +int xe_guc_opt_in_features_enable(struct xe_guc *guc)
> > > > > > +{
> > > > > > +	struct xe_device *xe = guc_to_xe(guc);
> > > > > > +	CLASS(xe_guc_buf, buf)(&guc->buf, OPT_IN_MAX_DWORDS);
> > > > > > +	u32 count = 0;
> > > > > > +	u32 *klvs;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	if (!xe_guc_buf_is_valid(buf))
> > > > > > +		return -ENOBUFS;
> > > > > > +
> > > > > > +	klvs = xe_guc_buf_cpu_ptr(buf);
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * The extra CAT error type opt-in was added in GuC v70.17.0, which maps
> > > > > > +	 * to compatibility version v1.7.0.
> > > > > > +	 * Note that the GuC allows enabling this KLV even on platforms that do
> > > > > > +	 * not support the extra type; in such case the returned type variable
> > > > > > +	 * will be set to a known invalid value which we can check against.
> > > > > > +	 */
> > > > > > +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
> > > > > > +		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
> > > > > > +
> > > > > > +	if (count) {
> > > > > > +		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
> > > > > > +
> > > > > > +		ret = __guc_opt_in_features_enable(guc, xe_guc_buf_flush(buf), count);
> > > > > > +		if (ret < 0) {
> > > > > > +			xe_gt_err(guc_to_gt(guc),
> > > > > > +				  "failed to enable GuC opt-in features: %pe\n",
> > > > > > +				  ERR_PTR(ret));
> > > > > > +			return ret;
> > > > > > +		}
> > > > > > +	}
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > >    static void guc_fini_hw(void *arg)
> > > > > >    {
> > > > > >    	struct xe_guc *guc = arg;
> > > > > > @@ -767,6 +819,10 @@ int xe_guc_post_load_init(struct xe_guc *guc)
> > > > > >    	xe_guc_ads_populate_post_load(&guc->ads);
> > > > > > +	ret = xe_guc_opt_in_features_enable(guc);
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > > +
> > > > > >    	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
> > > > > >    		ret = guc_g2g_start(guc);
> > > > > >    		if (ret)
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > > > > > index 58338be44558..4a66575f017d 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > > > > @@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
> > > > > >    int xe_guc_upload(struct xe_guc *guc);
> > > > > >    int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> > > > > >    int xe_guc_enable_communication(struct xe_guc *guc);
> > > > > > +int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> > > > > >    int xe_guc_suspend(struct xe_guc *guc);
> > > > > >    void xe_guc_notify(struct xe_guc *guc);
> > > > > >    int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > index 26c6c71dc91a..32548c931615 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > @@ -2103,12 +2103,16 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > > > > >    	struct xe_gt *gt = guc_to_gt(guc);
> > > > > >    	struct xe_exec_queue *q;
> > > > > >    	u32 guc_id;
> > > > > > +	u32 type = XE_GUC_CAT_ERR_TYPE_INVALID;
> > > > > > -	if (unlikely(len < 1))
> > > > > > +	if (unlikely(!len || len > 2))
> > > > > >    		return -EPROTO;
> > > > > >    	guc_id = msg[0];
> > > > > > +	if (len == 2)
> > > > > > +		type = msg[1];
> > > > > > +
> > > > > >    	if (guc_id == GUC_ID_UNKNOWN) {
> > > > > >    		/*
> > > > > >    		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
> > > > > > @@ -2122,8 +2126,14 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > > > > >    	if (unlikely(!q))
> > > > > >    		return -EPROTO;
> > > > > > -	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> > > > > > -		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > > > > > +	if (type != XE_GUC_CAT_ERR_TYPE_INVALID)
> > > > > > +		xe_gt_dbg(gt,
> > > > > > +			  "Engine memory CAT error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
> > > > > > +			  type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > > > > Do we define the type anywhere - I only see XE_GUC_CAT_ERR_TYPE_INVALID.
> > > > > 
> > > > > It would be useful if we had this defined somewhere in KMD headers or
> > > > > even more useful if type was accompanied by a string description.
> > > > The type is HW-defined, the GuC just forwards it. AFAICT the values are not
> > > > guaranteed to be the same across platforms (the Xe and Xe2 lists are
> > > > different, see bspec 54047 and 72187), so I don't think we want to maintain
> > > > a list in the driver.
> > > > 
> > > Maybe throw a comment a comment in here for bspec links when merging?
> > > 
> > s/bspec links/bspec refs/
> 
> Would this work for you:
> 
> "The type is HW-defined and changes based on platform, so we don't decode it
> in the kernel and only check if it is valid.
> See bspec 54047 and 72187 for details"
> 

This looks good. Thanks.

Matt

> I'd put it above the check for "type != XE_GUC_CAT_ERR_TYPE_INVALID"
> 
> Daniele
> 
> > 
> > Matt
> > 
> > > Matt
> > > 
> > > > Daniele
> > > > 
> > > > > Matt
> > > > > > +	else
> > > > > > +		xe_gt_dbg(gt,
> > > > > > +			  "Engine memory CAT error: class=%s, logical_mask: 0x%x, guc_id=%d",
> > > > > > +			  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> > > > > >    	trace_xe_exec_queue_memory_cat_error(q);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > > > > index 3a8751a8b92d..5c45b0f072a4 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > > > > @@ -165,6 +165,10 @@ static int vf_uc_init_hw(struct xe_uc *uc)
> > > > > >    	uc->guc.submission_state.enabled = true;
> > > > > > +	err = xe_guc_opt_in_features_enable(&uc->guc);
> > > > > > +	if (err)
> > > > > > +		return err;
> > > > > > +
> > > > > >    	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
> > > > > >    	if (err)
> > > > > >    		return err;
> > > > > > -- 
> > > > > > 2.43.0
> > > > > > 
> 
