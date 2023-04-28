Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A549AC77B61
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 06:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9D210EC30;
	Fri, 28 Apr 2023 06:05:26 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503F510EC30
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 06:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682661924; x=1714197924;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Eyx9IUNN0RZQVeCc2ZkG6qvtKmj1BGruwMD2GwWvFso=;
 b=nRvb8BpWgHro7IZBdbg4+eRGwIGFMz9AlWTq5sXfGXZCUOqNpvt4B18l
 FfaLRTKCqPE1P3AKLHVg5+zq+Q6YAqewz4/+TntlsIucxBfXH7XbBuQmJ
 6H3lt3d1WnIth4ylQyBHh4f4CiKT3u4kWOO+AwuAVx0Rr53YQkvsBmf5B
 n4NCtTkfbQuV3emgHgdqmDyc9A4ljwtR1vXznNnnLCti6gOIDC6MA1zVQ
 769IM0dEx3l83BwSSY93ppqWXeHuFiCdpZy5TIQMLhAgN63xdUitM9NoT
 bqAv70F+pTHcbwtcHF3zqTrC4JuWVM1JfUwf3oo1Sofh/Q0kHnJG238xv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="350566510"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="350566510"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 23:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="1024459780"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="1024459780"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 27 Apr 2023 23:05:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 23:05:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 23:05:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 23:05:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 23:05:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRU/MCHsnPXsquLS8354UaxUYEVXjuy555gkBXJKBAksglKu1cFQBAHFz22ilur41tvOVzRAFmI7sr73Ot8ZKp6gzNIWlqjLJOgahlWxGpgo2wSTckrBOuWd1mieuL9NN8kWoU4YoenwlZ47KlSum3v/xIVHas4LiyEhtZOVdtwFJqYdBkPIKZk6zd/rIvfEOJYs07bL+MF9HUEZt9C8DyUiggnnID5pxfhxqSlRZFSd8LKRkKWoUIcHL5KOgTP69uX7gRZHplfRs+qSj6RJj7S2eRc+pNmRg0cctJZpGP1s/TyYIVl75EzFRKIHQW9EaThdk1Ac4LtfnwZykV24Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMASpehCOgOZbDFj8891c4zt6oNfGYm+OBBc34FCzRE=;
 b=B2fHPwdAwEAgx7O9R4kISHHeeBF5wmy7wkpOj34Dsi/5BOXELbAGgIYHQBQBE712sk2CL1wKyqJCkL0Jg9bfEzGZHthtGTwVetSO3Ndr+JoMm4wxIBHi/U32/3RO/ibzGSvPKiMgud6Mi9YfhlCEZi9DvZ6kB5EWkTO4XgL5VPwhtWg8WlmHgYuXD4j7Z4pnKYsNtzdTCBs+JMucSJvkPOnXP4Z7CWYcmTPWeSVwiMt1Gyt5q/YFZB6cCwruJner4sVuLoZpU6MQkUAHufTWWyIZL31NNhVIsvKVK+vH1pp6lTcRiA8GduwhUn/6VX2nVE26tRIDdYSDk7+zjFFf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8346.namprd11.prod.outlook.com (2603:10b6:a03:536::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 06:05:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 06:05:19 +0000
Date: Thu, 27 Apr 2023 23:05:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <g6pfxhwri6fz5gq6wjehzmhy4aqopfxjuf7h2di4vhcdtf25nh@bhoqcm7bmxco>
References: <20230412110923.1081273-1-mika.kuoppala@linux.intel.com>
 <ptsenxvgflgy34zdvchi7lz56udnye3gasw47a6oxo6lslqgdj@rzrh757fpeyn>
 <877ctxphez.fsf@mkuoppal-desk>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <877ctxphez.fsf@mkuoppal-desk>
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 05eb85b3-5da9-42d2-5633-08db47ae8b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xXc9V/eJbwZXPILngIgtn0Cxc6MXQpGQfB+JBYZ9Y7xf8mFdEvvH2DdCRzxpIP7/XFsaeNjbOB4vVc/Hh6auaNra0kUHDWZNyuxiMF4+BUeba7xCtQxNvG/5qL7+rszv+S5hRPKoR4lxJAHgrD5pQPYIvJcSRx5qGlW8lKu6g6HADTCsZMSzCHxKN3qdygQCw/0HOqsg+332juDjv4RNZwbJ/Ov/l95Ulc8S7vuHn8mc8M71LuCX2tKD6cDtOijVVu3nTG2baP877T8Js9nWOS++Ak7VTQlftDKnvaQGWVq4lgKrONB8NgO9j+kOyy3xZICgz7wX6JsCnA2NfExzitZFuHKW0eWe3++SIi/2OUMI+OWeDC7lRKo2IIVVB2PcuBFeswABAVnOJrLrUL5H6u+rs7Tl7cg5FoAwnIg8rj7q+fUFdjVwZqt/7aBTZQ2BCyXD2cDDzgK006382R9G9logHJLS3XrFnH5ezzePS8zUeLPIVGpPAHanfQrYS6wKdkxGXwwRCOeqlzqtLP6Jid4/QjlxDBdNLaDqVGj3Rv4WJXGGkjz6BcOUMzC1Bxhp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199021)(33716001)(41300700001)(4326008)(38100700002)(316002)(8676002)(86362001)(5660300002)(8936002)(66476007)(66556008)(6916009)(66946007)(478600001)(9686003)(186003)(6506007)(6512007)(26005)(6666004)(82960400001)(6486002)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CWU1YMPRUJtMRuyoHe3lPQGav9R9F3MFf0zsTTGj/Q/Kq7pkVmZ/5FuHMDmu?=
 =?us-ascii?Q?jsdgCQyqNnmUsCHs7ws2D/7I7LPcYTCKaDaPY6OhAU5Hy0rbXyiWXP0qXkFF?=
 =?us-ascii?Q?YqFI9idBkyW1GZMVtPaRhrOSP45oMAZqMDZw33F5PVYjyl2yd7BtwPbmx1ki?=
 =?us-ascii?Q?zRuKOoDRzawPPtjNJd9mmW4X6ikTWk0b7QAGceXeSuFbGqNUNcu3OV8yp+bu?=
 =?us-ascii?Q?ZULXZ17u0+FDj04WE8bzZn/7/VSyeyrEh7O4cJKNSTol/K9HESu2mA11BezF?=
 =?us-ascii?Q?Nwgp6RTBJbawg5Xp2h1EQuSl9eSyFEtBj0l9Om56yh1uCXEYAZpy9WIifFrT?=
 =?us-ascii?Q?UjGu64BINWmdFRrQh8OlbXitC1DgKO/cs0OusNtYrGtvnayV6fYsWd3JPTro?=
 =?us-ascii?Q?psM/Cmo/dvFHQd1GUtlKt7BlbitZxRYNtMXFCisXiBujx5lUGjKs2mxSkm4+?=
 =?us-ascii?Q?bJxp5S2HmSlUPSjnpV463cbEVzCkngWt4e5eF6ZPKPGUx1oF/2msJL1bfYgS?=
 =?us-ascii?Q?rGxSC4TKUq7pSGJ2fX3cy4CDX7gXrR5BEBOAl0Mla6xRTzvrGdVLFZNknzKg?=
 =?us-ascii?Q?pvm8eFaucADBrS7SLO9cJn4Vo4yqdYgqoydOihULRrnj+vocBq8FchG31XzV?=
 =?us-ascii?Q?Ohv+3lYRS9BXbgu5fmZ8Agg6I9NdepIKHIaHLc6Uj0XLLAtUeV6K9HeDr2hB?=
 =?us-ascii?Q?M4RtfmLHLRwGixR+grShgEZGolCA131JTzm8dCmIrIMnl6+BSh0sZLGkDedN?=
 =?us-ascii?Q?9o9YF5cRIFzQJJ3/Gb8G4Nf13pPeMweLVxoRgjlCrwB5ekpL4Sb1tzKFLRj9?=
 =?us-ascii?Q?puiuP2H6izlf0tFEnX2OEd2afsoMjYULWP2DUWySUarJvE+1VnJkSPphp7JY?=
 =?us-ascii?Q?Yc6zc3QbVdcctSRS+BEhV5gChmC7B3rz37AjlDQhi1L5fVe0NTXoOICeJa2Q?=
 =?us-ascii?Q?Uc1TbosU/1LFgFF7w6rFtUQgHCy1yc6Bk+qmLtW5yoUSB0d8NcmUpRywqit5?=
 =?us-ascii?Q?ignxYlyc2GdF2rnj1n/J7xYN4XSVGjlIzjcxbH/hE6gBq5/bhU9qZyBT9YIc?=
 =?us-ascii?Q?L8Gw+ADpHpTkgx14vslxzZZ51yUYlBlnGKPo943ABgfP6wpS9MUli2BgX/K5?=
 =?us-ascii?Q?6okndE1A9U0UTjbicU9VdFrAB0heRnM6DEbrH7d0uVWy9uw32j7Q5kuHYeVe?=
 =?us-ascii?Q?qGBa20FSIREgODcg5Kd7WBBLxYtF45X7L8W576GRXeMgSqfT2SAJkZH7TqKu?=
 =?us-ascii?Q?b78Sb5pPHK0iYisrZZmGfrD3kKiC41JhpDmLafpgOG4StClwmgXVc4oGk/Bd?=
 =?us-ascii?Q?vuU6d6DOcoxGXjTTqEmF+YS51mevLNlKEnd73eKyxrylK3DfekbR275mxhPO?=
 =?us-ascii?Q?3/aus+xlj2CMPg0JhuB0HPOwZRyht3UIgw//fGtuRooEOmbu5rAqSHizHlKK?=
 =?us-ascii?Q?+2amb3PQnQs4rh3hC4QosDY8dqKiaLSPcG9aTur9UPoDITurj6+vkyAcT9jR?=
 =?us-ascii?Q?5g8EtbqRjS6c1dqUFw/uxVUL6v0vOBCouWRk/ASTECk0O9LiwxuV/freXV4Q?=
 =?us-ascii?Q?Ak3b73tGHVrOcwQ8lFq3yM9PkkcRZ4xnp+TMLoWnMgfWz5/idX8gPkDitiaP?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05eb85b3-5da9-42d2-5633-08db47ae8b99
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 06:05:19.7153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXgZsNxzdUk+6l3gNleh3gOxoiJkFMlC0T6XlPdSNwEo+MHAqR7qSr3ENuEg7uKE8PsCYjElsw8ibmr7NSi9IdV93i/Uktpaa4ZswQ8/NxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8346
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: destroy clients engine and vm
 xarrays on close
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

