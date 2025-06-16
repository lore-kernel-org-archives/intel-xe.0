Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699BEC71159
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 20:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE2910E459;
	Mon, 16 Jun 2025 20:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9+oUeQe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E4910E45D
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 20:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750107102; x=1781643102;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AydF0svH3eQUfBFTqH6QtFUU0OGNRuNd4jXkGXCDYfM=;
 b=f9+oUeQentY5TEN4kFmitRv52vzLWKLDgpzXn0vpoyX+EUhbToSVjOf7
 9Vl/CPb8aY6DRAwNJj7cSInjVF6oM8/nWrfqRRmtzvRw7k2f/BBTZF3Eg
 Y82ymgsyc4h7HYTT/TTpnTF8ii4AwBZ5JTSHiTMQJo7/3A0YVr+RjVZOG
 OerzWkB/GZUxd+UJGMPi+jPkjcwHyt67xTCI2DtsvyDCNe0QqlfXi7zHZ
 tBS5r1L9g2mIJNj/kYKkPe9jn87/jwbUVoUF9H90AvhnSt7QBb8InIJGz
 qbBIfq7QdNhWKIAd18oibAH8vur25EpFifttI4K/MHgazcWu87TOdft7G w==;
X-CSE-ConnectionGUID: aIPy8WyyRnGDserk4e7KMQ==
X-CSE-MsgGUID: Iz3b4i4dRF6SzkTPJiz8gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62870573"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="62870573"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 13:51:41 -0700
X-CSE-ConnectionGUID: HKFipclISQ2swnU8/vatlg==
X-CSE-MsgGUID: KIjfINXbQbakrEFlNWnIig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153535708"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 13:51:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 13:51:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 13:51:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.57)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 13:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUPs1YQnigCDnzYoemDA2hBywVsZeMJ75J4y/AC/XnX4KgIEgowkJBppWAu7C2RtlOzo3RVhIeCsDlqCEwo/ScLDxsFru2fe+lDave2OVvMMZAMcIwaRHmbEYBrzD3XeOpF2p1Y1TLW0bM9egMQiEt1LJrapg6WD7yHiqQhg6cAkZesvEaO3E0hEnV/w0k1IVfHiqEdEtMJv7jOsMYkXLOD9szQAC3lFl4oy+isYqyWpjpYiWb8/HCRtO/IYkO7RS/b1pU67QYZmIybTGnjN4/PC8exwHh/2tMXgL+26UUifE34Z9L8a7HcZUDz5mvg63doQbtak9VJdnNiXPU+Aig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJRhCCPwEeHurEAs1jmUspHDx2MECMknpQPvYXqeDU4=;
 b=uuWadA3L27qvqTKov7Y8l5Fne8UKkrVhXjBhyqaXslQa1syj4PYqqRsL1vcVz1i4FFfCtQ1O1ieeg5oqYIYGkfP4D8sz3bc4xew1+pfb8thIjrUTiaNHQ/kVlpPXP5ZaAdVyVr8dBTodo6PQDyvCRn3t+EHMEC751znBUrknoiW7oR/fxjJKyJJLZQI/hyp3X+iNQx2H6IM6lOMNkp0bVl/km/NKmGDSN3stL6YmU1Et718balfvMu8jXmJ9rUISEwS/ttST08nsUtcgxIgFn4zX2fXyGmqPfl6mN+SHJISiy/UQCwvavuzEEeQIZdmHClBrWFzU29ZRR4BZ+V+9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 20:51:37 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 20:51:36 +0000
Date: Mon, 16 Jun 2025 13:51:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 Convert xe_pci tests to parametrized tests (rev2)
Message-ID: <20250616205133.GA5080@mdroper-desk1.amr.corp.intel.com>
References: <20250613191938.1980-1-michal.wajdeczko@intel.com>
 <175008163656.82272.14925434094689102257@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175008163656.82272.14925434094689102257@1538d3639d33>
