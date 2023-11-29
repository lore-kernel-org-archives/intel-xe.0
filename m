Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B95CC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 16:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0111E10E638;
	Wed, 29 Nov 2023 16:41:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48B510E638
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701276085; x=1732812085;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=1web6++3+8UvxKnp5B5Jsa+bBq4SabD+4Du73Ax2/Cc=;
 b=jmqs23l8M1aY8mkH6AdPFTrDXovgPyzlofAkckXzMYV9nkXs3peCFpS/
 ACLT7lfV3Hoe9E03URnyPpGkpovcaxg71f5betYqwiQ+vT+2imlbQJk2S
 Zxe+wmcylRZg/Su4yFl7j03PE67i11H3RF0HUKPkGD5nleaD7Y1FRoWrE
 uDf021niheaCy6umDk7AaVJ/j1ChfhXWpMErmVodjbDKQq6Lpt5a7TfOS
 g9MD3zGrV5Yp2FaAg+uKx81xmJUiKUvjhBGA4d1WQeenQFqBqrkPjYCyQ
 EtO6r7F0YwX6KV7dTX4QFG8ju+Lrpdh7RhHA+OFDdB3SQmV0mY20pDjJd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="459686161"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="459686161"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 08:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="803354349"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="803354349"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 08:41:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:41:23 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:41:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 08:41:23 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 08:41:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuFtX2x160k4hf8xSbspewtWXJKSHr5JJUqcanbmiIs/Z5Mtf0mhpyNZ/RL82FPniQUfw14tOs8S8SQvRE3j0ooUxgtjGzCqAJulvwuvN+5Jw52GLPw1lFMUOlKjF2bWjK58OjVzYp02W21TbEkqkYDrOT9AG3uKI8NwrCSY4Rs7xIq5cTUEMetu6oXSZO6TdenUo793/kK08iBC9FBS1NO2ErLrmjUqR1yGSAKUTtRdNyStZHeu8t9JOumqDHD454aksz61Kr1LJQlZ8gF7+Knj4uwyyQGPRYQxtM93WFIrIOw+Wgg6dQOrDDZKhxZwbzqGeLB9LHijqcvZ/GyigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYhcCJy/eHW4foIO49mjiwR41VX2zXrwpxn4SL3F2lY=;
 b=gXoovAkMjABGqnf3iTW1RXrSF0nmpWjrUvLr036KRMzpHiqD16NK3CPWRKqf1Z7+8JbrqBF2+84AehQlvH2et+mJ+B0VhaW/dGkagLd+2NNYFV3tRvDBtN59knptA7T/Bhu328j9SUm4ffxLN4y/3nttd16QXb7Ev91cEgulk7hBfmY4g3nTtF5f8E+HWJ+q3AlWpKsEN4loxgQX1n4uEu9DC7u5ibDUMnUU7QRKSuaFLcXRck4Vut6xdKrcP9SfAcdHeCoeIl3pkzlRLOQPxjB7rS85ktLqezdc37oP7twnIVMJWntl7eRBo8lMsX88Lq+vlWLdLAp4BnLIEJZ8hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 16:41:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 16:41:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 11:41:15 -0500
