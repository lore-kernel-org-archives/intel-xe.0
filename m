Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA58D7879F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 18:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6AE10F071;
	Fri, 19 Dec 2025 18:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmmiiUMk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DD910F071
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 18:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766170415; x=1797706415;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9YL9S6v5KqHkxoxVTDarID4qBsRe6fSH9cvcTzpgAgY=;
 b=jmmiiUMkYO+HlOym7+O2BxHSKVGghWmRxcBWI+sKneQ/o2H6g06H3SCm
 jL6qT/6G9Luq7N5L5c5SYSlglpTX/GGXnlSBN8bkuzKCJXqXS3D9P+WsH
 xMIjxHaeOVbk5Yi7QymqcMnmYsyYqsOu1h9INqav3Vm0GPKIFHSPsd5cr
 m7t3VSFhPnGW8ADf94awnJMcE5BhZ9NuKSvs4COWo5grygmv1dhqP4lyE
 Yw1iohAM5FuNiO2xXhp9SHoGdK3/C8gHRMcZrzNJkvweNbsB9N1OjD16n
 2tRw+nCvrEOj7JObxjZ8zmLXySc+KpJh3ripELRJfuyxj2Y8d1PDO2Hmi A==;
X-CSE-ConnectionGUID: K1dN+PIuSlyvnyS8H0hYbQ==
X-CSE-MsgGUID: XbL/QF7VQc+2l6oegeGbXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68028395"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68028395"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 10:53:35 -0800
X-CSE-ConnectionGUID: JyhPVTXuS7+mbG0cU4UttQ==
X-CSE-MsgGUID: uQf8l3DzQdmaGMOBlSgnMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198086472"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 10:53:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 10:53:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 10:53:33 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 10:53:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fb8NU1gOBSlMkw7acstOBgAY/MRjoQypG9ERNvrem/qT2+Wa2BSalub2W65bTvctWsfLjbuzORkVxppi+b1V62IAAPTvxKREYeeC5frqup0BpAa1xdqdeuV5A0tchvSxlaHBKtqoIIqALMK+T/aejlsOSOTOciWjFCY79rCb0w7ChSc7QRJAjWr8bLt8wGEE3yNvQYgfjdW3A7CwglnA4bfmlgV/MGlAA86gFrkylXzmufZUo/6du81WkWTSlmsvaAJ389tIY3K6f8jzmB1rX3kX/EXecjzg601IUyaS0S3CLRAb59Vs8xFjnpGzpQV1JPlKEmxQv+3EOmflY5fesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75fn6FlgRL6ZBW1cw+P7mB/JHB4UHptGGNMVGXJTQvk=;
 b=LFwqwibeoyp0pmye5OcXI9n7aLwtOM88i6yyEXiVWYcl9a6KIjDqdoni3UxLfIuKLhSKj8Be//yuycBkD0QmZbraVBUZTMOsyp/3PaTFp7uxACKzjovBGFENmRlN3F+Xvhz8sXByblwJJdQ6f4uzbMBlqxT+q0AUuPf/XZMzL24ZOzXBwg0swr4yB054iktcq/tqJa1P/14q/7s14c9lC6OIyusBN3PqaljQkt/EGMJSG4V69E/YpAoM8sC+xFDW6X4k1xFY05ZAr0pxOt5ksybdz2NFTLYesHpgXVTh3xc9BAmOMzE2P5woI3BaXYEJzcq8RfcBYvW1LGBN89Zzdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 18:53:26 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 18:53:25 +0000
