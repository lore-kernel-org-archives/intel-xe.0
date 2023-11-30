Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C41C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 21:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF8410E77E;
	Thu, 30 Nov 2023 21:32:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2C110E77E
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 21:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701379966; x=1732915966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/L/cXbK9lAJt3I6bWS7a0SIuv4piHNMlsxbai50O6DQ=;
 b=dOelvGz3TXfTGtdmyrfhyw4psh4ElRsy2u/W7IiUO8kWwjJCI93dRxCd
 LQY9wE4GpKuu/USTyzfC14DQ0wz+xph2wR102l6TLaVCMy+oX2zj1WQhB
 l4iTI/SACmJtGYKsBX3+apIN98kRnM9YJ5mut875e0SFt6Yh7xh1olPDU
 gyKGU8uKh7P87p4NHTMYfgXEQpcAVq8ydH0izulrU+KC2QyMx0NzA85qa
 Z/4OdDrFUoNsYZayvnPbxfsH6qd0IVmE5bZtJE7Hp3Z1NxNka6aNgUemQ
 v3GyCl9Cddoa7oRNenr7KDBh8xuTjO6fsAEtgtBcZBt232qfG2VenVLtq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="390559825"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="390559825"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 13:32:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="769432142"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; d="scan'208";a="769432142"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 13:32:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 13:32:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 13:32:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 13:32:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 13:32:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFoaTnadEKYLC3oMcYeeJzvz3TKcf2FwjJ/fcU0TuJdlde8WjxnkXLzLzaDb7tUVRguzaiUR5trZC74lPalQqbWRzNeBHPjth4HQp7Qy0sjg43SqaD5FXcUZqMNwDLbakEkUlZLQj1e6be/QVZylWNyh0WzZ3EP8/+I7a9LXaLlA2cmQgkeFtPfcQD+4DUpMcvgjXHYxtUMFkrQQR8sp7pPHc3n5Xi30+kylKtPB3Zhfwuo8lAiq2wTmxXnxaruM+QLfR1FSGilwHaf+XGdqPAIw50nvMOqf8I/czwUVvoJo78nVUf2zbbIQHZNpNgvW0gnqu2iP1isNyK674W7Yzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3QAwZLgAgE9WPRl0E/iUCE9eIqci5GOTsSqa8hCR20=;
 b=TDEqQAeMVrTOavvN8jIOcmt6WATdASRDotcmfUcUBTxMnPd2e9OWZkRNTjHdCG8zXht/kUrZK5+62LbLkePd+j+/iH/PRxcnLu4PbvvGi20XGcVQVEJkpjwFRqHET6B+EObJYPSLUa81mRvlDa2UmLYW8Ez6wHXcxZEJTJyWtsWXbNMJbYwMfBiwHdEEX3Pxix04Z4pj2h3YBXY+scbeoHAkAoB0Db1s7pde7JJPsxiEjOxPArF/SHWCrOZ+UBmZ9f1ptpbHbaMo0TcKcOwViKhgIqoF5qOEg7dOKz/vA6bV8ulFSC2K16iiD5uiRAKOfY9u/QCUdS8uUo14EMyoMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 21:32:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 21:32:42 +0000
