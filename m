Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DA1EEC299
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6898510E30A;
	Mon, 23 Feb 2026 21:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T0mf7J8O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4087A10E30A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771883505; x=1803419505;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PjwT3yHGkhGIrPc8031mK2XTtDE9qn6Xy7UXC7Obbik=;
 b=T0mf7J8OUi5LI92ibkBO/eqPV5OWeKeVDa/cyS7bhEofQI5vfJODaNon
 DOAhipjBdox7lihbTUMg6KgEzm2nXZWDi8yF4LguAz6h8BEmj6ltWDZoX
 h0DKCcdKVx00QbIVWMdjA90IgDA+XOSxlDNRxD4RB8xzCq0gOEIAMzXMw
 LY2pq8NI2A/wsTwuDJjdr+PKHOvstia2Y6Tiay7XfeR5X2XvWQzPj3/s1
 BaEobi4EmG3g0WskDUVOrB0uB+BW+jzqL8ipRNGODFJkTPq4hCGAgxWr4
 SiNW07+UMbF1z02/tOYvmXk4scubB8QGVpbVZqDw1mw/jKMmXHN+m+PvV Q==;
X-CSE-ConnectionGUID: /coB1gzvSMGkClym/kXbxA==
X-CSE-MsgGUID: ossSl3a8QFeGKmTwN0BSUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72767510"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72767510"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:51:44 -0800
X-CSE-ConnectionGUID: 9C1CzxtdTsy/Ar0tSCk8Ug==
X-CSE-MsgGUID: LkKRtWXkTUGPJ+uUkwPvqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="219803111"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:51:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:51:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:51:43 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:51:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfvxglUFZQoljsLjLNnfpr46diTxV7SAQY0No8Cf4egWd1FmQwxPAYSNnJmip4/D75pbMqjnTd9G+zDRKk9okbU9Jf+xzPK+3a5rKYg4VadRojookJ/S3ZXP7+XDT57XN6ztHxL9ylHxC0S/tRKjlyoAxWYVMqV37ID9frRjT/3Xb4003D4VG7GpLsldGi5ziz75d0TxBsL856ZwE5pkrRRlQdReCmLjq3wFtwKwKRmCd4jHWJcZozS7/7ZKMuSik5bu4OQuKPQ0/Fc3zj2kL20Msx64W4zKaqnJQm7dDFbzMPMm9sEjF+RioITMKoFHSAahGTjGy1bQBK3EI69+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm42YNG4MEHp5jkO1k8xc4XO3VFC9hzW5hzY7oeiq4E=;
 b=R2UmJaTX9E1rEpHwVLFzCYIyxvmDGbMsx1ObzsJaOV4VrP2F24Cru+0Su681EdwAI02LpCUDSJqgWr4lDJl9qEDkL/8gIfWT2ZtH+OWJbd4BIGIR2TJA9/7uI0GWpK42eTTmB3DVFOjB2LCOpqrT2dGjvG/Gi6vuTIPDn3YGXdx/JdJf9dW9nUdHZjkELxXGK7+1zopiare770csFJ46U/38ggtNLPMxYrxRP0jV/csrvSRTri8WAdKu/7h1lSJpKrhINE2BmH3IsBoQu0+ULzuDxilk5EyCEdS74YZzuh+f9PJBA9n/Hu+gYOYz82xym8KjmIaqlZHFFq7eLimhIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6306.namprd11.prod.outlook.com (2603:10b6:930:22::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 21:51:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:51:35 +0000
Date: Mon, 23 Feb 2026 13:51:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 15/23] drm/xe: Consolidate workaround entries for
 Wa_18041344222
