Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CC4C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 20:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCF410E17C;
	Wed, 29 May 2024 20:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkYMIZLe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1AE10E17C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 20:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717013004; x=1748549004;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/y5JvWpgBqjM0ftCSeemewqw4X/5nSWAFZwl9bUwQPU=;
 b=IkYMIZLe6NbSczN8XBxJfU7PtzXRYJjbMzcWe++T4DeYKwRXbQ4SCBGX
 IpXHxzQuuUugziFY+OrpzSLUe+b8pCHD3ohwihGKya26zhJCAJLNKAeMi
 RsZxPx+6jZDlzbzbhIEmpKWTCgY5HZYoyJTPd6LU5Yc50TixpcaraarVw
 Sv+5bHbHbJefkq+KKdnBKIh52ZR92mRriBo2jUycOHJfmgjta567FSFDF
 iDPZ7pgIL2h6jwVKx6SXh3qMjlOqXRmJ/iHgqYa7wcewP9S2zfcQ410W7
 VBvPQPYRSbkf1cPO88d+aWwE2SxuwbZkvUVSqG/j8trWf+04F0jTewSZY A==;
X-CSE-ConnectionGUID: 5/h5Y4y8Rx6JD0t2hD/2Rw==
X-CSE-MsgGUID: kI0pWzu7RwGsPlpPgIthpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13572109"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13572109"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 13:03:11 -0700
X-CSE-ConnectionGUID: zMDmsVHMQaKWCyA1k4oLOA==
X-CSE-MsgGUID: xIBXgltLSZiug6f5RbLtKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="39964760"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 13:03:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 13:03:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 13:03:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 13:03:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Al+LL3KbeFoPgLgB9biYPq69eSWnJbvfv+8juvl5GFz0BM6UvbpZVSu2Tl3mGx5a/xQKcvlraiGEa2l/RquksDOZTP5us8aO9d5D34UUo9VMjqYoJjnpkuMgImjL0vLgMXxI6vCyeKV50EB311x+YA0N8+bLqO4sguIrW1UuZa9aUEgO73g3ezygxctTlVRiroEgrGusPtsRB60A3hzFz9Z46Xr66XxqkroYkemdposRB4JI1ocL23yA3TboShvtSoefjHLY7Svmk2EVu7SoAje/co48nJfKGcRP785h8Fqibb5SpS+28lT6uY+kEIaRRQRoK5EFxlKZRrZCiM0nWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rF6THsc674VvYbWUre+9uohCub3gQYxdxGGyHLcFHFI=;
 b=Z5hKD/bGsRwn/bpbg+CRxKDuOyEyEFmy4rrjayoGsptdgIFNNJ98l+tLJ/d7eWJu7LxfpNw476CLBidQE0clZ/tqSxcj1IAlpYVbpZOFULZPtJf6CO1MCodHlzYIONsiRq85vtKV2zkCo9K0CeQErLL29p3sjnHWS3liCU6lL2s858Z2aqpsrXV6CCw01ewTIPdjRosgMPWlCSnGcWvl3Tp/0cVBQkAbDP1pg0ygLmtCrFCm3TtdRcub+ERJ6NCJdisoo2y3iJP81DVj6QR26bzHdsXFq4rMv85ZYuCNMbybQwdNxZcMmU2d1P73/xk5kvkvdecE/oZ5DzU/dsj6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 29 May
 2024 20:03:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 20:03:07 +0000
Date: Wed, 29 May 2024 15:03:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe: Rename internal vram helper function
Message-ID: <nbrkx5mhezlcecoipfi7wiy5e37x2mms3ksl5tk2xdchju7xva@6dcfuzfd3taw>
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-5-michal.wajdeczko@intel.com>
 <20240528213515.GI4990@mdroper-desk1.amr.corp.intel.com>
 <ZlZXaouXdtj852Aq@DUT025-TGLU.fm.intel.com>
 <46164a96-f72c-4991-a41d-eea299540d75@intel.com>
 <87bk4okfb4.fsf@intel.com>
 <c368cc90-2d0f-4e6e-9cdb-8ccef42e2d0d@intel.com>
 <875xuwkcg1.fsf@intel.com>
 <ejic5jiiimzbx4f6at2tjin2n4evdpvh6lk4afefgw7vo5vqim@57k4spcjrhpq>
 <87le3sijje.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87le3sijje.fsf@intel.com>