Date: Fri, 19 Dec 2025 13:53:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>, <dev@lankhorst.se>
Subject: Re: [PATCH v1] drm/xe/pm: Handle GT resume failure
Message-ID: <aUWfIIUsp_aisILz@intel.com>
References: <20251217131909.1226331-1-raag.jadav@intel.com>
 <aULnjAabXkM9jVfX@intel.com>
 <20251217173834.GK4164497@mdroper-desk1.amr.corp.intel.com>
 <aUPhu0QGLd-hIQcQ@black.igk.intel.com>
 <20251218184610.GD1180203@mdroper-desk1.amr.corp.intel.com>
 <aUTc6kypmsbHNWC1@black.igk.intel.com> <aUV4eX7XXpApdnCN@intel.com>
 <aUWSovxtNUyZ0Yys@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aUWSovxtNUyZ0Yys@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR05CA0183.namprd05.prod.outlook.com
 (2603:10b6:a03:330::8) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f8e940-970e-43e5-891a-08de3f2fe3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zb+YIqed7qhj731biPHXPXLjTQbBUsBgWY77PE1EnoAncaoYlrDJ5IwBnr48?=
 =?us-ascii?Q?oA472uBz7tV2YEXv8DV6eS4+UFROdSuxemXu/e6jc/KxpsQiC7TZbeymvpFs?=
 =?us-ascii?Q?+Z5eK81MaL8i+d4MQuZP3DWa/pAsvrNCCDwlxZjM2X6+T8SYoBp/epndoiGy?=
 =?us-ascii?Q?8xm5Fs8zx7xYI9QEaqhhKk389llN68eYTGalY2ELlxOvPKqH6ag9Qmj5331K?=
 =?us-ascii?Q?94fElk+7ysU0IbsdYreH2WYZVUSTqRVdUjUH52XHBrqNWg1xR26GzsInuvxr?=
 =?us-ascii?Q?NqiO+Ef8SZ4ba1+ldDEHg9P+DVQhxtXoToQGrZbHfuN0EkNhuz1kuF/luGmt?=
 =?us-ascii?Q?boik/X9KCvQdzXVBFLWgEkOwdSAIXSTJXwJQb6O7oQLgm/0bet/QCKYIZ4PK?=
 =?us-ascii?Q?GoWVm7SDHLewjOZnEpSPhWWQwspEYcunlGMlozzCqrg5wU88mgKkH5tkZGzH?=
 =?us-ascii?Q?pT4Pf6JZmslOImJdZG7h9a47tuoA1c54aDLJssXCw7dJgiphmsI+HrQEKqfE?=
 =?us-ascii?Q?Heappd8Gx6v7JZuG2zcihVm8Jpc8m/dOaSpJmNexEB4YcLhU5g5enSHa0SrO?=
 =?us-ascii?Q?b+jhdvYCn5RcvViO0Jv+q1ajSdV+pL+/RNL3c+5D29mEx+qnI34DzlTsNSsZ?=
 =?us-ascii?Q?t1+VKBy0KvBFZa3UXZeTnm9BGxoZ+jNIuOg2alro1yMUJ9lQDDWQvJfP04nR?=
 =?us-ascii?Q?plWJVkhpJh6jD7IwrGGrmwszpjIVU1dgx3fzypnMpaU1LMRozdJhVoWkMHu8?=
 =?us-ascii?Q?TkvHuJS6aaHqZPaD4ob6xTRglph0L7LNoJbTTZUX/rU5gxosJwk91N9bm0+K?=
 =?us-ascii?Q?iYjc3l/TQmOFcSELEmRMFgtYbrEgwT56DredukObPPh7KOEt3IvViMo3BYqX?=
 =?us-ascii?Q?vAfhekOgxXZH6G0QvWCmBC9sJ9WxJuvpAbvnrzlraDIE9CTewgrMYUjAw8Df?=
 =?us-ascii?Q?cWWEXi2H0NNaMqsoA1j1O5IE4es/IrW0PJGTAg3MWVQOQtj2LmrBp4R8SXsO?=
 =?us-ascii?Q?FegjyZNIVfTgAFqlkS1BesHsNZWt7VelkoahB0ihzEPXcpvtyoEO/y8eaEV1?=
 =?us-ascii?Q?A2rYCxY9CprSa3fDqyxmxNNygB7WYSyEKW/fPO83jPio/+3TtRFH5zhDbJv0?=
 =?us-ascii?Q?SoR9Ie3NVCl0hE3xCvinVebI3ngy4RcuWny/QflozbkFEeVitYaCih7soaW2?=
 =?us-ascii?Q?F5+D2FQmG9MPzmHWGnqnpwS70hxqMU4CzxFW0RLW8cjXyOYuYgzDCOnC6of8?=
 =?us-ascii?Q?ToNnUJ3GZm73wcL36GsTuX+6AtfrnYq+vJNMoki9A4VySVCVnwFo2KYs6lk1?=
 =?us-ascii?Q?004DfQj2K0TU+p6OhR37b0CfBl3MJ8OAICTFsV/bIBN8j4Ibk10YLl12aF1s?=
 =?us-ascii?Q?VAz/kOTFB15/iOfi8yqW96QruZHswwXw7Azn59hUmTpkzo09wRTHjfFaCbMN?=
 =?us-ascii?Q?TNe3VteOXtlGUn3rnMtSCTiH4TfDDmz/VRevXTzHR0+5DPt4lv9OYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FGtSBYBE6nR3Sfx718cmDigt789SNfqgJKY2/q4wdTY5N2UyZNCdOiKonyJ4?=
 =?us-ascii?Q?hwk+nK8EKHHu7KWvsCUwhA44lzZHrhos+3I9Yv92riwlICyww5H1jveusTXu?=
 =?us-ascii?Q?OZR+pffWIFi29pbgxhvwO4B1uL+Gce78VSyZYP5kiGImpkZHFkPr8XZAnBXw?=
 =?us-ascii?Q?bos3TLOrFs1mp272sp7fDNlEry0pMyFr/kkDGLBJnsFPNBAmU+NZ+Kon0/yV?=
 =?us-ascii?Q?iYnqYDYYKHo5/dWqVo6VLCDxA1ZoMI4/iEcirksdUK2o0EQURa/9vjhWHzWL?=
 =?us-ascii?Q?R/yvKUXTu26iozuTt8CVTj8VvWHtT8eTYC4/XgywoLgtDL1Qd+2q4m7JIyDI?=
 =?us-ascii?Q?K9LH/OPEvR4X1WkvIjFfZQYQryKLJLZDvxvX+OC4qtrk0TcclE1Z6C83K7Pk?=
 =?us-ascii?Q?Fp/pmrWcM8ZJmVbODIgJzoPxXHftZzo4A3RE3tlB9poy3XG9XsAP3wPlkKGy?=
 =?us-ascii?Q?YC7iRW1wcoMrmObcZV77UO7b5IMPVcH6RbCfVeKz8FEzPikfMmROePptjgzd?=
 =?us-ascii?Q?g1goeXu1f+7cCoUU6GpwXk+GQtmFxmM3TzijLEMcAi4uq0q812WGjx4CK4Vn?=
 =?us-ascii?Q?h1Cwt11O6fj/7hnqXvnCDy88G176+qNP1aaDIEHX3F7cyb5ebHu5eI3qdARs?=
 =?us-ascii?Q?fHlAIX7F676e9MF9yZuYgrNUrBz6WjQosPBT5FFUWL5E+9/NsLXLt6LOCUPu?=
 =?us-ascii?Q?eYs8V3VU4lpvHZjfTyazFEkYIiK//P70WAKK/MzmD7kar+eFvvFGZIFdaibM?=
 =?us-ascii?Q?g9xEXLAgnowjEvtqWuigJo/OnfS1OLazub/IOHffR7nxR+owwaQml86p8UQu?=
 =?us-ascii?Q?BjWTQ82q2zos0xOHDt9p07nR5g8V4jxWrbB4YXqPnY7VJDe29VMRjfx0SzZ2?=
 =?us-ascii?Q?DnKnqwtDLVoTmkCJ8DWYGamT7ij3L3RvwdUOaSneN8gGpd10FNYhBZw2UyJ7?=
 =?us-ascii?Q?P0CB/1xFX2cXLCK2XmmZSzVbOUQ/ZEwXexc1GqYtzjgIeVE/NdIC4m2RzEQh?=
 =?us-ascii?Q?tWlwPNMxQ4LtucXcZcdSZLvxyr55OMmc6R2U2y49JRoPUy96v/PiMvsWbw9F?=
 =?us-ascii?Q?XBmuIasG3TGbIyONdBLGH4HFQTcPLZ39+o7ERG7KyxYMbYtzHTnoUlY9CE6D?=
 =?us-ascii?Q?Vo1HHuCU386XkdstB4K4Tu/88QPa4GKdpsDZWKJ8DSnuHNxZwo1Y9SnmKdVa?=
 =?us-ascii?Q?014v97/IxF/UfvIOodhQmx4RlZJXQlOtVLzRCngsgGI4/zoAvhk9m0AhumM1?=
 =?us-ascii?Q?C7yqL9fuVn9VQo9cS7qXYmP7FwcYmwt8Sm4Wrg+tCFNzehNRgUt1GoCNes2M?=
 =?us-ascii?Q?9+bliQTzMueA+pD7jHE8VQs1bdPfuvx38gdx1fogfUIxje7Odj24cOD90UrC?=
 =?us-ascii?Q?QzxlwdwzkER9SVjFWdmjEJT3AWhDOhZbO3GNWBLBQvoXgjlDvBFZbKSMB0o0?=
 =?us-ascii?Q?59r87Uu+ScK3u2fhvuPCW4AQ2qt8AkHvScj0RUd0IT5g/oX18lrXfUgPPSpB?=
 =?us-ascii?Q?svQ5eBTyfuAnCxsaABkZX0nFVUaviERScPDS306kkil1yvxbMwLitjK57TeR?=
 =?us-ascii?Q?nDLNjDuvZ0TSaWbraTYGTf9tZWZv64CcJMuNjUAGFkN+sacnUaL01KNT8Kdf?=
 =?us-ascii?Q?irrO+O21XsL/jEaCoXyHIZwWo+jQQJzo/lbXzNc9ZtV59X6ixWR1Va8xv6Zi?=
 =?us-ascii?Q?SwAbXCiZU8yEtQ11yJwFQ2t0iIdPcyZ+ZOgua3VvKN9892IgUfrZiXEwcZnX?=
 =?us-ascii?Q?BjF3kA7TTw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f8e940-970e-43e5-891a-08de3f2fe3a6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 18:53:25.0811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FotAF7QMgbDzdh0bcf4RZJhfUOn4EUi3smo1qX43hMk6hGZUI8oCrrXxdqtVc9smoV2L96xHv8N0i4Z+FFPsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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