Message-ID: <20231129164115.18384-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 47275146-eb17-424c-6e8e-08dbf0fa0438
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ZzHA9k9K1Ot+9bu5QEoBJ5Fq83FAFdcTcFaXnoFUPPANhCtepfnsr/ws9lwNH9R5c6+aGuUaf0umfeFQu2zEDwF9s2Rb3+B78KLsEt2VJOaEDDTYovgZ5jKD53Y/g99fedA95/83Z6z6i+xzR8LxCxdwjgZMM4WpMuqv0eUndxzDdG2ZoO2F38YHMUUXhh4JVzfvCTU56IvuFD30nF7q9O9JO/SbErV9RAfcVx+1rpWEiTeLIOfZQbZwe4F2uDCN2mazIaVSOJ02a3PIc/gTQqkFZ4sL9PU+lB5mxVGL5JrLzpNmkGpg1Xgx5ucpOAGs0KIvQJ8AYMMpEEgEF+pe9s2uwp+UBzDjDceT6qd//KrCQ0Ln/eAx5eVMsvZ9MLoCFGL1pTkJ+cUeUsUqEa2nlwJ60awDoKDgfrNJmSdULyu1SJGhWnwS5OhOhIAsDCLCn1e48AlsenGLulxHSEwr4MnJoGE3mhcmiW3hicprdD3P1oVoYHTIYrr99NIQ0Jwwps5ZTp7dzSTcPxb8bLUVyhS7/MIxr8QJ0rsmfY+Rr3rW1IXlt5hu50yGSqPv+UL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(1076003)(107886003)(2616005)(8676002)(6506007)(82960400001)(8936002)(44832011)(86362001)(5660300002)(4326008)(478600001)(6486002)(66476007)(6916009)(66946007)(54906003)(316002)(66556008)(38100700002)(83380400001)(2906002)(6666004)(6512007)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFAvek1QMENQUy8zdTRWeFE1Qm5HRE9YUTIyZXE2ZGVYZ3N5U3NBZ0Z3aEFp?=
 =?utf-8?B?K2FmUXJwQTJFUm03VHkvYVVYWWZ6blFESXFCVEdka1Y1UUd2MExjWHExdkkz?=
 =?utf-8?B?U0Z4bVlScG5vQXA5ajZVelhaQ08wM1c0Nzh1ZXNDSjYvOFJtOTBBa2Z6Z0pH?=
 =?utf-8?B?VW1oNEk4cjF4L3NvR01PdFZnbmtibURVZm00SEI3QUU3bmJweGxLNXdDMUdU?=
 =?utf-8?B?SktmcnlvL3BVczhNMFNzTk5DOEltRDRpdk9od1dYdm1telhWZVlhcU1qKzg4?=
 =?utf-8?B?K2hQMllPRTVuUGs3WmNtakEvc1FYQmtIOU5KNmp5bkhSdjRoT21BU2dBYTVP?=
 =?utf-8?B?Qzk3ZWVxd05lcyt3K1R1c285Z0FIWkl5OU5pS1djd0FleEYyZGkzOXpKK3lB?=
 =?utf-8?B?Q3JUeGdvdnUxYmszVjhNR3ZsNXAwWHFzUXBPb25hNzRETy9RWDgyNWErZmgx?=
 =?utf-8?B?b0ZOWVdBYWhqVXN4dWk3RzMvVkRzbDFzRThIeGprVmhiakR1a21DaDBpeDhX?=
 =?utf-8?B?dWFacnYvMFNGZnJoNG4rWWhSaThRZVlCbEZ2Mk9FWnlYYVVuRmRHSkk0bzVD?=
 =?utf-8?B?aFRMaWIxNFlpZkk3eHZrd3BWN1BSZjM3SEsrdWUyNnFHbEx3VlByd3BzZ0hG?=
 =?utf-8?B?OEoyb2dhWGliRmtXUWR5N3U4SlQ5c055ZEZzY3VYZnk3Wjk5US9Kc2lHMkpv?=
 =?utf-8?B?RFJjenlLM0NuZXlVeDVlTGdpdkxjakZvVEpRQzIvZVBrdlBpaFRwSnJ6MlVZ?=
 =?utf-8?B?TjBxUmovR0NaNDhzWUhFUWk3SFBBVU8xRVZ5OC9FRTNBY1hFeTRWMS9BUis5?=
 =?utf-8?B?S01oeXpOaElwQ2xna0w2NWhlN1NEZGFhSmh0SmJrdmhVaFYwQlpzSlp2a3VR?=
 =?utf-8?B?ZE9nRGc2Z1JYR3l2b0dXRWlmclJ3UDF0RjBRZVlITk5yaUNKZFZIZ2lKd0sr?=
 =?utf-8?B?VGxTRTQvRDE3dzFNVDJWeFBRd2J3MnlWOTZZd1YyOUdSSEpiTTY4RnQrUkdV?=
 =?utf-8?B?UHlrL2pzOFVLbDJBYXR5b2hzSGZ6Q2dMQjc0VXJhbGRlM0UwbWYxTm5tSGZx?=
 =?utf-8?B?WXVhUzBwWnU2RlYrTkFKdUdqR3dacUx0SVdRMjRCK29hTTYxcWhPeUdTamlx?=
 =?utf-8?B?OEVpTkp0b0JYUVF1eUdHMDZXaGtUdUdqbVIxa09PSkJ3a1o5QkZ5YmdoblpH?=
 =?utf-8?B?YlN5VmQ0S2xKUkdPdVJncmo0NnphcVQ2WFFaKzJqUUFKaDZTWCs3U1dHc2Iy?=
 =?utf-8?B?OTRReHlFUG5ud0dnNDVlV1FpNDgwVURGS201b3ZWd1RUcWVBbWhzdXRxVmhz?=
 =?utf-8?B?U0xjQjRYNjJzbnJjNzdpUmZPdUpTN1NCVUE4dGl2Tm9MUWl2Mk9rWCtHcTJU?=
 =?utf-8?B?cGhKWDdlSGkrT3lrOUNxeTMxK0k2enY0T3lrK3VPV21SSUZxZE14Uzh3MWNN?=
 =?utf-8?B?VFF3Z3NjRHpTUytnaGF1MnR6cTNibVEvMlphYXFTN1JMSUErVUh3VWVHSllF?=
 =?utf-8?B?aXBlSDBlNUEra0hSUnBWVkZqSlFKODhkTkZ2RGV3R0ExRGtubnpiUUVBOVRp?=
 =?utf-8?B?SS8zdVU3UWpGK2YyNzR4cnlpU3k5YUIwZjBDWmtkTVNIM2Q4emN4cFgyTGQ0?=
 =?utf-8?B?NTcrZzRzT20yMkZWaDBoOExsZDRPalB6c01kTmZvL21vSThyd1dSYWhPK2Rr?=
 =?utf-8?B?YlF6OXlzTlk5KzJkd2RueWY5blNpQmllZ2ZONGY1R3VYWHVaSG1rV29NRSs2?=
 =?utf-8?B?eUd1ZWI1WWZhMXhGOEI2MmVnWk82dkQ2WEFHZ2FSaEpCUHpMTHg2S2RpWEdr?=
 =?utf-8?B?Y3lJNkRyQXpScmVKc1FNLzlYQ0dyaElFdGxuQlZORWNhRW1jRWxXcGljQno2?=
 =?utf-8?B?aERvN1dXSUI3Ky90cHI4VzJiOERqSU54aVZjNkVxT3d0bnM4Z1pJM0RZaWRh?=
 =?utf-8?B?cTRoNW1iRlNoRGVKRFRPKzJGRGJnOWtidU5ML09GR3hIRjBtSWFoYjNnUGwv?=
 =?utf-8?B?SjNYelJtU00zZ3h4L1k4K3JNTWFZc25sdWRDZ0dBdloxdHZxMjlrQjdyNVhw?=
 =?utf-8?B?VEs1UkxkbmxoYTQyNVc1TjhvNVduQXhWcGFzTnh4eTA5ei9TTVlRa1Z4a0R3?=
 =?utf-8?B?bVcrZ2FYazVmQ1h0SE5YRUg0bUMzN0lVelgwMCtackdERFdqelBBUENCYStK?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47275146-eb17-424c-6e8e-08dbf0fa0438
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:41:20.8495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3b8XnOcByZ9+y43lPAeWxMkFnmoq3QEzZXQSbXuCIGVGOicX5MiPEcuP5g6UrXcd+v4mH2wKPZ2p22wAmpG5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC] drm/xe/uapi: Kill exec_queue_set_property
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