X-ClientProxiedBy: MW2PR16CA0033.namprd16.prod.outlook.com (2603:10b6:907::46)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8399:EE_
X-MS-Office365-Filtering-Correlation-Id: b83369e2-32a3-4c1a-46f2-08dc801a5b38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b4V2zJGSRJEkyCmlJgPX48IuqBjp+P94Wmz2b+VbDzZEyTva0yJIndT+jeUE?=
 =?us-ascii?Q?c30t6EVA6snsqx6fT6VHKgX7q5+lVvznotM3LraJotY5ni2EUyixvZQf0+po?=
 =?us-ascii?Q?0Her2y07pvLYEV14g4WF7P5IBND5aE6/3k4Xcd1bH3WpZJQTDeJM6u1dYL9a?=
 =?us-ascii?Q?80VG4RBbhluk7DpWZ5NDWAL8FQL5wBmR9P768+vGfqD9tQ0EQfidi/Tq6C0r?=
 =?us-ascii?Q?3gxznBJji9Z6DmL0iaN7nrPVbuxsBRFBVlwzKVE8OcsCnsSbgU+p8lcXJV7G?=
 =?us-ascii?Q?kQ/5fc1cLcIoHlIJ7GL/0ZUksc9+ZNNYgmUiM14Pid9XakiXDkICJt8ReC5J?=
 =?us-ascii?Q?f5GkBYZ0GEB61cwGTqGo//6ZBJGYLUgEwIxgvj3MUga152zeB97RQZnpsSJV?=
 =?us-ascii?Q?1skHTNv0XhYVw/UyIweavaYE0pY7F+fZFMonqtLMYl0zzipDIPeThu/aH3wl?=
 =?us-ascii?Q?LF38LS764/0PYRHEZnjkdrF5fZEXYGUKySaHVONFCmihg8WUTAOPwclQHjOc?=
 =?us-ascii?Q?/xAqBfkQ3FtHjcjnkxbtfEeRA/qy32oGLkxwUX7kP486L/m7bOcYbiTvyFNH?=
 =?us-ascii?Q?F2Ylw2QF0YFHOGBRfeakdcMI5T88JK5YQV3SeimHGlrIwQK5jXDFO7kglHd0?=
 =?us-ascii?Q?KJrfBdXMOSGuHrzj6HlMoeULKMEvNcRvRM3L/Oxf1Ykh41YT1M9yu48p9mEC?=
 =?us-ascii?Q?d8MLaWvZFuO/6rufXcndKxMoEqJp3N11oa90dBUnEPnwcaMTE20bMALJXvfc?=
 =?us-ascii?Q?slr3SEcG0QxkddgkbBfu3xHieJORViY/6ehFEk30HEkAelJ+9zqipUCieItH?=
 =?us-ascii?Q?YeLwkKRk2Xl32jh05++LhSZ/lin8EV2RdveU43u/q9PHckLoyo3LyKePduRq?=
 =?us-ascii?Q?SjYrHH2MYCGhOCCsjTdh1u3zTC0HukyDVypz5tRpjjUxkYEHdeiJ4nKtmPu/?=
 =?us-ascii?Q?McwOqDEQIGcLKS6GZhfZDCyapRD37014Du5AsSA3nDNxvBpcTkt/odbwZ7Su?=
 =?us-ascii?Q?Uapnk/HiyfQYPhVaCqpVp/AjQpl0NZdThvsm3FdUxjni4USIpQ8AOhu12JjI?=
 =?us-ascii?Q?HVWYTDokWXGM6Q3F8LuPEv00kwINS2y4Qxh07WBaZ0QGrOyI/qmx2FYKe7Aq?=
 =?us-ascii?Q?S1ie2pKzipXVMojFRyvZynwiT7x/w+oGlZzGvqMIkNp+eKprkmSJWwJRUSNH?=
 =?us-ascii?Q?81bvG5bG0QhenEGQfWJ6RYutfe/1phsUif4X/fAEbphVj3TtF26sYwhnLdnD?=
 =?us-ascii?Q?zizb4E6DsfciGYltETVoDV8TVGOpRHwEDU1oc6k9gQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bVDawtokDipgBxVudUarjSkIUcOIUWRrRx2XlwmwuvETMVmvBo08DNPcXnU/?=
 =?us-ascii?Q?sGQffl42jm5bj4OM6hDatzJNASVssVfuwqYetbWu8GsopNqjfm15MDZJr66N?=
 =?us-ascii?Q?ji9qORbcgC0A5Lk+5QDaROmZytu9ehv9kxbRVNtSI/tYj7B1F1TSrP7yyiGp?=
 =?us-ascii?Q?NHCgF9kZHoGVjbZ9YX8gD5w3jwC9fDeQQsFKS8EUhCTvEc/H9iifc3a29SHH?=
 =?us-ascii?Q?qcKshdFhnBTXdNRfRhp1nBBYD9duFe046F4EHyJCyZ9nOhJPoUl0avB8TF2r?=
 =?us-ascii?Q?qb2u/7n50/Yh0RckHVFNh5xkMzP9SYPuXr6i0c2wISh3l+zCgF/fbXH+230/?=
 =?us-ascii?Q?uqbaKt6xhUL0MAS5ieQR0Z1CuSkVFlt7GQvguUaltgtS2n7thi+qBUz5uyuA?=
 =?us-ascii?Q?ZVRzzukBweon5mgq8yH3AVDcyb2GFEWD1q0tUNZ69gEODIxn9KHIIB+6wIzm?=
 =?us-ascii?Q?QAYBU0FwUpfDxohRA8LwFFzixjRLmwq19v4vEu0v2FFiYGaWITXyHPbMudEC?=
 =?us-ascii?Q?4lUINpFCDG2OZYwvlIW5mVKMgAq3XG+XCaSW1R0/8m8V/MzeMTX5bPa9qAyR?=
 =?us-ascii?Q?IPJu3W4h+V5rTd7KcfuVDR3cKOviaeETiIGDDW8txdFXbuua0WvEorELZx9I?=
 =?us-ascii?Q?6jp5kWvUnb+864P2nOslJaEAT2/b7fOXIn6ac87a9EaaZLrzoKPXlYCtweSP?=
 =?us-ascii?Q?FBLvo9weDlNgyss2VntjkK7kB4VxpqcE8hPGciJZfUhkhoCb/7n+lYac6Apl?=
 =?us-ascii?Q?RezPJUpEAOmw0nlnpXHrkxYtfNJuPqBaGpQvqO3eZTjfIfhiwjTb60w3jHbe?=
 =?us-ascii?Q?T3G0FfCQsLBr+PDA6hXvi4/vP8IFxeNlGDP0OAnBBvtwdjHd+qXvAYzgr4i/?=
 =?us-ascii?Q?5dHYsqV1fmOhJBSTyo+KqGU/UNGzdBnZX7jSGKh6i7Wx+ZqnPiXHlHXyAHfH?=
 =?us-ascii?Q?O29H1GxiAt4cG5kmTjs/oY244c3zwHcFJhBtfg5slDPUFoTLS7RUpeycRhVS?=
 =?us-ascii?Q?5b5PYl8gX+a3MkgNKCSmHvuAjeZxyI2vl1XNlBDpO/kssFsarAsy135cJvdL?=
 =?us-ascii?Q?yNUEmhGUVxpVNgg0X8RvzJm3QlOHwQtzzACcqMhD7ZSstXVcj5j7ULwYEM12?=
 =?us-ascii?Q?OFYC1i2rTAHudPDCBTAjh56EEDO08a1qEMHZ+R8B5s8cHVNBLjXAtf+gR7fY?=
 =?us-ascii?Q?4+7kSyjMTH/OyJl2K/DlcGhJ0jA/PTw6U6lBkJiLg9tWlpxDsbwcuj2jamb+?=
 =?us-ascii?Q?/7LKPUk3fYDN+bktqPIqlijO3wLesJg+FrckwR/2sO9qRKtLHi4heqPk5+0v?=
 =?us-ascii?Q?ElA1eXcJoB2WVSDH9nLWtJtHgEuFrWKJ54S7N4Jaa0gFiF4k7CYVpkL/PHEn?=
 =?us-ascii?Q?EoYflqSrB+hnHdADB2hBwHJN2mfbbib9Ui80sSQ8eoM36mjVFJ9HW981Hfyd?=
 =?us-ascii?Q?s2Baede67HZ28T3jZtdI+VX1TomAdzG84XvFaAG6oUhgsqN3w5j1dZcbZkOn?=
 =?us-ascii?Q?r9P4HF7uY2e+y8mr1WjmJH+7Gk9b5B9J6t7WQFP69xU9zohyj2T3z/j9UXqL?=
 =?us-ascii?Q?KG3Wa+NdiqlmjnbFYgRYXzTjreqVYZM3+eQDcHl9ZtmjrNkIfDXg1eSWip1q?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b83369e2-32a3-4c1a-46f2-08dc801a5b38
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 20:03:06.9406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TdR+C74I8BG5HaNl6wfNYzafhAx72qCDTae/wifgpwZBUpRf3GufunTqcrYsJ7+sBQMo68uYOAuDSO7tTJWzReF5Gn8GmEMaJ++E9yC7xGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8399
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

On Wed, May 29, 2024 at 09:01:57PM GMT, Jani Nikula wrote:
>On Wed, 29 May 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> I very much prefer dropping the prefix for static functions.  If there's
>> a clash with a global one, either a) you're including too much b) you
>> should use a better name or c) the global one could use a better
>> name....
>
>I think all of the a), b), and c) evaluate to true. ;D
>
>But sadly a) and c) are often out of your control, a) due to recursively
>transitive includes that end up including the world, and c) simply
>because you can't fix the world.
>
>Case in point, commit 35b22649eb41 ("drm/xe: Fix END redefinition").
>
>But then you just fix it, and move on.

yes, and that is perfectly fine. That particular fix happened mostly
because we were out of tree and not trying to build to all possible
arches. Now that we are, we noticed the issue, fixed it and
moved on.

Lucas De Marchi

>
>> IMO platform prefixes and double underscores that i915 uses are also
>> bad:  a compilation unit should abstract it with proper layer of
>> separation, otherwise it made a bad abstraction.
>
>No argument there. It's just a lot of legacy.
>
>
>BR,
>Jani.
>
>
>-- 
>Jani Nikula, Intel
