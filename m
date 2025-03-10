Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76641C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 21:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAC810E322;
	Mon, 10 Mar 2025 21:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="caY5tniT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C365C10E322
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 21:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741642872; x=1773178872;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kRC+dhMWk3LZMPmIZSDVwn5fCx7y19yrZHBuiBntZXc=;
 b=caY5tniT4elb2lALgsMzjW8HvzeMi7vyH4PnaHM+Xb84Xq7vCCFKCGpb
 ZD1yEu1IXdLQlaV0FXlzLbAtkEBlTKKcAb7hbJ+r+w29gTW7sh+GxfwFQ
 AEU7wopvijYjw3znwKqzMfWlaK3y6EJFCXHCrHz2ZlWNjOxNjjWttWdoe
 T2VPZcGxH58VGCSFfQZEn+XcI/Impa1y7pii+L2TrSuzYFq1YoW9cOOra
 0j8zQojQ2S/ENOvRLlAMxWo23zed57zdGG/MtC4j0OSCSaO9VJEWJauCX
 0n5ZD2N6rpV0FGT5ofCAvMW/Rgj9MCLn7gsYjswy0bl4s5wGQnh354bYM w==;
X-CSE-ConnectionGUID: niLW0tp0Qeq4JaRV9XUOjg==
X-CSE-MsgGUID: JD11gORfRr6/sKxEDeq4JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="53288008"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="53288008"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:41:07 -0700
X-CSE-ConnectionGUID: F21zUWKKRHOk3VzYdV2bKg==
X-CSE-MsgGUID: AbAy9mSiSKypOI2nY5ymOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="125000055"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2025 14:41:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Mar 2025 14:41:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 14:41:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 14:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQ3/bB3F+9AnP5MpYBaiAlPYO3zIjIZRwpE7oVrBTKKrK40fVsfC7hQqUCtAMy2Jin1nrPZOIXotzwfdnRnvPTUDPv82VMQGl5EjsdgP4KJlV1nFFUAMPas3yqgKjJg4h+jL1XMaxiSmXX16J/Urllvf9yMiwfhFAwLUsw29y379NFo8UzYz9cKhjJprPq6qUlZMpUaSsQcIPOykcBdjYD0ZbQVlxlgv2dTpKXtJSIq+G5+0fsryAvbIbOmdKbz/eD5HxuM6l3Dn/HbN5yZvf0fhjN3Pnsx4BC8TCM9sCKB4eNwj5ly4VkbYBNr83yfAHSNnkZC8M2b0G05XObgdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vI/Tvky6aZl/4okldvZ+m0Y9T/jtln/lTpfwvwP2JEw=;
 b=lyF1VpMdytrHBbQ6+waorH4sYHEZMDvPHiiqcHcE2zbW7cE9bX+pYqYF4zrZ1s27IqWKe5GSRzwzoTPi+vYnmFdm7xyuTQa9MPD3CqKXQmGwy3FIF6R1rWJBivnnXlhA0wsaUGZppS8/HzXJKgr0g7Szr5+wpENFp2Ly3EWaQDpelIMlkAsAKckoR7QUeTabcrCJvCsxTs9S3+aOqmd/zYrLZ+eM92Go3yhb7P8zK5pDt1eJ4I8PWjXhrP+ht75A2E4q0FTP8LnOgtpqu1AmQp2/zpiv5BuLeICDDyq3C+5lhkzEQZLDrUZjWjro2VIapAujh3OVguYPD8mCJuYA2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 21:40:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 21:40:49 +0000
Date: Mon, 10 Mar 2025 14:40:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
Message-ID: <20250310214046.GC3701377@mdroper-desk1.amr.corp.intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <txoeuk2zlt4gotrzltt3cjtzf2u4ebsjtjicvtsa4a4iz5o5eo@oqgl43byhdoe>
 <bb979148-ec3d-43c8-b73f-e22476f9a809@intel.com>
 <xgmworhkqvbo3gr6toa54occ7tanxjimgyx43pzoojf3li4wxf@7imyzpy5vurl>
 <7024396b-0356-4723-bc75-4cb6f6a05cd1@intel.com>
 <Z88WB7oI6hwbzteq@intel.com>
 <bc7caow57dfierr7fjyjcu3tanurj7z5zld5tkx4olj4i63x7y@ry364xf5ornr>
 <Z88d2u0ZLjDEQXTo@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z88d2u0ZLjDEQXTo@intel.com>