Date: Thu, 30 Nov 2023 16:32:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZWj_dpyE75C_Ippr@intel.com>
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
 <20231128151333.4068550-3-tejas.upadhyay@intel.com>
 <80cd47a5-f157-4847-8242-df842c2e2aec@intel.com>
 <SJ1PR11MB62045C5257D79A6B5E47CCCF8183A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62045C5257D79A6B5E47CCCF8183A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW3PR11MB4538:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cd5626-3dff-49e5-9c98-08dbf1ebe254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tp5LyOP70m3tGlz3oNKzmB5uPa5k+u+KE/b3iKUyAu8s+NkKVx2/wGV62cPwjhAiSgzSj/gkzvnqlT/7rJpPUr2xmE4VD8TJ3uVwWczHdh2yBMDshOiFukgSMjm/mJhfhJcUHo3W/DI5qHOnrXKJByujseSWasbVMeABEPPsM5U0f0Lp5V1g2od9HJKdK2Jx0GDLXL22rNWdxjsVn+EDhZXRsifkZJYcM+wejxMk2mUvTLzMAxbdDfwSI3J+PG0tbGlRxu2/ZZTvrjjf4u9RelXdkYAbvv0ZN98FAyg3yHVQBru9tJQ4gtdvYuYBxLZ4Kq172hVPTFE+/w/s7H+Fq5iMlC/OdEJUD9eYLs27x3KJg7xf6AmbcwM5a2XrjUYwN2QX43DTbmeKVvRzg+/7OJsGaY85qUTkXfVcAlJaL4RCztBFjeym3OMIqjXVpz+dHh++66ztERUDkGpZD9jvI2phnQG4TWT2QakrpXITLZueUvhXfZ8CP2SPU0uKnxBY/BQntIiyB8XsZxNeOk+evp6LUvLehF0pZZT19q3ETYXLbTSDYmIEiixHWHrxRD6R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(2906002)(5660300002)(6666004)(6486002)(478600001)(4326008)(6862004)(8936002)(86362001)(8676002)(6506007)(44832011)(54906003)(316002)(6636002)(37006003)(66476007)(66556008)(66946007)(26005)(82960400001)(83380400001)(2616005)(6512007)(53546011)(38100700002)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XXi742TfKpjFlM9vbeoyC8vxPEGnTQByyNel8JT0s3Ft8EJ9XUc1e2cBNOyY?=
 =?us-ascii?Q?GaVLT03mx6nF5ZSPD9h92pOwqJ7pOLY3n3FmC7KWhvIT/RP5Vv5VLi+CufkQ?=
 =?us-ascii?Q?KIjHIKN5E/PU6vP3WxVFWa5bihUI5GaPkirUHX9rvrLbimbWO5sOJgt8kKCr?=
 =?us-ascii?Q?zh5RtXXOvDgleaJxtLhjpJrRgNKnby5hhgjsqoLAodjtrWepXfFs6lOn+FJO?=
 =?us-ascii?Q?zPzW7E1zAOe/VuD+djcmBJYNoPSdJdt8JlaU9fiGD4dF9XguJO5MY6FABV06?=
 =?us-ascii?Q?AKvDcLE5+nvx1so8WQB7L6h2OBRIyA/BYK30lLi/bSB6ZB/CadJYL7lYkFFN?=
 =?us-ascii?Q?VmqyeDivK/+3Uy9Vv2o84oHC1eK+T5bV5u3r8GKlUXn9+vy18r5tnckhkKQn?=
 =?us-ascii?Q?HFtFr4mURxLpKhjPUiYIknj0yURetV7WEGOuqFrydUQ9kRJ9dirZbW7++Ygw?=
 =?us-ascii?Q?sU/i0HP3jdw7NtKkOjfJgYCClHB9qvc53cWm06RSxKk8CDXRrzEBVpQlNpc6?=
 =?us-ascii?Q?TZJuy94vPi8nzH8KZI97E9FFjYrye2sHIZxDrsfVcgUUeD8cry7pqBp/iqvr?=
 =?us-ascii?Q?atAmWzAuFTNcrH8h1vvUiJM3qacD1Xlwrp9DDy5+XL78u90DyzqgDHwNkq5A?=
 =?us-ascii?Q?6Gw1nj83CTPW/ImueExpmgp7o+6ebR8zrLNDhBGHi4+nqaT7vLiURxhr5oGd?=
 =?us-ascii?Q?gZ8+tBLS1sitHWAXbt5/vXQ6MQroUopGUzyPBVxfE2h5K9iQfaUyX/OYE0/8?=
 =?us-ascii?Q?SQtGjSf2GpK70cCuz5JvYUzhD2vHV51zxkZtzxoHhG4dcDhDcuDrFVLZFJwH?=
 =?us-ascii?Q?OV5HOsVrTqkchogDRxBVWuys9uKAS2zc3OMD9/Q0F6Z7gXdWgp/BTgMmIhX7?=
 =?us-ascii?Q?/XLQuMpM9yz+Xl8lEoIRHww4TVHKDCHHBj6hpBy1H221wGypS23tdBy8EA0i?=
 =?us-ascii?Q?ffWm+ldsvY/jOBbCRPRX6NRL1duWzveQL2BlMhgSMsKUzOmQfPiwmgxvHXMf?=
 =?us-ascii?Q?X/vXpalzoLg5sPVzD7KU7bGxXZ+UyTQDvEe4/f5sw0Of11zEpB844yfrG8Zf?=
 =?us-ascii?Q?NMxGj+E9jJF2qTXJ8a3+dqEq72pjK2XC+gAo+NInRz6NBmSd0obrhNBLmlZW?=
 =?us-ascii?Q?q/KZ4KqL/DhuhyusFfrmWMAXTETGbgYMWWu7eCiyWwZKMCaUtEJ6gFVpemcH?=
 =?us-ascii?Q?NqHxKDuJgGzKmD8sR9gJdxb9XE4BvpFb5M4nO3vlmjVROl434MEYY0uNzEKI?=
 =?us-ascii?Q?M43im8zjXPstJqCbXpwdsR3Fi0AOwi/Y9aWf8Gp6FSemdqxIvW/LGsEexojB?=
 =?us-ascii?Q?XxM0y+otOIRoADRRfLpyIlg7dq5sSZjByMSA+YkXXu48XBiwVvHv7eYj+yGe?=
 =?us-ascii?Q?Lt6Uvn/2wkLjU5nApNZY03WgLGLyuRLG2XMFi97pI0aLJOKS04wJ/IbcwAeD?=
 =?us-ascii?Q?f1AUjQ/gHFUJnE5KzV1Aqj5XV98564o20jOQiUNPCtBsGJqZMLutqOe3CCZl?=
 =?us-ascii?Q?fU5kq9GwsYyZjoj2JOwFQ3T03LIXwUPyVIr3InHhqZc+WaDTf8S+7RjW9gcg?=
 =?us-ascii?Q?guAwbVpmhiW1Y9u5ESzvNS5YDmtSCiQyRIbA+141XFgW/+CByxESZU6txAJW?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cd5626-3dff-49e5-9c98-08dbf1ebe254
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 21:32:42.1867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rqgWTMgx57umE/x9IiVltXhgysm31pNf6BYepYpqKaMUwk8AVfuxkxk+cvkoCwCkdsFKKZ0E9ojFt180oHVMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M
 via sysfs
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 29, 2023 at 12:00:39AM -0500, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> > Sent: Tuesday, November 28, 2023 10:31 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [Intel-xe] [PATCH V3 2/3] drm/xe/ats-m: Expose uid for ATS-M via
> > sysfs
> > 
> > 
> > 
> > On 28.11.2023 16:13, Tejas Upadhyay wrote:
> > > On ATS-M CSC firmware calculated unique device id(uid) can be read
> > > from defined registers. Only ATS-M has this way of reading uid. Also
> > > ATS-M customer require this solution to locate and name their devices
> > > effectively.
> > >
> > > Consumer of csc uid is level0 sysman and end users using sysman.
> > 
> > is this generic UID or UID only specific to CSC firmware ?
> > if former then maybe just name it as "uid" or "uuid" ?
> > 
> > >
> > > This patch exports uid to the userspace via sysfs.
> > 
> > as this defines uabi, shouldn't this series go over dri-devel ?
> > 
> > + @Rodrigo