On Thu, Apr 27, 2023 at 04:45:56PM +0300, Mika Kuoppala wrote:
>Lucas De Marchi <lucas.demarchi@intel.com> writes:
>
>> On Wed, Apr 12, 2023 at 02:09:23PM +0300, Mika Kuoppala wrote:
>>>xe_file_close cleanups the xarrays but forgets
>>>to destroy them causing a memleak in xarray internals.
>>>Found with kmemleak.
>>>
>>>Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_device.c | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>index 45d6e5ff47fd..30415015db4a 100644
>>>--- a/drivers/gpu/drm/xe/xe_device.c
>>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>>@@ -70,6 +70,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>> 		xe_engine_put(e);
>>> 	}
>>> 	mutex_unlock(&xef->engine.lock);
>>>+	xa_destroy(&xef->engine.xa);
>>> 	mutex_destroy(&xef->engine.lock);
>>> 	device_kill_persistent_engines(xe, xef);
>>>
>>>@@ -77,6 +78,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>> 	xa_for_each(&xef->vm.xa, idx, vm)
>>> 		xe_vm_close_and_put(vm);
>>> 	mutex_unlock(&xef->vm.lock);
>>>+	xa_destroy(&xef->vm.xa);
>>
>> looks good to me considering the xe_file_open() initialized it. But
>> shouldn't we print a warning or something on !xa_empty()?
>
>The xe_vm_close_and_put() does not remove from the list.
>If I add warn here, it gets triggered.
>So some work is needed on vm side if we want to enforce
>it being empty at this point.

ok, I think we can keep it like this.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