On Fri, Dec 19, 2025 at 07:00:02PM +0100, Raag Jadav wrote:
> On Fri, Dec 19, 2025 at 11:08:25AM -0500, Rodrigo Vivi wrote:
> > On Fri, Dec 19, 2025 at 06:04:42AM +0100, Raag Jadav wrote:
> > > On Thu, Dec 18, 2025 at 10:46:10AM -0800, Matt Roper wrote:
> > > > On Thu, Dec 18, 2025 at 12:12:59PM +0100, Raag Jadav wrote:
> > > > > On Wed, Dec 17, 2025 at 09:38:34AM -0800, Matt Roper wrote:
> > > > > > On Wed, Dec 17, 2025 at 12:25:32PM -0500, Rodrigo Vivi wrote:
> > > > > > > On Wed, Dec 17, 2025 at 06:49:09PM +0530, Raag Jadav wrote:
> > > > > > > > We've been historically ignoring GT resume failure. Since the function
> > > > > > > > can return error, handle it properly.
> > > > > > > 
> > > > > > > I probably had a reason for it, but since I didn't document and
> > > > > > > cannot remember it, let's go forward and make the clean flow.
> > > > > > > 
> > > > > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > > 
> > > > > > > > 
> > > > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++----
> > > > > > > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > > > index 4390ba69610d..a8b50091d62e 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > > > > @@ -260,8 +260,11 @@ int xe_pm_resume(struct xe_device *xe)
> > > > > > > >  
> > > > > > > >  	xe_irq_resume(xe);
> > > > > > > >  
> > > > > > > > -	for_each_gt(gt, xe, id)
> > > > > > > > -		xe_gt_resume(gt);
> > > > > > > > +	for_each_gt(gt, xe, id) {
> > > > > > > > +		err = xe_gt_resume(gt);
> > > > > > > > +		if (err)
> > > > > > > > +			goto err;
> > > > > > 
> > > > > > When we propagate these errors upward, what's the end result / where
> > > > > > does it eventually get handled?  If the device is still [partially]
> > > > > > usable after an error, wouldn't it be better to not bail out of the loop
> > > > > > immediately, but rather at least try to resume the other GTs, the
> > > > > > display, etc. before returning the error at the end to indicate
> > > > > > something failed?  Then you might still have a partially functioning
> > > > > > device and have a better chance of at least having your screen turn back
> > > > > > on to show the relevant error messages?
> > > > > 
> > > > > I had a similar question when I came across xe_device_probe(), but as
> > > > > Lucas mentioned[1] that the expectation here is pretty much "all or
> > > > > nothing". Again, not my call but I think we should be consistent.
> > > > 
> > > > I think device probe is a bit different --- if you can't bring up the
> > > > hardware successfully at the very beginning then something is pretty
> > > > wrong and it's best to just not enable and start using the device at
> > > > all.  But the resume paths are different --- the device is already bound
> > > > and in use, and was working properly previously.  If we intentionally
> > > > don't even try to power up other parts of the device that might still
> > > > work (display, other GTs, etc.), then we're making the situation worse
> > > > and that could be the difference between the user having a functional UI
> > > > that gives them a chance to save their work and shutdown/recover
> > > > gracefully vs having to just power off the machine because their monitor
> > > > is black and they don't have any idea what's going on.  Powering up
> > > > other units like display also makes it more likely that we can get
> > > > useful debugging information out of the machine to figure out what
> > > > actually went wrong.
> > > 
> > > Fair, but this also means the existing error handing in resume path is
> > > redundant and should be removed.
> > 
> > Not necessarily. Otherwise resume itself wouldn't have the failure path.
> > I believe that Matt is suggesting is that we need to scrutinize them all
> > and handle with care without a one-rule-fits-all.
> > 
> > If there's a chance of getting display back even without some engines
> > for instance, perhaps we should try it.
> > 
> > Imagine that media gt failed to come back, but you still have everything
> > else. But user will try to open the lid on their laptops and will just
> > get a blank screen. We need to avoid this scenario and work for a more
> > reliable platform with more granular and contained error handling.
> 
> Or perhaps we can reconsider the ordering to make sure we have essential
> parts up and running before we move on to non-essentials?

indeed, but careful with chicken-egg cases...

> 
> I'm not a fan of hiding errors but upto you.

Nobody is in favor of hiding errors. Just that this patch, as is, might
impose a worse user experience. So, someone needs to take the ball here
and do some study and design the flow for a more reliable experience
and error handling.

> 
> Raag
> 
> > > > > [1] https://lore.kernel.org/intel-xe/lliho4ci6gi5spxxelttgqntbh7rxr4utg4dgfevlrdy54phrh@2k4mjuofaqye/
> > > > > 
> > > > > > > > +	}
> > > > > > > >  
> > > > > > > >  	xe_display_pm_resume(xe);
> > > > > > > >  
> > > > > > > > @@ -656,8 +659,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > > > > > >  
> > > > > > > >  	xe_irq_resume(xe);
> > > > > > > >  
> > > > > > > > -	for_each_gt(gt, xe, id)
> > > > > > > > -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > > > > > +	for_each_gt(gt, xe, id) {
> > > > > > > > +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > > > > > +		if (err)
> > > > > > > > +			goto out;
> > > > > > > > +	}
> > > > > > > >  
> > > > > > > >  	xe_display_pm_runtime_resume(xe);
> > > > > > > >  
> > > > > > > > -- 
> > > > > > > > 2.43.0
> > > > > > > > 