X-ClientProxiedBy: BYAPR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:a03:80::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b671de0-2ef6-4009-1342-08dd601c3918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FTr+UQPJSws58pA8xnX8UNgIa+C9UsLaolHZCDwGOMuN0SkGad6+zFC3Ii?=
 =?iso-8859-1?Q?S1chik5TPG5UMyfaoy2f975dqFz8sX0+kAWSB2QiuFBXrjVDsEPPDRhMGp?=
 =?iso-8859-1?Q?o5L36hyGYOqmNWiuu5MUeEQ5Gf13Hv4yB4PsxRI8YUbYR/RKmSb/Vcc5UX?=
 =?iso-8859-1?Q?lu6tRmO6OOmhlptpnRGQjvXkaTPOH649SJdH+QTYs4l0N/UJjvwiqo/QT9?=
 =?iso-8859-1?Q?e3xi0QQhuorvhaNMvTG+eXX33AJ8U4GavJjJzjeGnqoDvHn0xHEDBz8dWJ?=
 =?iso-8859-1?Q?n1tgaPdmX4FSaKnwNvmnYUg2GnF7uK9aO5IaNxn2P+1gLTBCfxaszqpaF7?=
 =?iso-8859-1?Q?JdtVWOyCFJ81e7b7u+IsPMYw8L3LSPNN/1cXKZ0jSF+0czVDIiiEIuYS3I?=
 =?iso-8859-1?Q?eWbkZ51fcGGGugEGl9wp2J0smx2BUQfyJ6CczRQtc25DaauXOkAzOop8z6?=
 =?iso-8859-1?Q?pdcGY2wnbU43CglHHJdfHLMHNUZhADDNsf2S9FFZZTGj/IY80wT0UuynGi?=
 =?iso-8859-1?Q?AqZzVSYDDbTK7H8/9njoEFHKx/QNiWFKolaRozZIRRb7bn4O70NLshnhR5?=
 =?iso-8859-1?Q?kIbiS0JlxCP60hY6Oi9UZvCekg+wbFunbOA6H5+UEZP1R9xtJI0qGs/6mo?=
 =?iso-8859-1?Q?wX5bcfFjrtW3Vef65DPiqirxJhSWE6gmlqg3IGmXyBULNE0S+r7KhtmHcN?=
 =?iso-8859-1?Q?W4GioYwAN139/SEfYA8Nk+tAKMI7ijRzz89vL/1TuZ1gijZCM/DuKzi2E3?=
 =?iso-8859-1?Q?7QdtyV8pZefrwNqsOAa9WwryPRikE3C9iY4+fKmgRdNInX4oZk50s50ZfV?=
 =?iso-8859-1?Q?hAjP4BfY30u96ZjUf0zNqi00Q9fv4iZ4HkyrdwmTotXmbh7nm65CJQcPud?=
 =?iso-8859-1?Q?sULwl7WMOp1oViwpuEfM038YJFs72+P2DAEF+DmQLoyJCnncLKL2EcIg1d?=
 =?iso-8859-1?Q?Nxk6qMbxe1g/mX1NdzVzXNO9pFfYCtVv5XY82NJWgweYoFiAlILDKEYFgc?=
 =?iso-8859-1?Q?PTTUekXr84i7bNqjPMMZEo/a5t7TMJFSON3xrX81bJm1GUP1m/NyiQSJ+t?=
 =?iso-8859-1?Q?8Sc52H6UwmdLlOWWDBLU/s3Aok2wlC0HWChy5VQfICW7qmue64+y+/rQGk?=
 =?iso-8859-1?Q?AJrfZMIuduaGlZqAA84ZjeBQN0XvGnzRlBSkcT6bDdhIXdLXgvnNa97fBQ?=
 =?iso-8859-1?Q?9KKzCDWEBWy2iJq4OiFbfMbR0vchUhsnE1/4TFfH1fSrPMWpViBZF+0yO2?=
 =?iso-8859-1?Q?okbv8oug9DT7UJeiDLlkEOjKaao1zyjRVPAk2cqXRrGR1DJUGjilt/G/Rq?=
 =?iso-8859-1?Q?bkHe53OH7fLOYEEvVhsxcby4kVtjdytKMO0mbcmAPHmX5vVZ+Qn/qyiTob?=
 =?iso-8859-1?Q?PaI5FO4r3n0+BsnNNY3kV5Rgm9uSIjLXH145Tmfh3mFrvJk6J7NkGEqmU3?=
 =?iso-8859-1?Q?HhROINzrbAHKu6Sz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?o+IgljupJ514H/yNJHDI8WCAQBji1EVc5GbTC+tvTDaXoj93KDiNZj3Lrb?=
 =?iso-8859-1?Q?ftwAGyY+x/MziE5mZGYqYiy2SigTqDaYzfpmMkhaWkouKvKRPxx2387jfP?=
 =?iso-8859-1?Q?ypTUwva/sNqULk0alL0WBzx8RDOUNTL6MCOo5x5DAJ2P7J+pYoydgTWEpx?=
 =?iso-8859-1?Q?ETUgKWgNKsuUwqcxa2CbjIlXwUFTuZ6MasTID4sc2A5pbGsm47xlvZoqap?=
 =?iso-8859-1?Q?bxROG5CzG/22OdKd2h/2U4wJwIqkj6IAj5FUCNdV+Pz3kW4teHFeHjbvmv?=
 =?iso-8859-1?Q?OVBNW1k949UQ4I6RImSayyjghhN/Xx4HdQsG7weLDvXZYaE9r4HpJ1HPbK?=
 =?iso-8859-1?Q?mcGFzwzafmW0gbURyRGw7+Lphkshju1Q6+qvt/QnKw4EkvWPqeKZGaCqlH?=
 =?iso-8859-1?Q?on9HhsEtw5P6wHXQ9S3rT/oO/e4dSqd4E1HLUSqZaaO0RjmRkudLfPr3q/?=
 =?iso-8859-1?Q?bC75SFyhy6CsPXnphY+f3PzTE3v9r64MfAGAH2GixFIwH5W4SKHqNbEwqY?=
 =?iso-8859-1?Q?JYhM8zT2WKUi0Wnr3l1t2v2eCc1hOi4Gln/eYlVUKtI/EIvQBg/lNlLLZ3?=
 =?iso-8859-1?Q?8TQAhkMwPXdJoZydXLapCZReEgVbbxvGnExIHhZ9KGSlucavjunUvMHDLD?=
 =?iso-8859-1?Q?9X0TQJSr7motql63kOgU2LzzV2UeGYZBjL6ZYmBjsocXNEbbqTkeqT8D5H?=
 =?iso-8859-1?Q?pE/z94fZ9+v9rXP19bFStQxK4QRTzQxv/Pkn4LBkuqNk4wIv8mlxdvIPZz?=
 =?iso-8859-1?Q?t7Prhdh9q2aTlOl+SP8GsP/ZbXgptDvJOJ9n+XC0CRx4x2W/pagPUvUiJQ?=
 =?iso-8859-1?Q?uZW5iACk/dmsZPt6SXW2KFmiHxMe5mTucXO47fBzfHfCqXH3B/qylMmbBU?=
 =?iso-8859-1?Q?Ay0uGS//K0t9dbnnVPC8gj9c5nzT+wztF27pbuxdozTJthTRLbHn7qznyC?=
 =?iso-8859-1?Q?DS9UURwQbdaYUMQs4jlXsF4I/ccjsoDaPhOJJdmSaHIcJjoSUaQ552THMr?=
 =?iso-8859-1?Q?3ZUTJlZhKcf+9sUjp9fJaPF0eJ3Mku0S7pBRmGUjEwPXRaUF/qROu9mSW7?=
 =?iso-8859-1?Q?fLzwlOTAnq1+PELkpKDflnaBmNvmqc/lYBYFf0bPG0aP03Wtk3k4AyKuTo?=
 =?iso-8859-1?Q?S9s+IRE6hC8ukp7SuVQPHenu2qwCHzn+pLpcUgIfWaP6RLXzMv5WUeGm+e?=
 =?iso-8859-1?Q?4f8X0SYEdqIolN4qe1J4q2IOZ4coVi/EikFyoEPGqbAOXwIiXboFhUL4la?=
 =?iso-8859-1?Q?5rTHDXq7iFLNvFHmkhxoAAuevQQ/Ltwas8tgyu2q9P1p5S6iZOgHhLBmeS?=
 =?iso-8859-1?Q?QmsDuMOE22lsMbJ2KRUPj8GUa3n6QbNHYWAiPkRwN4yXptAvfGz0qvK11s?=
 =?iso-8859-1?Q?gtLRUBrDqd178WkJSmn0em/Vzx2Z+ueM0zsiI50JSv8wR+LbppFYE/AC/q?=
 =?iso-8859-1?Q?GTJJowCGxtzOxAxjdL/+gF8g1UJj+APXFu4Au/EqtYbquj7QCDsVq+gJKg?=
 =?iso-8859-1?Q?+fM3G2hEcJhCwVIWWbgmXMGF2MOjSalIz3wzDssa6Dgj43fjxk8wjXKZUn?=
 =?iso-8859-1?Q?Ew5ifBPmjHcdKKEAd6dwhroTUKZ7BVqtfjNLZkc1eBsyvXBUznK4JNOAev?=
 =?iso-8859-1?Q?Rzrxhcc+RZ8BOhlguNZ35skVeli1u9mGqVWB+rXb8ZYuY2bvNVJxKizw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b671de0-2ef6-4009-1342-08dd601c3918
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 21:40:49.1942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ilLTJDPG1JZL15yYEOttzmbo8woM4k+Tbhhw1mxjFFgbG4+c9HGJmwojzPVLE4xxcr18BtlUQcF+7hNFXelj5nBdENk6VbKsi5z/auK7ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
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