Message-ID: <20260223215132.GI4694@mdroper-desk1.amr.corp.intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-15-b12005a05af6@intel.com>
 <DM4PR11MB54563B692648704D815EE401EA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54563B692648704D815EE401EA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7abacd-689e-4339-7d06-08de7325b6a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pFlNC7LiQxJylIDqsj+DlZzQP8vWyaAZtgAq7eovN+UksRlhl/InP7AcDcmb?=
 =?us-ascii?Q?czcOBzJ5NoVVch4kCRzBfNwYuoBWbOc3BiaHRXvUpl3wD6M7W9vv7eznOW3m?=
 =?us-ascii?Q?Jws8kLjrLHFLoelshravOY6FO9hjDPhUR63PI7aozVCqb1y59r9wbCNIy0uC?=
 =?us-ascii?Q?8BHfff8sgKF15h95hoNKVBRv8JV9pW31tMt3zGNyIKyz2rJUE6N8YLDwuZ4R?=
 =?us-ascii?Q?SmCY0FZ1UL5JOO0bZq27WMx2F8Lv9wqMN231D+TDWG/HTAumwyHznFy3CX4n?=
 =?us-ascii?Q?4Zz59AtnP9ZLxWMXtBjVFvh4H8V+Ger5ZQorcOhWus95ioZ9ElH3+klfR/f4?=
 =?us-ascii?Q?JHNB0TusUNt5/dHXGOBaAXaOdQ59NucTPE70KSXz83FlyG3guD/Y2teHgUYi?=
 =?us-ascii?Q?zJxm2zDXlQVmJJRCWvucPNQ7sGEmmPOu3EyYyiz+XXaWmR1TcfyYr+Gy/1gY?=
 =?us-ascii?Q?0ldZ8w4CO1OAgYyaA4+QhXo81hmWK1oeq3p/caeAeFV0nW1T8PKN48UT8scG?=
 =?us-ascii?Q?zyLzxGECbRN/6t7iRnMa2Ye2qKXak1UVSH8S7ZtnxPHMUXVaons82NnOy3W5?=
 =?us-ascii?Q?WpYvrVT0CNzDZEeunC3CQJUyOV62HDj9zo9G+y+duPxtxdnV6a+M+cE0mqM7?=
 =?us-ascii?Q?crCcNQtl2vuSB+Ru5bK1Te+EnLxU1I5AfIMqy/sPxBRmWPQau/WLOSlShHz2?=
 =?us-ascii?Q?oGJiIwFLVLXzfdYuGpkbWmzo/g5GwzVdP8VE/86Fx1Kv7IngEOb4O2IgF1Mn?=
 =?us-ascii?Q?NzIq/9JYB/i18R3r7a0FpayRN5yv6BkB9dwIG7d6OwMvyiO8+wJS5SX0uBGs?=
 =?us-ascii?Q?aI+nMQyjFY5c+7asyOuHpz6iLwviwLI7vdCH8e8A7kN14ZhKoyFHSo+VKO7Z?=
 =?us-ascii?Q?RKmcr6lLeN0Tm5J9oXASoSWYtHyqYr2n7JJjabWEf23L1j7xCwGhuC02FUVm?=
 =?us-ascii?Q?o8icDVyytAf7C1nqnXcE2RW9NzRasfF/sZQH0z7sT+Phkvd2EBglxUQjouPz?=
 =?us-ascii?Q?zTJSP2/qGCtxSzR2qCXR9rx0Ni8WKSCPB4FHQPyh8S54KOMrOe+Zme80GQGy?=
 =?us-ascii?Q?J/YlsRrLyzPD3xglv5YaUT8FmKJVLRCjJxLuSUowgaLRgOS+u/WVbFUTopvq?=
 =?us-ascii?Q?v/1Yd+WjbC573p/2VbikQEa6v1aW0dP2MY38elnLdm4NJVinJPa+fLVtG9WZ?=
 =?us-ascii?Q?q6TnD94gojfyiiy9SMoi99Vc/iaBaCR1s2CDronycB7WU4i4RO85WkzB7ois?=
 =?us-ascii?Q?iEfUrf9q2da7qYr0GkXHZubJ1U/f7MlwKu5rp1sy93oXDtTjfj6gMFze3TKp?=
 =?us-ascii?Q?i/YDGcxFo1VAIgRqGc7Kr3ekPcIxuKyf5hG/9k5NS9dEXsyskdK4jSszYRF1?=
 =?us-ascii?Q?wxNnQRrJ615o10tyDmqT6Yk246LcyYl/6IMBDavXSHgOxaorN2GFacGazXtU?=
 =?us-ascii?Q?JxE8n1BQNojsINz5+4B2qWa9nHuA8K2Ys0+g1YdQMtOASPajojCoTjcVFPIo?=
 =?us-ascii?Q?FivQHOcjlyXic/CztPpQcsNmJ+V+MdA1NZvZCGm6bYyAvd7Zm89wYR3gR6ar?=
 =?us-ascii?Q?0UAibLcUBgmCzWcJEKs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I72vTOj+TxOhd4jknBa5d6Qu4hT8n9ap5xe4UUxfJnOtHxdSGAl2msx9rShd?=
 =?us-ascii?Q?R/4rZekP2BM/IPyH75wj/19gBK39iguINdfZ0UgrT1yz634CSjO4ISE2/MKD?=
 =?us-ascii?Q?iPEL/seREc89PmPYdPgx1un1tXPma3mbuUn0sVV4MnBPI0zbm/LYce/jpzig?=
 =?us-ascii?Q?4a0SZ7neAX8IGuMXzMXfGtSuOw5giEayXNLPMOrUCblbDPuLdttmyspamD9f?=
 =?us-ascii?Q?S5mDyfdpdjoQyLLUs2AwhkhTo4Im6z8o0zI+O2ZtMYVvhReQzJD8FWaCSFrr?=
 =?us-ascii?Q?GEA9Ua/wPVcStUUYFYuQNyBcGz6DPHJ6uLTWUm9+5gLq7UVrqAr/EcMEmhkC?=
 =?us-ascii?Q?delEpw51u9qgT49aQefx7tIdVZrQFkfj/xfdV9DGZ/aQfNMHrld5Igz6RBEU?=
 =?us-ascii?Q?JKGhsTmoP+yvjGRiFEYdHCYEnaadFWMc/h1NnX313ymQYV4St0s+mmtN61Am?=
 =?us-ascii?Q?7/YcyISzv23WNdhIqsX2U5IS9xHYTdzRs4vmyICRHT3Oy7t4bjesT7pibmqh?=
 =?us-ascii?Q?ugb3Sx8KC9tePMz/TvTxExOSp8EW3kMhC/Y1pfTl5F9fbBDufT9mVGOFLKNh?=
 =?us-ascii?Q?3K1SJYi50VM6z6Y5aYSX8Bxiwg311ZB/6u9MuV8obrf+Vkq30VTw+3ojnqo5?=
 =?us-ascii?Q?AOGAu8XnuhRWBLUUH0pJD6j72q3QthjnKmSOsfiIFVudXZwtVMwEP4LvbP5Y?=
 =?us-ascii?Q?JZVU23kh4hlySKE3vmBZoskkUEkF1Bbi5zokgLbqYAplzlvnxnOU735tg7Ov?=
 =?us-ascii?Q?to+pNoCy//8rQuwsS/1CbuGX/VFkLRY54PBEnS0fWZ5Zs/4t/XcKPwtUXSFg?=
 =?us-ascii?Q?S9ONANl//m/8ybnX0nBP/3x31XJHtvcLFI1/IB0XDTxZKUSdKVNPMsQXcQQg?=
 =?us-ascii?Q?yoOeojSoYd19+CD8S9W79B6WdoQHCP/pujk5ttMwwk3qcIKit7h1O3ySu9aD?=
 =?us-ascii?Q?48ty2ZOp4LH5Ti1m7g1f3X/E7nHMo/tmfhHKzez2BftQAw6gic5s+snirEHA?=
 =?us-ascii?Q?RA7rhwiofL9/HYY5j6MSft1SE+hWMkHLXeDtFKB62F1vju4m7KGxl33n/Ivq?=
 =?us-ascii?Q?rCnzbRPAB1AiiyntJP1fBB+lmeM/D07vcV8GXO2Pay8ivSUZixpt0hlyrqD6?=
 =?us-ascii?Q?CaDhznI59rvG/hqr2oLtMRMlDjbF6y0mtN9jIu0kHlHtVp/6nd04DTOL2fv4?=
 =?us-ascii?Q?MY2AetbgDaUbX1gwm6UVj7K4Vds6MLF4PxBZSfSjw4zrDrT1+zdiOeROTsha?=
 =?us-ascii?Q?lyg66k6qggGXiCAGTuc82x0huhMQfqpk1ypFbxM2uS03SZfhruyeZMXzZqfe?=
 =?us-ascii?Q?DNFUVL/0CH1seSOOekE8sZrQAPtNT9sDoK62VJZiSZ2tClHk5kIvC4P3PHOq?=
 =?us-ascii?Q?dMVwTYUxqEc4kzfdfQTuQJ6XGpMm1TGZxrYNwNF93jtPIdC+DJzO5fCEi7an?=
 =?us-ascii?Q?TM8GZU/Z09M7LhHX9Mx/OzntVNisNgVufjWTvDU7PraTKT8sdLlkyB/IS6qu?=
 =?us-ascii?Q?2nDBgoDay5AqMsAwhmD8YxWXH/AqIvajaNdTbfCWZqLmZ9DpNQqOSP/luQBW?=
 =?us-ascii?Q?VCtFEjn4ftH4oMFi5nde/5XWbScT0MKFTJPU30Q1i7bPIZAKObq0xBkD0ykA?=
 =?us-ascii?Q?3WZ00l9NafUvwTHl8ucWcqM+vA7LVfFx/IdHdiJSi/YYFBLPYX4518UwPX51?=
 =?us-ascii?Q?7cSDFbceqlkh1Yo8MwbqFz/ZlOZDRddaizfDiBQbH7aJ6MgzDrGWHKQV56ui?=
 =?us-ascii?Q?EuNhbPX1PQCdLNfWkFfnnZS/9FNZqnE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7abacd-689e-4339-7d06-08de7325b6a2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 21:51:34.9642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxycskqxAZnk4rMC4MbR8Vw8pgLSWtqhaxZ39JFPOIvlgtd/a8nDW02CqLlvqJXLIhigW1fD6d3NH5yjt9218vLfaNuGvsSq2a4yhgIZSLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6306
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