The biggest problem that I see here is actually the justification.
It doesn't matter which wrapper are using our sysfs or not.

A better commit message would be something like:

In case of multiple similar dgfx cards plugged to the same node, the
user cannot rely on DRM card number nor on PCI address to identify
which exact part it is operating at since these numbers can change
upon order enumeration. In the case of FW flashing or other cases
where the admin might know specifically which device it is accessing,
it needs to have an unique identifier number. To solve this case,
CSC FW provides an unique number that can be query. Let's expose this
number in the sysfs to make the device clearly identifiable.

> > 
> > > For example, uid can be read by:
> > > cat /sys/class/drm/cardX/device/csc_uid
> > 
> > as this is more Xe driver extension then maybe
> > 
> > /sys/bus/pci/drivers/xe/<BDF>/uuid
> > 
> > >
> > > V2(Michal):
> > >   - Make separate patch for csc uid capability
> > >   - Use %#llx for 0x
> > >   - Dump error value when sysfs creation fails
> > >   - Have consistency in csc uid name
> > >
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_regs.h    |  3 +++
> > >  drivers/gpu/drm/xe/xe_device.c       | 11 +++++++++++
> > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 21 +++++++++++++++++++++
> > > drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> > >  4 files changed, 37 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > index ec9372aa739f..3599c7b38b61 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > @@ -71,6 +71,9 @@
> > >  #define XEHP_CLOCK_GATE_DIS			XE_REG(0x101014)
> > >  #define   SGSI_SIDECLK_DIS			REG_BIT(17)
> > >
> > > +#define DEVUID_LWORD				XE_REG(0x102008)
> > > +#define DEVUID_HWORD				XE_REG(0x10200C)
> > 
> > Bspec uses different names .. and LWORD/HWORD look strange but since it's
> > for SW use then maybe at least (assuming ATSM is XEHP):
> > 
> > #define XEHP_DEVUID_LDW				XE_REG(0x102008)
> > #define XEHP_DEVUID_UDW				XE_REG(0x10200C)
> > 
> > > +
> > >  #define GGC					XE_REG(0x108040)
> > >  #define   GMS_MASK				REG_GENMASK(15, 8)
> > >  #define   GGMS_MASK				REG_GENMASK(7, 6)
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c index d60379d844d2..b54635d512d6
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -355,6 +355,15 @@ static void xe_device_sanitize(struct drm_device
> > *drm, void *arg)
> > >  		xe_gt_sanitize(gt);
> > >  }
> > >
> > > +static void xe_read_csc_uid(struct xe_device *xe) {
> > > +	if (xe->info.has_csc_uid) {
> > > +		struct xe_gt *mmio = xe_root_mmio_gt(xe);
> > > +
> > > +		xe->info.csc_uid  = xe_mmio_read64_2x32(mmio,
> > DEVUID_LWORD);
> > > +	}
> > > +}
> > > +
> > >  int xe_device_probe(struct xe_device *xe)  {
> > >  	struct xe_tile *tile;
> > > @@ -379,6 +388,8 @@ int xe_device_probe(struct xe_device *xe)
> > >  	if (err)
> > >  		return err;
> > >
> > > +	xe_read_csc_uid(xe);
> > > +
> > >  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> > >  	if (err)
> > >  		return err;
> > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > index 99113a5a2b84..4fbf0275d3bf 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > @@ -65,11 +65,24 @@ vram_d3cold_threshold_store(struct device *dev,
> > > struct device_attribute *attr,
> > >
> > >  static DEVICE_ATTR_RW(vram_d3cold_threshold);
> > >
> > > +static ssize_t csc_uid_show(struct device *dev,
> > > +			    struct device_attribute *attr,
> > > +			    char *buf)
> > > +{
> > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > +
> > > +	return sysfs_emit(buf, "%#llx\n", xe->info.csc_uid);
> > 
> > if there are no plans to use this value in driver then maybe just read it here as
> > it was already suggested by Lucas
> 
> Why to wake GT on every sysfs read and read those registers? Does not look correct in my POV.

Why not to wake? it shouldn't be a query that user is doing every time right?

> 
> Thanks,
> Tejas
> > 
> > > +}
> > > +
> > > +static DEVICE_ATTR_RO(csc_uid);
> > > +
> > >  static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> > > {
> > >  	struct xe_device *xe = arg;
> > >
> > >  	sysfs_remove_file(&xe->drm.dev->kobj,
> > > &dev_attr_vram_d3cold_threshold.attr);
> > > +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_csc_uid.attr);
> > 
> > it's sad that we don't have proper groups defines and need to add each
> > attribute separately (but that's not your fault)
> > 
> > >  }
> > >
> > >  void xe_device_sysfs_init(struct xe_device *xe) @@ -83,6 +96,14 @@
> > > void xe_device_sysfs_init(struct xe_device *xe)
> > >  		return;
> > >  	}
> > >
> > > +	if (xe->info.has_csc_uid) {
> > > +		ret = sysfs_create_file(&dev->kobj, &dev_attr_csc_uid.attr);
> > > +		if (ret) {
> > > +			drm_warn(&xe->drm, "UID sysfs setup failed
> > err=%pe\n", ERR_PTR(ret));
> > > +			return;
> > 
> > if you exit here, you will leak dev_attr_vram_d3cold_threshold
> > 
> > > +		}
> > > +	}
> > > +
> > >  	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini,
> > xe);
> > >  	if (ret)
> > >  		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
> > diff
> > > --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 268a40639ec5..e88b64cb0eca 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -239,6 +239,8 @@ struct xe_device {
> > >  		u8 vm_max_level;
> > >  		/** @va_bits: Maximum bits of a virtual address */
> > >  		u8 va_bits;
> > > +		/** @csc_uid: device uid calculated by CSC FW, used for
> > generating uuid */
> > > +		u64 csc_uid;
> > >
> > >  		/** @is_dgfx: is discrete device */
> > >  		u8 is_dgfx:1;
