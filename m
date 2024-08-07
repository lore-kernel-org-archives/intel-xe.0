Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B72C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 21:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4AE10E5F9;
	Wed,  7 Aug 2024 21:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgGDG7Mb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1798F10E5F9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 21:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723067502; x=1754603502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xv31cRmY0Lj5l1/apBHVohi3rJre6Yr3KeNVuEAXxkA=;
 b=FgGDG7MbYS1+M08W9TTno61r/FPJPGk7IEkL2myiRs+6IVcXr23MKvWN
 3Mirkj96gXXb53ZRQ0PyHmTZmrEg7PkDUG/tSMqPf81bM6IPyqmCsQgxL
 ooZK89yx7XrL90QX0Q3/tZFfq58c9bdEkNajTvl6CbV2Dn/wL6eu3Bwv8
 lLA4Suy5nQFIx9xrNH1o4a+lH8UkDZNv6o43x/2BF8PyLg6oZP9hPmu/M
 d7YbpRIxFkIwLLZZXtfyx/hLDUaCnTP4yVW1Txm23ZvEJErk7Q8UFwv0L
 iotCT1jrSPkIMWV/6M/zD9bn7f/BiSzh8UtCDZnbFZtwrn2dDHO6tDN5Z w==;
X-CSE-ConnectionGUID: 9ae5zPvqTJSBoJSGLwE3Gw==
X-CSE-MsgGUID: C6WgJv9HQHu8b7CRkLLJaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24956269"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="24956269"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 14:51:41 -0700
X-CSE-ConnectionGUID: ZVwxd1d/RcGYj9DSMmvBXg==
X-CSE-MsgGUID: vM89qwZ1Ssipt04gdMd+yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="61867158"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 14:51:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 14:51:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 14:51:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 14:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjRfz/JacHWlUNYosEABrrEJX/0/kVH9/1X0Q0ya+LrW3DtHhfBaPY9W8IYBwfN7emASn1ost6ZR0OXDsiMw+XkIj809UtidkRZcPV3/NnGIGEx7Q7s7EhX5Kr2uci4qILRxeqMhPEjTkIy5TPcLQ5Iuai1DnsD1oIZUabFkOBZG8XmqTT/WQXifzyTKcToKknzZqgK1b3MZKZ7LtkHqWRryrVinW8b1KiliPoAFT0djY04wabx7Qe/pjHXnhr1KxHXkQbVOCHLbOUWXqFiT7QmQ5ikcHiq52nzNvs7r33ZqgoaRdmXH3SguTC550P46nZsjCXZIwC59EqIWhoRO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4ClKswT1O9tX+hUHjGacmPDsvts101l7jyBaxsilxc=;
 b=Dq+IzHa+eoG+/9Io2xPFHoKrEy6Jd44fQgT3YPIxSJnF3BuTXwRe9dLyF64TvXKI+Dud2VjMHas6lsh5Raktj0q0B3g3h/DCIYYIKrGhEeaSO43dtFV54Ys9OPxjCkKsnsIgYDFqHZJkLyeyucIiDVDV9vxSmoLHZxVfdHiAINHCXF1k1CcNO1HMl2c+NjdcmxzjmZW/fj/LyIXC6xcimIhVMTWuYOy+3mqoydSQ2MVYBKAxGkXRekAmdytvKT62d62vhNSWNBBjz5Jgge2nD9Do03cQaO6kpKEIZ5sSk0rCmUGzmvql+N6iZDIZf75pZQ0mWuYUN5AoXw+9C4o3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5236.namprd11.prod.outlook.com (2603:10b6:610:e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 21:51:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 21:51:37 +0000
Date: Wed, 7 Aug 2024 16:51:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: fix WA 14018094691
Message-ID: <57qe3afswvijqjsf2vowsif7p4hofxn3mhv36e3k5wc5qwop47@xgh3gy6ol5cl>
References: <20240807211106.1322197-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807211106.1322197-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR04CA0328.namprd04.prod.outlook.com
 (2603:10b6:303:82::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: 25fe6c86-4e8d-4a4f-d95d-08dcb72b1ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ECq6kzKWLUGaXbhWfUCqwZH9VtFqf3RODf2M4mYOTmYTyaDMmVILSimGTBIf?=
 =?us-ascii?Q?Ttd36XyRBbMMU8fc5xNDG0OjSi8ngoQ93fBmRlU6Bf3a15DmjexhwKnyVCbR?=
 =?us-ascii?Q?BBVq823q+QXQY+Q/bjNVaFHd0g+1s1GBUUZvlFwaXKrJi3it88I49IHYhqOS?=
 =?us-ascii?Q?YKkRtU3kxmbJaZLkXhaNCBOwnENeMVGl5Hlqw4bFHSUy9tCHEIlGxsCRzohg?=
 =?us-ascii?Q?3Ar+/uk1oB97qK29mNF3HGt/sZcMehDAOUzk625NLzNZjn8Jb+7BLtRpBaE9?=
 =?us-ascii?Q?txga6hvLV0RF8GZ5uWpHnS0Wmchpw6qPFbq2ftNNHrQL16G7YTuND9wPrMnO?=
 =?us-ascii?Q?90acG1BeGAcBtevGL2BqXsts7Tqgs1KbHWH5kFRlXUv3LaRlqjupbdH8a3tQ?=
 =?us-ascii?Q?4QJhvJhqhY1RQqE0Lkq4pWHhlAOOu7vPxpS+PFXGrE5t5ozakTKt+Fth/odk?=
 =?us-ascii?Q?C4ka5bktgvSmalVWfE1PwO9i2cqPZsAuyIUIWvfcwaZjr3WlaCocitk39pL3?=
 =?us-ascii?Q?Ft8snFNnRXGhV1pvRrj0Jh9TPQqsr7nD3DdWZqCsrrjsdgvrXLxN57WQ57Tm?=
 =?us-ascii?Q?+rN/ZnDANTX1K0qwBdZGCwjKMlPM9o9m95pd2SppJUUa+KLZkGIdTGtnsHca?=
 =?us-ascii?Q?m/LuXcAGk3mwH7OuFwIhn3ll/zag4ZyqXcXNMjUz6IDTzb5JZ/siAR1o2vKu?=
 =?us-ascii?Q?SENnw9RnbEkn4w4xlwRYcY5jtFpfSDlQIS0wsXd47rmkcAymAFMSJ1hNdKTX?=
 =?us-ascii?Q?PUUqRU2k9rrUo04kQIcuIIBZAiUE74uo5TIXAcjALFBMC+8ARxd5uthjZ2ax?=
 =?us-ascii?Q?yO/b7t0IQaVqQFZu65Hvq+ecqustiRuwYXDdgFrBRk5K52us4FuFo+U7GhcH?=
 =?us-ascii?Q?XYskrXr1pRPvHv1lNXgGWq/tdd/SkISREiiQTCG380zlmPwWLRggG4q7LIQI?=
 =?us-ascii?Q?gHEsZvF+HIR4uNDSTzPI4N+Cd3NSYPCTqZ7b8OiqvnxdzQie1cSJGUs4MotB?=
 =?us-ascii?Q?QYgIPu/Y/um2FbQUxyAuAoC3avnqjtYCX6+hsakT5XIrSYO09qaJxIVRGxMg?=
 =?us-ascii?Q?ThhmeoSsG5MUCOSTBCT/vhWM6rdZ50EVfn8FC0IAibu1J1yzk6Lp3P9oc7sV?=
 =?us-ascii?Q?D8QpuZQCyOMUCeV8T3cQ90mw0utS/f55vCGfe/ZdVgw+2b8zj4I7wZx0pIfY?=
 =?us-ascii?Q?in2cWIq3DvjS8pMTk4Dmn5fHLe2+x/iDq3XFTuC6SouR/+xN/Qp7k7FEdIFi?=
 =?us-ascii?Q?5UnNTx1yTf1Mdh6TZJPTIi9LBxtTNpkigTja1F5vcmlL/BBTS61h8Lv1SRyc?=
 =?us-ascii?Q?vJrqaGFdDOYBNzoGhgg3XgsGdrM//k7l4dlYpyjOuj4Wjw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xap26Vi8yESynViPfQUQ7adA8t3foxk5rjqdFN8Ub4+d5Oa+/GR4OvF4o0ma?=
 =?us-ascii?Q?qhe3sdXYCdGEPGzawogHs782bsm+P4MpRpdvU0KPn8NjepC6IlF0FQgbP5ka?=
 =?us-ascii?Q?3/1J1HLxiEYdh6HRs5XrecDR7D8oMV8OXMw5IryUBdLZQt2Dews8HB6tuqsK?=
 =?us-ascii?Q?2KWYvFzfvF9eqe66mV4H+rLMOIU4xbk9pq7RfbiOuMwcTy4rHINzDEOkgLzP?=
 =?us-ascii?Q?CBt6f21obTxhMgzPkYeBXCqC0tTdFYQVmD6xUMSSulaXwkmlKIS8N0UYd+az?=
 =?us-ascii?Q?t69LncgcSNd943djyehqqMs1yQBmdlWDli8fUxOcDdM1m1rHwwahE3maiVSD?=
 =?us-ascii?Q?YYGJY/B6u9pVZsoGFcQGYE9KZSym+nxmdQUU3/+Pvy508dDGAE0/ysQt1Yyj?=
 =?us-ascii?Q?HrsO+ZuoQDCSEpx7QTBtLsaccGdDnFKRgqemvH6g2R8034/kd6vC+/SRiZvI?=
 =?us-ascii?Q?NkZRgB0MMjnSR0JZ5Id7AxwcigyxbyiCoOI9w+mo8h8N/tPd3kCRyTxTm5iw?=
 =?us-ascii?Q?LExnO1o1UKdNgFtz29O7gUyquEb4p0CttWP0+TdRltZSauDYaZafexvCNMKY?=
 =?us-ascii?Q?S5SKvpNImOIiCjnLnubF+/VvLGSRUOiV5j9U4PSQZ/ycKOjxCb8sYUyJcjEp?=
 =?us-ascii?Q?F4+E/Yp+CqXPoB40fEUFtzfdTe4Svc+yGfOYBk3/i8S3xMCcN+a0/jJLF/lH?=
 =?us-ascii?Q?lp0Z+tKUnaqMFBgy0xLlrCIW2CKQl553UmVlSAfzGmoyvUB+9m1KfHv2rPGV?=
 =?us-ascii?Q?cXa8KNiPJAAtME3bDCxcRlhBsDlwi9TpVAp+nmiRA5CzXNftrOE/ICMkxEIw?=
 =?us-ascii?Q?ObzGBkyinad78B4rF3v8qm+r/yu2qUyFlRwrGKzLgkCxmZfsFWhn1/UYLrLu?=
 =?us-ascii?Q?do45rhr2Pn4PINBJAWsvu3tdW2/IMOBH2Ln1j4Xoeh0kfVniybjbCHL+GA8q?=
 =?us-ascii?Q?iGFnZVDKgp8GbNBOL/APiZmiZ/PHxxvhAiavsK6jVg9ppG8AUEsKsoXvzMTa?=
 =?us-ascii?Q?cu24CdkflEMresFsnZieuIqoADTIlkGldqwQ8q7dh1Fqu5rCv5E8iwuyrsZF?=
 =?us-ascii?Q?BReQsZToHa9O8jtFB+c15BuzFv+NU9y6gkfCm8XKyllltTWIC1viAHIl/RIM?=
 =?us-ascii?Q?k1s0gH2P8rTECaOtw/HwUbzWNWhfZK28cZdmyDKizEmYwIeiiFyLI8uPF6Br?=
 =?us-ascii?Q?vT4GsqYOM3re6M8b3AmjjxnoG5wHlXMKuYyn24bC8Ubn0A4D2gyDhVNRgR2z?=
 =?us-ascii?Q?Lc/jqPzm5/t6Mi0ktz3rM35Qin5KpK4COsSyYl9PXOaF2/4t/yL9p/LusZsl?=
 =?us-ascii?Q?npUasCCakJUf3GbCBpems/sLy+Th9ivyHP9yOYZZaekT0caTFJ2QLiPDVqja?=
 =?us-ascii?Q?XPxgxzPygTcw49XBm83guM9mscqV5qno+YhbTfwEQN3yvr7eDRCxZ5XqnOHa?=
 =?us-ascii?Q?WiFPNqm9hltqM2JLMyLnpiJ/klMSH6WYs9145CiRuQCCq1xXvZ6mlR38S0Lu?=
 =?us-ascii?Q?OpFceoVgrSey4UgQJ/oKZbYreAHHnP0rp3oRvfQofSJz6DFwUY5EYnuekptA?=
 =?us-ascii?Q?kbRdFKTexcuwKXNkW4xucPBwcTmrwd+S3Yyf5h+85emGq2tJP7BJDxIEsqlB?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fe6c86-4e8d-4a4f-d95d-08dcb72b1ca3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 21:51:37.3676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7F3UBsKa0JFS4wPiC6o7HhlOqbMDINu1qpushuUVDivU2xcKrx2fiDdu6+Je/enPzAAyOosAIa7Pj0YXT+qSljS/gCa3qRDG98LE1bwqzeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5236
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

On Wed, Aug 07, 2024 at 02:11:05PM GMT, Daniele Ceraolo Spurio wrote:
>This WA is applied while initializing the media GT, but it is currently
>defined as a primary GT WA (because it modifies a register on the
>primary GT), so the XE_WA macro is returning false even when the WA
>should be applied.

humn... I don't see the media gt marked in the WA db. Does it need to
be updated considering the GSC is actually loaded in the media GT? But
it would be odd to write to the primary_gt. So... alternative approach
that I think would be more correct would be to change the implementation
in drivers/gpu/drm/xe/xe_gsc.c so it passes the primary_gt to XE_WA(),
just like it's doing when writing the register.

Thoughts? Would also like to see Matt Roper's opinion

Lucas De Marchi

>Since both GTs are involved in the flow, fix this by marking the WA as
>applying to the platform instead of just the specific GT.
>
>Note that this WA only applies to PXP and we don't yet support that in
>Xe, so there are no negative effects to this bug, which is why we didn't
>see any errors in testing.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index 540d38603f32..40354fb01737 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -19,7 +19,7 @@
> 		GRAPHICS_VERSION_RANGE(1270, 1274)
> 		MEDIA_VERSION(1300)
> 		PLATFORM(DG2)
>-14018094691	GRAPHICS_VERSION(2004)
>+14018094691	PLATFORM(LUNARLAKE)
> 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
> 18024947630	GRAPHICS_VERSION(2001)
> 		GRAPHICS_VERSION(2004)
>-- 
>2.43.0
>
