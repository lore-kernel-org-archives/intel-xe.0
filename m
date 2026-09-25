Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16620C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 16:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B816510E097;
	Fri, 25 Sep 2026 16:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Azye64ys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1310E097
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790355113; x=1821891113;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RvBuHyMcvrIj8UdevrIn93ybkyZxa8jTFEocYXwqnLc=;
 b=Azye64ys4mjev7vL58x6jw+9qRzIzauO6CjkgJ3TAlXJQ6mx0t2Jwnv5
 sp+1GPIjiErZel/W73rLxwGyJGD77bAIRH1jW0eUjsyB2ZH7T8zBgG7Gk
 VZnCkYtGgS+waJW0SixGXLLSmi1rPDHMWAeQjLLZWoT3pLx9sEJ7ODuJa
 PFWohGH2MhG3b8eCSukF+lSo8veR53r42jybZiraLVqb3Dek7GyjnIKDQ
 6G1R8swqjTRgc9mBhVjdygWH+5yE+zm4wfIw7CyI2sbDzgDD4b0Y/5DFL
 hvkU5TqmXuEdnh/mb+90K/riCNW8OPm0M4EsYdjQsYWkmLGiz/cKgWIcv g==;
X-CSE-ConnectionGUID: csQCVlnhShGRD7saAPUB6A==
X-CSE-MsgGUID: lq2g5JFsQUOeE93Rni/1xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90204645"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90204645"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 09:51:53 -0700
X-CSE-ConnectionGUID: 6qT1EoyzSeSu1pVQYjEw6w==
X-CSE-MsgGUID: UlEz85J3SX6rbSg5+3AmyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="312299594"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 09:51:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 09:51:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 09:51:51 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 09:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gy3gXTx5EgJKOOOTLA6Ah9TeKvGpqNIzkpTDdM/X9pJAj3E9W3S5b6/PKWgDGurX57zJc5EBQqGGKMeLlRirAyCcopSwHb0GGFg1HxKz5pBVI64p7NAlGFldByHXSudTnI7N9VXRqSJuUgcnUVWEg7tW0WnCunN7KuyC4KWh4Jt8KxgnlfKPyepPic/avs6KwA5VaH6wrGPQo2H43IuMUc72X4lZFVsWXUEQYtDcwLTvMG0gg+Vob5svmQBICq0YKurTPZNkRrd6alIOho0hUBgOc7TKmBKec9vKunUKwxLePazqg6s63WY0ETIMQ/2N1emPF04r/dC6tBFqLRi0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq+HM7yhPsdhfKQqgOpB7vBXa6y/xxBOJQaR7BaUmbY=;
 b=fV74m+teH9E0ihPvxJdk5KXwuEc8okG0OCvWoz7WvGm4+ypaiTrqvxQa5IwxqWAFBoQdttpyLLyDWcc5Vp0GLQFX23UnEDKH20g6611RkRoUMKh7eTzMSud/yVw5kxreP63Vp5zzDcxtEgGWz3k6FhyuaafBMJ6FaZjRpkRVP028LLKEdM8b5f7T6i5hkWUS92oNCvX2zzQDmTuWp2cRMwP7b0e1CWov5ovTdAUWoxybxiVWbkabGFzwSduSH5/NcNaZpBbN7voyvUvk9EYtrd4QZY5yBhJJ6sBK9CRpv+Kfn92Fo6XlT8CN9CqKvpwKi2bWUDpE+fOOTMBzpnN9ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV4PPFA6977791B.namprd11.prod.outlook.com (2603:10b6:40f:fc02::22b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 16:51:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 16:51:50 +0000
Date: Fri, 25 Sep 2026 09:51:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe: Remove no-op ternary in emit_flush_invalidate()
Message-ID: <20260925165148.GJ730887@mdroper-desk1.amr.corp.intel.com>
References: <20260923171527.663537-1-shuicheng.lin@intel.com>
 <179023439774.201188.16946573147713318543@61270ab9df2a>
 <DM4PR11MB54564B760F772A5EA476603DEA802@DM4PR11MB5456.namprd11.prod.outlook.com>
 <f2435a35-48b3-4e47-92da-b10d1fad361e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f2435a35-48b3-4e47-92da-b10d1fad361e@intel.com>
X-ClientProxiedBy: SJ0PR13CA0115.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV4PPFA6977791B:EE_
X-MS-Office365-Filtering-Correlation-Id: 34949fed-6a78-40c7-d444-08df1b254b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|13003099007|6133799003|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: r2HfKUCCQGLDFbDfZwd8TzzV1VpoE9XMorFocRp3osHNfxe8im5p187unll7vn4cTgnZBk+IOzdHBEBKYOvUnMZ/GiHWkVZHZGM8Yv6xW5HGm2pppY60jCz2jJrvcuP5LpqymqRjnOM003t60EHkPNWZjNx9GxLUmyYqrJ2SMSuZfnaBEMSiWGCpf9EIsoee3vxbx1xk3fIwKYMC7iijmubAuoeWYt6TgUM2oGxQRQSyqMx1JTgSbfWQp6vBMdtCLju4Su1ZDqsx+fifxkvDspUKzm9xOE/nZ5FHjfInMN0+MGpY0lNyFPyVuFuY/SVxXsaIu+uC1JBdnjvtBEQDLrRUsmOjOHRfTGYqZL89E3D6OLjCATOL7iYcMkPto8vqt1aJr49GWsrUpsi0OWz0ix94KERorxtf4CdlsbX3AwSAYOEBHzba/lzZ9vWaBp6V8HWFV2KHZlvzUG4YRcNEQR6Rd81kvHV2AKt1mrf50PwU9YScX8v209PjXaQSPE/dguNNFl31L88ZNzbaiiaxzuXm89rp6aRsWIt0ctePD9ZvsWdYZdArmLwNe+ChygaQxIQozKm2/hUKg7TpW++4yiz1s8VOZe6fpxw5ZnLtZvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(13003099007)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QK/dJwgsMQOkdIYwg3iIg1suLXNkhoZ+EdxV9kIOQJubdT1XzMo3yiPo99o+?=
 =?us-ascii?Q?6pbwOO6FOeJUOUZM6ZiewYvVIWgSXB8hSJ7eHc+YYXkbg121j7Xc+PICCR7V?=
 =?us-ascii?Q?oVvFZSxiiJ7aGExQ29m7Jk3XMs0OqwvdC1D6ytMcGsDqxLOlT/0aIs52Xk4r?=
 =?us-ascii?Q?V/Lkb/9wXmqBzKzrio42n0zhjC4DPeAQrVwEtQX109w+LZQhVT555TF7Ir7y?=
 =?us-ascii?Q?9S3+1W8gQyb3XMmK4W5Ydg2RTtazphYtSCt6XBIXZ1YbnvaUytrDEKMdViVA?=
 =?us-ascii?Q?HgRwgqCYh9GnjGNS/9nUyyz2xxxMS/l0w7t4dsQIS6eDI1QVtRQcNocg9Yqn?=
 =?us-ascii?Q?lA0DCcvQ9bUDCsKueVn56+lHUOEelXWj5wf8eszDcAsy+fngfJ4YPEBtuXjS?=
 =?us-ascii?Q?NurXxQ82ZcydN+pkGl/NyP+XIYjuXQBCB2WdDi2keBQP2AWWI/ALRwJibP+H?=
 =?us-ascii?Q?HzYf0bxjnGFQClOocAckMwzN36mblrOUpke/OZabdL7GnazT5MSFQSjrH7UT?=
 =?us-ascii?Q?atgslrK1kM1dCR+E6cPrfxW4bCe7KvCJAJ7NARZxTAPWQxndoTfC0Xehag5q?=
 =?us-ascii?Q?dsq+kQ2y11aKKw6bV/o+m1cbWQrenPBLi+tR1C5BIe0bRK6HkLxJ5Ra2ID/9?=
 =?us-ascii?Q?3G4ABPyWzL2XR1KJEmUUUEE0T3EUTpsqIKEa1Vf1u/929ZfVSuMcBw0VcNjo?=
 =?us-ascii?Q?Jjujdf3Ur4JyYvPks4wD/CkJjjbmXlpRWIoM1RZsLNr+js9TYv2N5OMLeJ9A?=
 =?us-ascii?Q?N7ABKkZSRSemN3P4svg/hSuPxTkRNGKuGyBeCKDeCzAm8TtboOsU4skbLglO?=
 =?us-ascii?Q?TxgMPNtukyp/Ro4Z24PBxMaF5lGXhPABLyxP3caMCQnajKktmm4OF+zD8FZQ?=
 =?us-ascii?Q?OmHDw862ot58U5puC6zcEqKr/RyW6zUdRzK9Gc0YxCX6bONh69/OjPS4S+n+?=
 =?us-ascii?Q?uwrhstqbVMW6fAKCyf6/Y0rehv4KEXt5gcU4sSJS16H5EqKUIScTMulu2ofp?=
 =?us-ascii?Q?ZYaxDfX+9RraiC7lCKQzVQULKEMSMNX0Mt1C9MzIPz/zceNII5tSEyUZpr65?=
 =?us-ascii?Q?3+QRvScZQInYPCWpgiw4chx2Xr6fk/mO+S8yFJO1K140Bc6Tk0xWvx/7RoiZ?=
 =?us-ascii?Q?lLDaJZ0S1Nc5amq7Cck33rUMSOtetVFR4dCSfjUzUbrKNcx+4cpFyTUAhZkz?=
 =?us-ascii?Q?zEqCkVqXhe9UvE2Y9JPE081+cyRmxZRQjKdkaJQf0E4HwZG+Z7oKytWtstZK?=
 =?us-ascii?Q?ckHvhT5hVnTtB5oknb2QLHSVTV7NUYXOJnLH9Wjr6M7oA9gwTpOciA2zDln8?=
 =?us-ascii?Q?gkT1anXvfbNCb07FFtitmG+bd4nVjz91xO7bk6YWbxkuGnzH6TCYK+qdtXQY?=
 =?us-ascii?Q?sZoTkpMQ036afRK71lAl/UIx+yLvEQmTeiVx/IyQz0cb2TzIBiR0il1OX7LY?=
 =?us-ascii?Q?senkjnB6hOS5gw1/GyE61rbi+sdNKdR7k59Y5XuoT1i58L2fMufVn6cDrW47?=
 =?us-ascii?Q?JxSziPyDHOJ08h8upAERfB1CUmZK5zW/5G1D8KNoBuImgAX4C147i8RIZDDw?=
 =?us-ascii?Q?8IhdD6XvhFWNAGq0kIPcNcolUAGUDOkG+03AhYyp2JDwFAwL/2nHX0QFEqR8?=
 =?us-ascii?Q?sGC9Sx9FREqsjE0Y9XdCeQ/Xfq5n5KjxSswtBDJE2kAbPPj0wagnMY17AKlD?=
 =?us-ascii?Q?CNF+QLur9ggdO+KMtnlKj7ji3BwQFSUyTA9CMr5+MIvqaRaRmf7X/k9PvylM?=
 =?us-ascii?Q?XhEDtrrAGWfuwazzmau1GP6umbAsWrM=3D?=
X-Exchange-RoutingPolicyChecked: 3fugPR/xKBZZl8JPSO9h9ag2gcYxWHiW14Ne+c7EbHG8ePcQEloq5PPtawE+pOV3DDlJsJOV+w00AsghwgDIkP4pG0f2VmR1HMXMVBDwha1iqf0kfwDdhj41S+J0OO2pfTuvXWVAIhtedI8hOAaRg/z8AUcM0JjAHwPDufEJei8Q6J0WC6huD954lmlCPF04xMhXPa9ctXuzJHrn//o7z3fipBaYBaWA1WRJaJKIEKpGRV6rVKTj/YyeAPrLbWGPthq5hXPrqIKeNrh5G4QNgUK6IV3RXcjP1KC1VZGakRXmr5D8YEFw70fvGAOU+QbdvheHNdGLGqqDVymd5LGrmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34949fed-6a78-40c7-d444-08df1b254b39
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 16:51:50.1520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJC9JkGYV9TsjdQmJ3nJf8BZBZfHcbiIk7AEI2+bUmNNxIxukErAtkAoz6cwNKV+qm4EAvqGoh/d01XI0EQJ0Xcfs12lMx9zSTvhwd7jbP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPFA6977791B
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

On Fri, Sep 25, 2026 at 04:50:17PM +0100, Matthew Auld wrote:
> On 25/09/2026 16:41, Lin, Shuicheng wrote:
> > *>Patch Details*
> > 
> > *>Series:*
> > 
> > 	
> > 
> > drm/xe: Remove no-op ternary in emit_flush_invalidate()
> > 
> > *>URL:*
> > 
> > 	
> > 
> > https://patchwork.freedesktop.org/series/174833/ <https://
> > patchwork.freedesktop.org/series/174833/>
> > 
> > *>State:*
> > 
> > 	
> > 
> > failure
> > 
> > *>Details:*
> > 
> > 	
> > 
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174833v1/index.html
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174833v1/index.html>
> > 
> > 
> >          >Possible regressions
> > 
> >  >igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:
> > 
> >  >shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5813-
> > dd560c03f8fc40dbfadecfb761abce88b268be1d/shard-bmg-1/
> > igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html> -> ABORT
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174833v1/shard-bmg-1/
> > igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html> +1 other
> > test abort
> > 
> >  >igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
> > 
> >  >shard-ptl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
> > xe-pw-174833v1/shard-ptl-7/igt@kms_async_flips@async-flip-suspend-
> > resume@pipe-b-edp-1.html>
> > 
> >  >igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> > 
> >  >shard-ptl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5813-
> > dd560c03f8fc40dbfadecfb761abce88b268be1d/shard-ptl-1/igt@kms_big_fb@4-
> > tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> -> FAIL <https://
> > intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174833v1/shard-ptl-1/
> > igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
> > 
> >  >igt@kms_vblank@ts-continuation-dpms-suspend:
> > 
> >  >shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
> > intel-xe/xe-pw-174833v1/shard-bmg-9/igt@kms_vblank@ts-continuation-dpms-
> > suspend.html> +1 other test dmesg-warn
> > 
> >  >igt@kms_vblank@ts-continuation-suspend:
> > 
> >  >shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5813-
> > dd560c03f8fc40dbfadecfb761abce88b268be1d/shard-bmg-10/igt@kms_vblank@ts-
> > continuation-suspend.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/
> > tree/intel-xe/xe-pw-174833v1/shard-bmg-10/igt@kms_vblank@ts-
> > continuation-suspend.html> +1 other test dmesg-warn
> > 
> >  >igt@xe_compute@loop-duration-2s:
> > 
> >  >shard-ptl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
> > xe-pw-174833v1/shard-ptl-5/igt@xe_compute@loop-duration-2s.html>
> > 
> > There is no functional change in the patch. So these failures are not
> > related to the patch.
> > 
> > Thanks Matt Auld for the review. Pushed to drm-xe-next.
> 
> How did you push this btw? The change is in drm-xe-next, but not drm-tip
> AFAICT? Am I blind?

Speaking with Shuicheng offline, it sounds like he might have the
permissions necessary to push drm-xe-next, but still be missing the
permissions for drm-tip.  And dim redirects errors from the drm-tip push
to /dev/null for some reason, so if that push fails it's not obvious to
the user that something went wrong.

I just did a rebuild-tip to regenerate drm-tip, and that picked up the
latest drm-xe-next with his patch properly.  Shuicheng is going to try
to track down someone who can help get the push permissions sorted out
so that this doesn't happen again in the future.


Matt

> 
> > 
> > Best Regards
> > 
> > Shuicheng
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