All the properties should be immutable and set upon exec_queue creation
using the existent extension. So, let's kill this useless and dangerous
uapi.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---

Mesa is the only user space component using this IOCTL, but along
with the exec_queue_create so it should be easy adoption since
it just needs to use the extension and follow the IGT examples.

A while ago on i915 Mesa team started a clean up on i915 uapi
making sure we had immutable context and buffers with all the
properties getting set at creation time. This API here now
goes against all the good clean-up work that Faith Ekstrand had
done in i915 and IGT.

So, I hope we can entirely avoid this right now.
Although only Mesa is using this IOCTL, that might impact other UMDs
since it changes the ioctl numbering.

 drivers/gpu/drm/xe/xe_device.c     |  2 --
 drivers/gpu/drm/xe/xe_exec_queue.c | 38 ------------------------
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
 include/uapi/drm/xe_drm.h          | 46 ++++++++----------------------
 4 files changed, 12 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 54202623e255..8a96551ec836 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -121,8 +121,6 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_DESTROY, xe_exec_queue_destroy_ioctl,
 			  DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
-			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_GET_PROPERTY, xe_exec_queue_get_property_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d932c31f9fa4..cfa632d60c62 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -883,44 +883,6 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
-				     struct drm_file *file)
-{
-	struct xe_device *xe = to_xe_device(dev);
-	struct xe_file *xef = to_xe_file(file);
-	struct drm_xe_exec_queue_set_property *args = data;
-	struct xe_exec_queue *q;
-	int ret;
-	u32 idx;
-
-	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
-		return -EINVAL;
-
-	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
-	if (XE_IOCTL_DBG(xe, !q))
-		return -ENOENT;
-
-	if (XE_IOCTL_DBG(xe, args->property >=
-			 ARRAY_SIZE(exec_queue_set_property_funcs))) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	idx = array_index_nospec(args->property,
-				 ARRAY_SIZE(exec_queue_set_property_funcs));
-	ret = exec_queue_set_property_funcs[idx](xe, q, args->value, false);
-	if (XE_IOCTL_DBG(xe, ret))
-		goto out;
-
-	if (args->extensions)
-		ret = exec_queue_user_extensions(xe, q, args->extensions, 0,
-						 false);
-out:
-	xe_exec_queue_put(q);
-
-	return ret;
-}
-
 static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 59a54bfb9a8c..8b587d1b2c2c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -55,8 +55,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file);
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file);
-int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
-				     struct drm_file *file);
 int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 				     struct drm_file *file);
 enum drm_sched_priority xe_exec_queue_device_get_max_priority(struct xe_device *xe);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 2c44845c4ba4..73085232821e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -106,9 +106,8 @@ struct xe_user_extension {
 #define DRM_XE_EXEC			0x06
 #define DRM_XE_EXEC_QUEUE_CREATE	0x07
 #define DRM_XE_EXEC_QUEUE_DESTROY	0x08
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0a
-#define DRM_XE_WAIT_USER_FENCE		0x0b
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x09
+#define DRM_XE_WAIT_USER_FENCE		0x0a
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -741,38 +740,17 @@ struct drm_xe_vm_bind {
 /* Monitor 64MB contiguous region with 2M sub-granularity */
 #define DRM_XE_ACC_GRANULARITY_64M 3
 
-/**
- * struct drm_xe_exec_queue_set_property - exec queue set property
- *
- * Same namespace for extensions as drm_xe_exec_queue_create
- */
-struct drm_xe_exec_queue_set_property {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	/** @exec_queue_id: Exec queue ID */
-	__u32 exec_queue_id;
-
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		7
-	/** @property: property to set */
-	__u32 property;
-
-	/** @value: property value */
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 struct drm_xe_exec_queue_create {
-#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
+#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
+
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.43.0