X-ClientProxiedBy: SA9PR13CA0165.namprd13.prod.outlook.com
 (2603:10b6:806:28::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: ed97f96e-467d-44f2-b5ae-08ddad1795be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pl4ii0CjMqyDENdA/k9yMvYaqnVhbfbqYCVQA/N9bi0977xRbgFFKeXNp3+1?=
 =?us-ascii?Q?3CK1iQKxuELuo32SOa2Q1mU2IKnheBgj3kijo83hwo5OsCw0HDQTEXVurgHD?=
 =?us-ascii?Q?P4cW2JiBVhUG9MtcpMSIs4SvtORB/6QIhQ75UFpEPfXsCwMlK+HZK57DHUnF?=
 =?us-ascii?Q?CvrVKFkAxzbBi8myb87wEvyLkqeFUHCT0872bxqSnE4w4neDME8FAlBnMHNQ?=
 =?us-ascii?Q?JFZ1DYvyoGxLWxUAzxVQl9nzE6k2qN84iY06s+Z4cb/nj/OF/8B/dXqoJWc6?=
 =?us-ascii?Q?EaaCmE72yt/FdHRX+AluzO5dtrhm3nO8d/mUMaFuwuK2QGkxa/1tMUiX6CWW?=
 =?us-ascii?Q?JeJmrxBDjso2pLPm7VqMwgBWt+SNqFaCzZSylNedHB3EvRsnSnliRktP9Axd?=
 =?us-ascii?Q?CahBEsK+yDOvVLqQWun5D+XNDqHf+WXTOnz6VQLXlMRuXd1sgmFEKamJ51eV?=
 =?us-ascii?Q?IRgFvZ7qEWq4vEtCxpEU3+zZm0wLjf5qpUyZfhXivgV9XximpcA7AmMvQIzC?=
 =?us-ascii?Q?+7r3SLgFplpO5AYU7iGy3Swi88U+5nQMgHrTkpH7tnSACWfS43v/alkc1Z7f?=
 =?us-ascii?Q?fPG2Z2bRlXqKFatl9eEKEl00JwJsq1IZYLGTz9Qszm3tQCjuLuri40IFd9k2?=
 =?us-ascii?Q?9CLkXm/BqSWOSJX3/VOTnOT7C8k/aWO0Xpdz/PThavYFul81iN1SMXnmPlID?=
 =?us-ascii?Q?h6HXj3ENsLoXBDAOvAeGnAKzCmSj9PPv18IXiPqf1gqsuHVhAL0BLnrP2xxF?=
 =?us-ascii?Q?TsovzskO6rTVfGAXDRIX3dWAYObUm5KwICzBxqKBbdaZ7SdSeF38rLXIONqA?=
 =?us-ascii?Q?Kz2BfNHA014h+g2eNtigLFeYDBE+m1Xqmky1vwC2lcLYhIueN9jK9A8RxlDF?=
 =?us-ascii?Q?e5qAuiPF3ms5Fyyci6HqB45vw+CG+Yfo+Z2cY0F0GbeAlLYNtXo5ainaPpqC?=
 =?us-ascii?Q?qjf4u34hY47SazLnlJ4uf1pi2rENqvKDfN+qD3Q7YhwbcAZx9tdlOaRSdZtb?=
 =?us-ascii?Q?MWWV6a1Djj7GD74GZQLEJJ+/hx2UHg533MiZvSNGM1CWmFTUFsrhxqtb/0BL?=
 =?us-ascii?Q?24NJ0lX7NRjplL5BXPFDYQHksHYCtf2nFG2tjOfhv+nETFqoxMID3x3ay7qn?=
 =?us-ascii?Q?VcF+a/PD0Q+NEBDWBSdbNuIgTvggdQSobiLtdtOGws/2kuP7amp+53b8mPeZ?=
 =?us-ascii?Q?OK3je0nOrkPMhH/8QmPEV6CDlJmf1LVshRINqDx3oydCOnDDcCMwjHYohbzj?=
 =?us-ascii?Q?wmljGKXU1kC9N/3wJpXBSRuLasmR0Ltb5a4B8JKXTofHskFcA0mDNkHTWXVi?=
 =?us-ascii?Q?b717uJYu9IVBG2POqzm9U3XIwbOI+fSNon8LMHxmSCk5HGQtTXD/rFp5e1/G?=
 =?us-ascii?Q?xnQ8y1I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cofJNAHAi2SGIdwpECae/SoZglA164s9Wgawjx2qljmOgw/A8s2Y4XRKLYj2?=
 =?us-ascii?Q?nJ9Vy1bWScJFUZesMzYsETrprOE3+X9ejHL/l8I+Blqr6vmxCZSCyLRo25pN?=
 =?us-ascii?Q?me/RXOhDGBUsx36AmXt6qnou8XJp4QFEIMeW1R/bZ8BSmzQ3MfSw6cAoVx4R?=
 =?us-ascii?Q?s1IPhx+0QILtpUJq7vvcx1vDjRT+V2YUVY07vH22mBV8Afc0NinKA+6tgfTZ?=
 =?us-ascii?Q?S1vEER6RcvEKEjkFb+Tke9jaBbCSQ5c1v11+rk0xBbXtYNewgsTPLP4q4NJh?=
 =?us-ascii?Q?aYLiFoUrpezbalbeqOpvftn6dtBnwmmgQGu2EgEmVYUmHxJo9O0v5w+q+cya?=
 =?us-ascii?Q?dF34JVjCjfXihxMC8Ka6GkKybbIi719elpUcBvDfKnear8MR0l8/OcR0L5a0?=
 =?us-ascii?Q?Yud1wL34SkTD2vmKEf/hQR74MXGx34LDvN2tKi3iMjjFGQf7nDJ1awAk7XnA?=
 =?us-ascii?Q?P2uZQqOvMv/QSHdji5xm/6gRgnbJGhCfMzHVoTzTrZ73wH3hwpXGqJwLW9Xl?=
 =?us-ascii?Q?/4KXvrh/L12mhbnyOAOCzsTk7fKYsTBAywZ33/WSDJax1peDMoZKfVy5YEtj?=
 =?us-ascii?Q?GaSbrHINGFDHC3o2SxyNUgAXebyEFJYjYKWr/paCcKj+LvEoCMhYfG12SfpS?=
 =?us-ascii?Q?zC4DiL/DQYk8/eiy0xhkiZ3qUcxEAunWcp+/TGhSLfSqXMTNwf0hKsHSx+Qg?=
 =?us-ascii?Q?hgNDta5yWfDpEOUg9SEolZu27GXLQA9LSuj4AmB2QbJ2xLUK09Q7bRlGDmfC?=
 =?us-ascii?Q?KVV4zhsPd9gV4j0bh2E9/Sra0t9JEDaLsOaidpaWzMMkJnGoRQjSA6tiUxD1?=
 =?us-ascii?Q?0it3GJNBU0uSx1s5jmeDJFEkeuPpqlBd9pd1ai1/2rj+Nd6amK01G+DaDtP9?=
 =?us-ascii?Q?kX3AqnUWh2MWt3CVY2kcfZ3Q3J5/fw5R9WXQD7GEdKOEt27UCdzhQ3Ye/r/f?=
 =?us-ascii?Q?w+bXZ5KIbOCWzMAru1AbdV7iNJ+chZU+ktTsf4vCNpki3p8EGXo2BzlGBzk3?=
 =?us-ascii?Q?P+9K5FYYiDjfX45IM0lWxEdvkTVqdSHbpbxFj4PcL6hZuRCgsHeb0/lAc9cD?=
 =?us-ascii?Q?W/s6+uJgl/vowo2GKewlkOOXoH/O6ufAl/0PYlViegRUa+uQDY5gs1qP92De?=
 =?us-ascii?Q?uZmu8VXzKjbbbnForBZVhmJ8dGX/d5V4OTEl/5TudPSlVxDCefcM1YOAj3Hl?=
 =?us-ascii?Q?qNcG7+bD278mof3VY0+dVclZH8pX/fQhNqcpNgpg6V8RB/cUHw0HfXHg9s72?=
 =?us-ascii?Q?lrsm1Z5TRWqqzVHh+83CyXD3QEPw85TcHbXRkgMNapwOQLR9GfGjvD43broR?=
 =?us-ascii?Q?ieRfGaEbhY+w1pUu2WazF/fD2qpmdpy1eiCPel16GTgc5BbUirsaEsAivHjr?=
 =?us-ascii?Q?+1ncxpfu2FB+Ql9DrAXGd/8t/zW2sSEzksRG4A7qJPUX5nZOzHFt/P+BP327?=
 =?us-ascii?Q?HNuHVjeOFX/J3wzE4J+pzg9k7qlry3kVuwItgNPm5YsRI3WhUKcE5SxgtJ3z?=
 =?us-ascii?Q?gX0u487f/efuLZzgOlUMJOrxQVei8UstqYuCiFI2oOq4nUqz3rmABhbiERRi?=
 =?us-ascii?Q?JjIfHXbCjwGHqvgv1ipPFxx5WOjAxEjpB84wkJsBqG1gjPe7D4ZEDzz7i2sH?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed97f96e-467d-44f2-b5ae-08ddad1795be
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 20:51:36.6989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTjZVK1ocNrDonkA0hXNtN2Mbd+qEoFKVw2k6g6e3bfWTY0W5b8SCw1ZGg5e6rDRCGb5H/BMLfDPztwSmnG6wb/faLcswd4TspMi7oWLz88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
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

On Mon, Jun 16, 2025 at 01:47:16PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Convert xe_pci tests to parametrized tests (rev2)
> URL   : https://patchwork.freedesktop.org/series/150254/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889_FULL -> xe-pw-150254v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-150254v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-150254v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-150254v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-cm-userptr-invalidate:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-434/igt@xe_exec_threads@threads-cm-userptr-invalidate.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-433/igt@xe_exec_threads@threads-cm-userptr-invalidate.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
>     - shard-dg2-set2:     [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-434/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-433/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
> 
>   * igt@xe_oa@oa-exponents:
>     - shard-bmg:          [PASS][5] -> [TIMEOUT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-5/igt@xe_oa@oa-exponents.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-1/igt@xe_oa@oa-exponents.html
> 
>   * igt@xe_oa@oa-exponents@rcs-0:
>     - shard-bmg:          NOTRUN -> [TIMEOUT][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-1/igt@xe_oa@oa-exponents@rcs-0.html

None of the failures here are related to the kunit test changes in this
series.

Applied to drm-xe-next.  Thanks for the patches.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-150254v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-adlp:         [PASS][8] -> [FAIL][9] ([Intel XE#3908]) +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#316])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1407])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [PASS][13] -> [DMESG-FAIL][14] ([Intel XE#4543])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][15] ([Intel XE#4543])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1124])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1124]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#2191])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#2191])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#367])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#367])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +83 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2887])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#2907])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2907])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#3124])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][34] ([Intel XE#1727] / [Intel XE#3113])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2325])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#306])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#306])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#373])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2252])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][42] ([Intel XE#1178]) +2 other tests fail
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#3304])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2320])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2291]) +5 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#323])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2373])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-3/igt@kms_feature_discovery@display-2x.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2373])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][51] -> [FAIL][52] ([Intel XE#2882]) +3 other tests fail
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2316]) +10 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1421])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#886]) +2 other tests fail
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
>     - shard-adlp:         [PASS][58] -> [FAIL][59] ([Intel XE#2882]) +2 other tests fail
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#2049] / [Intel XE#2597])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-dp2:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][62] ([Intel XE#2049] / [Intel XE#2597])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible:
>     - shard-dg2-set2:     [PASS][63] -> [INCOMPLETE][64] ([Intel XE#2049]) +1 other test incomplete
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-435/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#455]) +4 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1401]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#455]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2293] / [Intel XE#2380])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2311]) +5 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4141]) +3 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#651]) +4 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#656])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656]) +4 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2313]) +5 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#653]) +4 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2340])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#1503])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-2/igt@kms_hdr@invalid-metadata-sizes.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#2925])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#4596])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#3309])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1489]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1489])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2893])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-adlp:         NOTRUN -> [FAIL][90] ([Intel XE#1874])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#3414] / [Intel XE#3904])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2330])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#1435])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@xe_create@create-big-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1062])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@xe_create@create-big-vram.html
> 
>   * igt@xe_eudebug@basic-vm-bind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#4837]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@xe_eudebug@basic-vm-bind.html
> 
>   * igt@xe_eudebug@basic-vm-bind-discovery:
>     - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#4837])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-discovery.html
> 
>   * igt@xe_eudebug@discovery-empty-clients:
>     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4837]) +1 other test skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@xe_eudebug@discovery-empty-clients.html
> 
>   * igt@xe_eudebug_sriov@deny-sriov:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#4518])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@xe_eudebug_sriov@deny-sriov.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1392]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1392])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>     - shard-dg2-set2:     [PASS][102] -> [SKIP][103] ([Intel XE#1392]) +4 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2322]) +2 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-rebind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#288]) +4 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#288])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
> 
>   * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#4943])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#4915]) +52 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck.html
> 
>   * igt@xe_exec_system_allocator@threads-many-mmap-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4943]) +5 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
>     - shard-lnl:          [PASS][110] -> [FAIL][111] ([Intel XE#4937])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
> 
>   * igt@xe_exec_system_allocator@twice-large-malloc-race-nomemset:
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#4915]) +4 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@xe_exec_system_allocator@twice-large-malloc-race-nomemset.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
>     - shard-lnl:          NOTRUN -> [ABORT][113] ([Intel XE#4757])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
> 
>   * igt@xe_oa@missing-sample-flags:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#2541] / [Intel XE#3573])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@xe_oa@missing-sample-flags.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [PASS][115] -> [DMESG-WARN][116] ([Intel XE#2953] / [Intel XE#4173])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-adlp-2/igt@xe_pm@s4-exec-after.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-3/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pmu@fn-engine-activity-load:
>     - shard-adlp:         NOTRUN -> [ABORT][117] ([Intel XE#5214])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-8/igt@xe_pmu@fn-engine-activity-load.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#4733]) +1 other test skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#944])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         [FAIL][120] ([Intel XE#3908]) -> [PASS][121] +1 other test pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][122] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][123] +1 other test pass
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-bmg:          [SKIP][124] ([Intel XE#2320] / [Intel XE#5042]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-bmg:          [SKIP][126] ([Intel XE#2291]) -> [PASS][127] +2 other tests pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][128] ([Intel XE#886]) -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-433/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>     - shard-bmg:          [SKIP][130] ([Intel XE#2316]) -> [PASS][131] +4 other tests pass
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][132] ([Intel XE#301]) -> [PASS][133] +4 other tests pass
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>     - shard-dg2-set2:     [FAIL][134] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][135] +1 other test pass
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-bmg:          [DMESG-WARN][136] ([Intel XE#3428] / [Intel XE#5208]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#455]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-bmg:          [SKIP][140] ([Intel XE#3012]) -> [PASS][141]
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:
>     - shard-adlp:         [DMESG-WARN][142] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][143] +1 other test pass
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - shard-bmg:          [DMESG-WARN][144] ([Intel XE#3428]) -> [PASS][145] +3 other tests pass
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-6/igt@kms_pm_rpm@basic-rte.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-7/igt@kms_pm_rpm@basic-rte.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#1392]) -> [PASS][147] +3 other tests pass
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
>     - shard-lnl:          [FAIL][148] ([Intel XE#5018]) -> [PASS][149]
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
>     - shard-dg2-set2:     [DMESG-WARN][150] ([Intel XE#3876]) -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [ABORT][152] ([Intel XE#1794]) -> [PASS][153]
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         [ABORT][154] ([Intel XE#1794]) -> [PASS][155]
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][156] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][157] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-bmg:          [SKIP][158] ([Intel XE#2341]) -> [FAIL][159] ([Intel XE#1178])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-8/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-bmg:          [FAIL][160] ([Intel XE#1178]) -> [SKIP][161] ([Intel XE#2341])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][162] ([Intel XE#2312]) -> [SKIP][163] ([Intel XE#2311]) +11 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][164] ([Intel XE#2311]) -> [SKIP][165] ([Intel XE#2312]) +18 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][166] ([Intel XE#4141]) -> [SKIP][167] ([Intel XE#2312]) +5 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][168] ([Intel XE#2312]) -> [SKIP][169] ([Intel XE#4141]) +5 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][170] ([Intel XE#2312]) -> [SKIP][171] ([Intel XE#2313]) +6 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][172] ([Intel XE#2313]) -> [SKIP][173] ([Intel XE#2312]) +18 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [FAIL][174] ([Intel XE#1729]) -> [SKIP][175] ([Intel XE#362])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_pmu@engine-activity-load:
>     - shard-adlp:         [DMESG-WARN][176] ([Intel XE#5214]) -> [ABORT][177] ([Intel XE#5214]) +1 other test abort
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-adlp-1/igt@xe_pmu@engine-activity-load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-1/igt@xe_pmu@engine-activity-load.html
> 
>   * igt@xe_pmu@engine-activity-most-load-idle:
>     - shard-adlp:         [ABORT][178] ([Intel XE#5214]) -> [DMESG-WARN][179] ([Intel XE#5214]) +3 other tests dmesg-warn
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889/shard-adlp-1/igt@xe_pmu@engine-activity-most-load-idle.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/shard-adlp-3/igt@xe_pmu@engine-activity-most-load-idle.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
>   [Intel XE#5042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5042
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889 -> xe-pw-150254v2
> 
>   IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3253-707bd88d5b799c00ff5be9634b2f4e4ece79d889: 707bd88d5b799c00ff5be9634b2f4e4ece79d889
>   xe-pw-150254v2: 150254v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150254v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