On Mon, Feb 23, 2026 at 01:47:57PM -0800, Lin, Shuicheng wrote:
> On Fri, Feb 20, 2026 9:28 AM Matt Roper wrote:
> > Wa_18041344222 applies to all graphics versions from 20.01 through 30.00
> > (inclusive).  Consolidate the RTP entries into a single range-based entry.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_wa.c | 25 +++++++------------------
> >  1 file changed, 7 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c index
> > 190b31a9d49d33e7fb80174be7ba9cbf726a8224..83318a4ebcb51e004497
> > e2cb9460e95691b5d9ff 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -385,6 +385,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> >  	},
> > +	{ XE_RTP_NAME("18041344222"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3000),
> > +		       FUNC(xe_rtp_match_first_render_or_compute),
> > +		       FUNC(xe_rtp_match_not_sriov_vf),
> 
> I don't see this func in the removed rules. Is it intended? 
> If yes, could you explain it in the commit message? 
> Thanks.

v2 of this patch got sent just after 0ffe9dcf260b ("drm/xe/xe3: Remove
SRIOV VF check for Wa_18041344222") landed upstream and I missed
adjusting this during the rebase.  I'll drop that line to match the new
upstream code.


Matt

> 
> Shuicheng
> 
> > +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> > +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN,
> > EUSTALL_PERF_SAMPLING_DISABLE))
> > +	},
> > 
> >  	/* TGL */
> > 
> > @@ -531,12 +538,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
> >  	},
> > -	{ XE_RTP_NAME("18041344222"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > -		       FUNC(xe_rtp_match_first_render_or_compute),
> > -		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> > -	  XE_RTP_ACTIONS(SET(TDL_CHICKEN,
> > EUSTALL_PERF_SAMPLING_DISABLE))
> > -	},
> > 
> >  	/* Xe2_HPG */
> > 
> > @@ -555,12 +556,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
> >  	},
> > -	{ XE_RTP_NAME("18041344222"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > -		       FUNC(xe_rtp_match_first_render_or_compute),
> > -		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> > -	  XE_RTP_ACTIONS(SET(TDL_CHICKEN,
> > EUSTALL_PERF_SAMPLING_DISABLE))
> > -	},
> > 
> >  	/* Xe3_LPG */
> > 
> > @@ -588,12 +583,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0),
> > RC_SEMA_IDLE_MSG_DISABLE,
> >  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> >  	},
> > -	{ XE_RTP_NAME("18041344222"),
> > -	  XE_RTP_RULES(GRAPHICS_VERSION(3000),
> > -		       FUNC(xe_rtp_match_first_render_or_compute),
> > -		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> > -	  XE_RTP_ACTIONS(SET(TDL_CHICKEN,
> > EUSTALL_PERF_SAMPLING_DISABLE))
> > -	},
> > 
> >  	/* Xe3p_LPG*/
> > 
> > 
> > --
> > 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
