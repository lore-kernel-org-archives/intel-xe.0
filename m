Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A6FE77354
	for <intel-xe@archiver.kernel.org>; Sat, 30 Sep 2023 05:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADF010E1BA;
	Sat, 30 Sep 2023 05:22:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCAB10E1BA
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Sep 2023 05:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696051364; x=1727587364;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uGw7CaWZ2P1F/RyQ8+bTp8xK9fCn6CD2EMGkTou+Wvw=;
 b=YoDXJcj2Yi3UFIjr77l6zjiOwbH21AGyffbErABj7E7VtKxIGdst+zf4
 8iJR7WuN9BJFwb0XaShJECrK47uD0sGEX43vkTgzlXbSfVCAPXA55TUVA
 0ZIW5CPLRYu774eG80bS/B8iOOOKxsXv1tEG7MdvbbF1dIj0vvaGjdYbb
 UhT3KpxjMJ3zJyOunMMc1RnL1P/EdQ97T8DUbng9Vegf7oPGlhKe1luxl
 2A6uPjw7ClSPIeTgPMs/5pmxXZBYB2e/PVwikxY214jYSbPrPueCkD+Fu
 4PYN0piOLaguv4L1Eu9Y1fUWZ/lVKe7n/DkoiqXTnms/HWHly343IjTT7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="379706652"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="379706652"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 22:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="750117032"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; d="scan'208";a="750117032"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 22:22:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 22:22:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 22:22:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 22:22:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfKbyxsuaeb3sxGGGw9PEdszPm/XYzymuGTo5lmVryesTpW5MG+SA4QqBcLnOMBtTciTBjF7Rvt8jzUBarfrAnY6zBoF0AK6OM84dPyCKCfiBKH9CAFBqK1NC+zoDQRYEdxgGCQBhYvT+qmf/IrqZkStBlij8b32v+9AeoshpD6POnY2Nvh22/BxmRqfkknWWdSWXiHzuKNnVD1EuwVbLrUDdqQOrVExNkwtCFcsu6dJucRkkj3qGQaG4g9HBigI5mN9cjcQ9SdNZR3we24MXcGUhb/5TAp4pIJwiQpBwfdTmQSUKve2npIOmbysQOWRfYm/kKKmtDdEu201S5PkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4fKRA4G3fOzKMkrUDkQF+q4yC5ntT6Nu7uDhstB3TU=;
 b=i8rnpbdtVAahgsvz5bdij2Lj4ZHrAVFfzy94aZuxQWoYAskYG/tYtS5I63P/Fm4/mB69dxr7QPLawh7XgpGl/w89fCoenvFzdnE4qiiXST2LiNJbxsi997fFcbqVqT8PiKplPkepqIMocOYT+SgLWoEfCypES/MlIKOD72UBkWVNuQTeq1YuI2+kcjYhN2NPUbgiKfRR5cox1K+KQTfwVmsZUrVNNKHK6NYCkKF/kx4C4TnxqLnSy0KFwKfybAEh0R641VKej/YUSxP4hlwyP9vApXf62LAMOdbSWMoPkD5k0VwlrU3M0BryL0qYsLKI02dypFAXsIXoWe8IfVTPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA2PR11MB5033.namprd11.prod.outlook.com (2603:10b6:806:115::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Sat, 30 Sep
 2023 05:22:36 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Sat, 30 Sep 2023
 05:22:36 +0000
Date: Fri, 29 Sep 2023 22:22:14 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
Message-ID: <ZRewhigoUHKvYtWc@nvishwa1-DESK>
References: <20230929173104.2014590-1-paulo.r.zanoni@intel.com>
 <20230929173104.2014590-2-paulo.r.zanoni@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929173104.2014590-2-paulo.r.zanoni@intel.com>
X-ClientProxiedBy: SJ0PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::34) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA2PR11MB5033:EE_
X-MS-Office365-Filtering-Correlation-Id: 5700d088-5b3f-42ff-e1d8-08dbc1753628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wbEExJR2P3Qd8auEEtaTh5u2yX62/YDad1yp1u+aQwtPf0nz+WunPTCTipM+8DxwZEdeQfLeO3uk6Z+RL2A3AvisDZKA3dB51+C4dByxjUtOwxJJvd2B5fG3wZHb3SQi7HsLivcMuZeZ6ZsvczFqQzcjhIt6Kew1xRiPr1OnnrWe9HFN4QF8Z9P8O1Lr8nxrSNWB99PMqB6ZF7ahgFKw3h0EJx3Eptkn9kjnDIstLSpJ9RThLlQIMnHx2Kdj42fy3F1ILXuWv/2paOCaH7rMxf36pQGZLRpVK+dWpxsvpULe4cRv0dH7JbXFh0CPNb4/Jsemw4TbIosARf+PO0KJ03PXcZHp6RvuclvSTI0XXvTm/HLbof666x0AGmj6k6yUqv0ZiAmdERb2pJLq88ykLamfHp0rcxI9YgQ6tVY0Bpn2Pm6tFN+Dd+25jidx6JfgCcmub0PKuf+KhcCTY2gk7tSxpAX8sCKwm7VThcTmRDwjyvfM+92O/lVpsoVHgUO3wWfYR5h4vhVqMkjypNr0d85Gr+JlOeXFvs9PtYp9OoGqDO5jwihny7rgILpxqnag
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(39860400002)(136003)(366004)(376002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(44832011)(5660300002)(2906002)(4744005)(316002)(66556008)(66476007)(66946007)(8676002)(4326008)(8936002)(41300700001)(6636002)(86362001)(33716001)(6666004)(82960400001)(478600001)(6506007)(83380400001)(26005)(9686003)(6862004)(38100700002)(6512007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hcRpbwes3AqxuEJi3t5njLccxvPYTbTCND8adEGDUgpEGHYfm+S9dbKfHT2w?=
 =?us-ascii?Q?Tb0glfdKdSFUorDSwfDiJAIibs4WwtM5v/OgQq6gJaJ1vhrPMo+qrLocRd0H?=
 =?us-ascii?Q?RzApZm/pUDWQWu6XyxbuNhtIrePakcfGPMtcPEBmKxg++jbzABv5myEixW9R?=
 =?us-ascii?Q?1ZHaHpYkAX3wgXM2OCiWwpixGicEvFNFxSzHllpl1phptv9zvroLXSHJHjmr?=
 =?us-ascii?Q?LrJPl8lQklb0BlVOXupLqso86AGocSQVuk/c+cUtvNHm8E7OJh0KnAbzsgLR?=
 =?us-ascii?Q?2qMoJpmoe/Q/6J0+oHvF91W9/C+Obq2rhWOrOU647cGoeckm2eHsPTW1gOxP?=
 =?us-ascii?Q?Hewu25+BQ07jAmEabZAv0tgHDWlaL++2hPCc9iQizgW6zahHHkw96UEs0F+u?=
 =?us-ascii?Q?g6DbWkB6jP5gx3O1XsEa0BFp+UDqSYZHtFdcDDDpjdf33pcomZPVUMnaHxLa?=
 =?us-ascii?Q?jT+Nw1pq3BQsWaEvew34yG2dSjYZsdNzIxzxDl30GjsfQ4ERK7SkXp4kitYv?=
 =?us-ascii?Q?NOojFVrsjFc87FIFXlFZFyQxAqIuwdlV4eWAWHqIARGOeCyr7mxAmZW4wfuV?=
 =?us-ascii?Q?egUwzsQmRq4+CSj8nKa0e8hEq0rY8HAVoBqjt9KRQGyOIPLzkgMQp2BJ5MiD?=
 =?us-ascii?Q?yLd1vrsN8k3OpJM3aKY7jzX/nbIpEn8JDtIUf01yXAwG2LrQm42Z/j3/S/G3?=
 =?us-ascii?Q?OlNlZ9X6Wo+vk3tanSwgqHzhO6GJuMHWLiHTuaJwVtVyF4I684wjsfH0a1Bh?=
 =?us-ascii?Q?tr9LftpJcvKpLRXrvsziUixkORpf3iXseRd75FQs1lZnHSlA2WNAqKFahvrD?=
 =?us-ascii?Q?DP3ZmuB9tH63t8Z8ce5JXY47yWCrnAkbe0MVD0B/08iJMJMtTsoAtueCZ8fV?=
 =?us-ascii?Q?CMamP8NCdbTunWmOn9SwlPGIBfpBjBGs6HFmwXNdoDJwifjI5grH76/Akpq+?=
 =?us-ascii?Q?i58sonbW5UgrY4XnXG4apj/Tm8F3l1IrRMMVg398CRJT5JeeeeOK7i0Ruy74?=
 =?us-ascii?Q?eSPOlGKgmOloRektSDwkza4vo4pLyD06Lf5wRDVkU3G5EZt+DgnYTCnCmin3?=
 =?us-ascii?Q?zbuDk/Woj6IE7NVHSTvrRKO5MVwnWOOGZS2tCkcwA+L8IHRWP3BnZ0wVMHKh?=
 =?us-ascii?Q?9U3AuAsT3wG6+aOl52VPizmYOPa4hs3yTBJz4rB88biBd49nWztEoDJQ7N/2?=
 =?us-ascii?Q?q7fDmROJK8ffMyPVE97AIYB+4mLyuRgguNMg2asGyQMfYxcHOCmupadLGpJv?=
 =?us-ascii?Q?TDdrSt1yM2C3WKrsjed3WaV3sgJfqxiV4ZHd/NfHjFV7mOIgwjq+Bps6XekX?=
 =?us-ascii?Q?B5YpOG6hMX3m0v51qAL3UGrAIVo1lrLDVCPh95aKLLS2z4191aQnean/Ixe/?=
 =?us-ascii?Q?/NWd0mxBN/uNzRLBHQ32l3XaY8PamO+lfv8E958oC7TxuZp9qYgQ2gNGCmZ5?=
 =?us-ascii?Q?LMqopANjf7iQkcYJ8EkKyXL7Js53U9n4/OFnP2STOfxMHMLPzpYfmj9GQpTH?=
 =?us-ascii?Q?aj+ZVNoupY10lHWdLesXjCw6f0pUlUk9doEc6KTPKYV1LJ81zMG2LiH2i76v?=
 =?us-ascii?Q?+tZeVyf6qxKQo2tmFZ6Ng8xS6dcsPbhy+Qq0FRULaTd8F4YSS5C7UaQNE4q8?=
 =?us-ascii?Q?3KxRM/6gSg7w7Ms+RoxkbpE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5700d088-5b3f-42ff-e1d8-08dbc1753628
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 05:22:36.0386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1U3Dlts24YudXWKnfMjsTtD7g17KMfhDHiemAhUMQjQG/ZlWIwGB5R26dTYDNbOsligvZVsas6o6DgNCEcfvg1IaySozuk+OdF6EKdETBVxAUIWW/VCmMdxnmDe7YsEM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5033
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe/vm: use list_last_entry() to
 fetch last_op
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 10:31:03AM -0700, Paulo Zanoni wrote:
>I would imagine that it's more efficient to fetch ops_list->prev than
>to walk the whole list forward.
>
>Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index e72380cc832e..68bb70b471cf 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -3117,8 +3117,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>
> 	lockdep_assert_held_write(&vm->lock);
>
>-	list_for_each_entry(op, ops_list, link)
>-		last_op = op;
>+	last_op = list_last_entry(ops_list, struct xe_vma_op, link);

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>
> 	if (!async) {
> 		err = xe_vma_op_execute(vm, last_op);
>-- 
>2.39.2
>