On Mon, Mar 10, 2025 at 01:14:02PM -0400, Rodrigo Vivi wrote:
> On Mon, Mar 10, 2025 at 12:01:55PM -0500, Lucas De Marchi wrote:
> > On Mon, Mar 10, 2025 at 12:40:39PM -0400, Rodrigo Vivi wrote:
> > > On Mon, Mar 10, 2025 at 07:53:27PM +0530, Riana Tauro wrote:
> > > > Hi Lucas
> > > > 
> > > > On 3/10/2025 7:01 PM, Lucas De Marchi wrote:
> > > > > On Mon, Mar 10, 2025 at 11:01:50AM +0530, Riana Tauro wrote:
> > > > > > Hi Lucas
> > > > > >
> > > > > > On 3/7/2025 8:46 PM, Lucas De Marchi wrote:
> > > > > > > On Fri, Mar 07, 2025 at 07:54:44PM +0530, Riana Tauro wrote:
> > > > > > > > Registers a configfs subsystem called 'xe' to userspace. The user can
> > > > > > > > use this to modify exposed attributes.
> > > > > > > >
> > > > > > > > Add survivability mode attribute (config/xe/survivability_mode) to the
> > > > > > > > subsystem to allow the user to specify the card that should enter
> > > > > > > > survivability mode.
> > > > > > > >
> > > > > > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > > > > > ---
> > > > > > > > drivers/gpu/drm/xe/Makefile      |  1 +
> > > > > > > > drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
> > > > > > > > drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
> > > > > > > > drivers/gpu/drm/xe/xe_module.c   |  5 ++
> > > > > > > > drivers/gpu/drm/xe/xe_module.h   |  1 +
> > > > > > > > 5 files changed, 114 insertions(+)
> > > > > > > > create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
> > > > > > > > create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > > > > > index 9699b08585f7..3f8c87292cee 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > > > > @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c
> > > > > > > > $(obj)/generated/ %_wa_oob.h: $(obj)/xe_gen_wa_oob \
> > > > > > > > xe-y += xe_bb.o \
> > > > > > > >     xe_bo.o \
> > > > > > > >     xe_bo_evict.o \
> > > > > > > > +    xe_configfs.o \
> > > > > > > >     xe_devcoredump.o \
> > > > > > > >     xe_device.o \
> > > > > > > >     xe_device_sysfs.o \
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> > > > > > > > b/drivers/gpu/drm/xe/ xe_configfs.c
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..8c5f248e466d
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > > > > > > > @@ -0,0 +1,95 @@
> > > > > > > > +// SPDX-License-Identifier: MIT
> > > > > > > > +/*
> > > > > > > > + * Copyright © 2025 Intel Corporation
> > > > > > > > + */
> > > > > > > > +
> > > > > > > > +#include <linux/configfs.h>
> > > > > > > > +#include <linux/init.h>
> > > > > > > > +#include <linux/module.h>
> > > > > > > > +
> > > > > > > > +#include "xe_configfs.h"
> > > > > > > > +#include "xe_module.h"
> > > > > > > > +
> > > > > > > > +/**
> > > > > > > > + * DOC: Xe Configfs
> > > > > > > > + *
> > > > > > > > + * XE KMD registers a configfs subsystem called 'xe'to
> > > > > > > > userspace that allows users to modify
> > > > > > > > + * the exposed attributes.
> > > > > > > > + *
> > > > > > > > + * Attributes:
> > > > > > > > + *
> > > > > > > > + * config/xe/survivability_mode : Write only attribute that
> > > > > > > > allows user to specify the PCI address
> > > > > > > > + *                  of the card that has to enter survivability mode
> > > > > > >
> > > > > > > I think the desired interface is actually that the user mkdir the bdf in
> > > > > > > <configfs>/xe/. This populates the available config entries that
> > > > > > > the user
> > > > > > > writes to.
> > > > > >
> > > > > > Initial thought was mkdir bdf, but since it was a single attribute
> > > > > > and after a offline discussion with Rodrigo, did a simpler version
> > > > > > to get comments on the RFC patch and if configfs is okay to use
> > > > > > for survivability mode
> > > > >
> > > > > I disagree on the conclusion as then you are moving away from how
> > > > > configfs is commonly used and also making it harder to add new
> > > > > attributes in a uniform way.
> > > 
> > > My bad, I'm sorry.
> > > I might have created the confusion here.
> > > 
> > > > >
> > > > > >
> > > > > > For survivability mode, below procedure needs to be followed
> > > > > >
> > > > > > echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/unbind
> > > > > > add bdf for survivability mode
> > > > > > echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
> > > > > >
> > > > > > After the device is removed directory has to be created, the bdf has
> > > > > > to be checked if it belongs to xe driver and then attrs populated.
> > > > > > Even i think mkdir is better in case other attrs have to be added in
> > > > > > future, but for unbind case the check of the driver might be tricky
> > > > > > .
> > > > >
> > > > > I think you are talking about the mkdir in the wrong place. It isn't
> > > > > related to unbind at all. The sequence you mentioned is just because we
> > > > > lazy and let pci auto probe the driver. Under the hood you are doing:
> > > > >
> > > > > 1) load the module
> > > > > 2) bind the driver
> > > > > 3) unbind the driver
> > > > > 4) bind the driver in survivability mode
> > > > >
> > > > > The sequence we should actually have is:
> > > > >
> > > > > 1) load the module
> > > > > 2) bind the driver in survivability mode
> > > 
> > > No, this doesn't work for the use case we want it.
> > > 
> > > The goal is to be able to only move one single device to the survivability
> > > mode at runtime without disrupting the work that is going on on other devices.
> > > So we cannot unload the module and remove the autoprobe.
> > 
> > where are you seeing the need to remove the module in the above
> > sequence?
> > 
> > See that step 1 is about loading  the module. *If* the module
> > was already loaded, then unbinding it would make sense, but it's not a
> > required step.
> 
> Ah okay. Yeap, in the use case that we have the module is already loaded
> and we don't want to disrupt other running GPUs. So let's considered
> that module is already loaded at boot and we need to unbind. So we are
> in the same page and avoid some confusion here.
> 
> so,
> 1. unbind specific device
> 2. configfs (create dirs/files needed with the content of the desired pci bus address.)
> 3. bind specific device (during the bind we check the config against the device it is
>    getting probed and move to survivability mode. ignore otherwise and proceed with the probe)
> 
> > 
> > Lucas De Marchi
> > 
> > > 
> > > > 
> > > > This is what i meant.
> > > > 
> > > > 1) load the module
> > > > 2) bind the driver
> > > > 3) unbind the driver
> > > > 
> > > > 4)  mkdir /sys/kernel/config/xe/0000:03:00.0
> > > >    echo .... > /sys/kernel/kernel/config/xe/0000:03:00.0/...
> > > > 5) bind the driver in survivability mode
> > > > 
> > > > 
> > > > At step 4, when creating directory. The bdf needs to be validated, ie (it
> > > > should be pci_dev that xe will probe). i checked the struct pci_dev but
> > > > didn't find anything.
> > > > Will have to match the device id against supported pci device ids.

I don't think we need to validate the BDF here.  If the user does a
mkdir with some non-existent BDF, it doesn't really matter or harm
anything (aside from wasting a trivial amount of memory to store the
structure).  Each mkdir is basically a notification that "*if* we ever
wind up probing the driver on this BDF, we'll have some extra knobs that
can be configured."  If no probe ever happens on that BDF, that's fine
and there's no harm in having setup the config knobs for it.

In theory it would even be possible for devices to be physically
hotplugged and show up later, so doing BDF verification at the time
mkdir is called probably wouldn't even be desirable.  I don't know if
it's truly possible to hotplug any of our GPUs like that or not today,
but in general devices are hotpluggable, and we assume the sysadmin
using this configfs knows what devices they do/don't expect to need to
configure.


Matt

> > > 
> > > I don't believe we need to run any validation. If admin creates a file/directory
> > > with invalid address it will be just ignored, no?!
> > > 
> > > On the probe we only get the directory, file for the pci device we are probing.
> > > 
> > > > 
> > > > Otherwise, there might be wrong non functional bdf directories present based
> > > > on what user provides.
> > > > 
> > > > Thanks
> > > > Riana
> > > > >
> > > > > You shouldn't create any directory when unbinding. It's the user who
> > > > > should create it. When **binding** the driver we should check what are
> > > > > the extra configuration available and adapt the probe according to that.
> > > > >
> > > > > For that we have to disable pci driver autoprobe and tweak the
> > > > > configfs settings:
> > > > >
> > > > > 1) echo 0 > /sys/bus/pci/drivers_autoprobe
> > > > >     modprobe xe
> > > > >
> > > > > 2) mkdir /sys/kernel/config/xe/0000:03:00.0
> > > > >     echo .... > /sys/kernel/kernel/config/xe/0000:03:00.0/...
> > > > >     echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
> > > > >
> > > > >
> > > > > Lucas De Marchi
> > > > >
> > > > > >
> > > > > > The attr is WO and any value can be written, only if the correct bdf
> > > > > > is added in the attr then it'll be used on probe to enter
> > > > > > survivability mode.The current patch only checks the format and does
> > > > > > not check if bdf belongs to xe.
> > > > > > >
> > > > > > > > + */
> > > > > > > > +
> > > > > > > > +void xe_configfs_clear_survivability_mode(void)
> > > > > > > > +{
> > > > > > > > +    kfree(xe_modparam.survivability_mode);
> > > > > > > > +    xe_modparam.survivability_mode = NULL;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static ssize_t survivability_mode_store(struct config_item
> > > > > > > > *item, const char *page, size_t len)
> > > > > > >
> > > > > > > once you handle the mkdir mentioned above, this should probably be
> > > > > > > a boolean attr like this:
> > > > > > >
> > > > > > >     drivers/nvme/target/configfs.c:CONFIGFS_ATTR(nvmet_,
> > > > > > > param_pi_enable);
> > > > > > >
> > > > > > > > +{
> > > > > > > > +    char *survivability_mode;
> > > > > > > > +    int ret;
> > > > > > > > +    unsigned int domain, bus, slot, function;
> > > > > > > > +
> > > > > > > > +    ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus,
> > > > > > > > &slot, &function);
> > > > > > > > +    if (ret != 4)
> > > > > > > > +        return -EINVAL;
> > > > > > > > +
> > > > > > > > +    survivability_mode = kstrdup(page, GFP_KERNEL);
> > > > > > > > +    if (!survivability_mode)
> > > > > > > > +        return -ENOMEM;
> > > > > > > > +
> > > > > > > > +    xe_configfs_clear_survivability_mode();
> > > > > > > > +    xe_modparam.survivability_mode = survivability_mode;
> > > > > > > > +
> > > > > > > > +    return len;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +CONFIGFS_ATTR_WO(, survivability_mode);
> > > > > > > > +
> > > > > > > > +static struct configfs_attribute *xe_configfs_attrs[] = {
> > > > > > > > +    &attr_survivability_mode,
> > > > > > > > +    NULL,
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +static const struct config_item_type xe_config_type = {
> > > > > > > > +    .ct_attrs    = xe_configfs_attrs,
> > > > > > > > +    .ct_owner    = THIS_MODULE,
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +static struct configfs_subsystem xe_config_subsys = {
> > > > > > > > +    .su_group = {
> > > > > > > > +        .cg_item = {
> > > > > > > > +            .ci_namebuf = "xe",
> > > > > > > > +            .ci_type = &xe_config_type,
> > > > > > > > +        },
> > > > > > > > +    },
> > > > > > > > +};
> > > > > > > >
> > > > > > >
> > > > > > > so... it seems you are missing a configfs_group_operations.make_group.
> > > > > > >
> > > > > > > > +int __init xe_configfs_init(void)
> > > > > > > > +{
> > > > > > > > +    int ret;
> > > > > > > > +
> > > > > > > > +    config_group_init(&xe_config_subsys.su_group);
> > > > > > > > +    mutex_init(&xe_config_subsys.su_mutex);
> > > > > > >
> > > > > > > this mutex_init seems odd, but inline with other drivers
> > > > > > yeah it is not used anywhere but the sample and other drivers also
> > > > > > initialize it
> > > > > > >
> > > > > > > > +    ret = configfs_register_subsystem(&xe_config_subsys);
> > > > > > > > +    if (ret) {
> > > > > > > > +        pr_err("Error %d while registering subsystem %s\n",
> > > > > > > > +               ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
> > > > > > > > +        mutex_destroy(&xe_config_subsys.su_mutex);
> > > > > > > > +        return ret;
> > > > > > > > +    }
> > > > > > > > +
> > > > > > > > +    return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +void __exit xe_configfs_exit(void)
> > > > > > > > +{
> > > > > > > > +    xe_configfs_clear_survivability_mode();
> > > > > > > > +    configfs_unregister_subsystem(&xe_config_subsys);
> > > > > > > > +    mutex_destroy(&xe_config_subsys.su_mutex);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.h
> > > > > > > > b/drivers/gpu/drm/xe/ xe_configfs.h
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..491629a2ca53
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > > > > > > > @@ -0,0 +1,12 @@
> > > > > > > > +/* SPDX-License-Identifier: MIT */
> > > > > > > > +/*
> > > > > > > > + * Copyright © 2025 Intel Corporation
> > > > > > > > + */
> > > > > > > > +#ifndef _XE_CONFIGFS_H_
> > > > > > > > +#define _XE_CONFIGFS_H_
> > > > > > > > +
> > > > > > > > +int xe_configfs_init(void);
> > > > > > > > +void xe_configfs_exit(void);
> > > > > > > > +void xe_configfs_clear_survivability_mode(void);
> > > > > > > > +
> > > > > > > > +#endif
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > > > > > > > b/drivers/gpu/drm/xe/ xe_module.c
> > > > > > > > index 475acdba2b55..15b3cf22193c 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > > > > > > @@ -11,6 +11,7 @@
> > > > > > > > #include <drm/drm_module.h>
> > > > > > > >
> > > > > > > > #include "xe_drv.h"
> > > > > > > > +#include "xe_configfs.h"
> > > > > > > > #include "xe_hw_fence.h"
> > > > > > > > #include "xe_pci.h"
> > > > > > > > #include "xe_pm.h"
> > > > > > > > @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
> > > > > > > >     {
> > > > > > > >         .init = xe_check_nomodeset,
> > > > > > > >     },
> > > > > > > > +    {
> > > > > > > > +        .init = xe_configfs_init,
> > > > > > > > +        .exit = xe_configfs_exit,
> > > > > > > > +    },
> > > > > > > >     {
> > > > > > > >         .init = xe_hw_fence_module_init,
> > > > > > > >         .exit = xe_hw_fence_module_exit,
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > > > > > > > b/drivers/gpu/drm/xe/ xe_module.h
> > > > > > > > index 84339e509c80..c238dbee6bc7 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > > > > > > @@ -24,6 +24,7 @@ struct xe_modparam {
> > > > > > > > #endif
> > > > > > > >     int wedged_mode;
> > > > > > > >     u32 svm_notifier_size;
> > > > > > > > +    char *survivability_mode;
> > > > > > >
> > > > > > > drop this.. We want a  config struct in the xe_device. It's actually
> > > > > > > allocated by the mkdir in the configs and when we are probing, we should
> > > > > > > find the config instace based on pdev and set the pointer xe->configfs
> > > > > > > or something like that.
> > > > > >
> > > > > > Will add a new struct
> > > > > >
> > > > > > Thanks
> > > > > > Riana
> > > > > > >
> > > > > > > thanks
> > > > > > > Lucas De Marchi
> > > > > > >
> > > > > > > > };
> > > > > > > >
> > > > > > > > extern struct xe_modparam xe_modparam;
> > > > > > > > --
> > > > > > > > 2.47.1
> > > > > > > >
> > > > > >
> > > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
