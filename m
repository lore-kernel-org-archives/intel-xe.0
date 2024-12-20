Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F26DE77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 18:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DBA10E0C3;
	Fri, 20 Dec 2024 18:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8jKx+gR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA2D10E0C3
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 18:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734719683; x=1766255683;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K/mhkxBzKCoxyACXJOv14HH2rlnVYrMYw1TILJe5C7U=;
 b=U8jKx+gRDwYKfvjaB/ePDK11N5Ufxqmk+MyEMUgKe9eEkjfLBCZa7dr4
 JpmXQ+7zoIa7Wl08zdGzRWvdaXbrOFugDC9PM3yPh7v5LX+h/QKK4MRTP
 8HqYSKKck5xCsM9+p1K5SZNv/xP/T6IpiabG9m0ti3t7sq6LAXEuUndrW
 V6g5AQqriPvDFzCrYcjQc4ZBlKmSDdjlaOzRRVo0Q20IbKgjdO4u5bfeo
 9jnatnoGwG4XUuPK0nNx0YcfrtmZtsRLAz/mRkdZicYXy+ZcproVnYqn3
 XIm/HamYcPB6f4e3BKoBWRA3MLoQkA8Vy12/c6M1GPTcXAfZDX7ttxZ9M Q==;
X-CSE-ConnectionGUID: Lk3HL+sXRHm+G8o4TA6hCQ==
X-CSE-MsgGUID: GSjEz1wARHmrb1tcwv/SLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38959977"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="38959977"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:34:42 -0800
X-CSE-ConnectionGUID: qtehuueBQMiJZExvSNv2Xg==
X-CSE-MsgGUID: 5/7R/xQqRTS7YBcagQ9m0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121859381"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 10:34:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 10:34:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 10:34:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 10:34:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFiQaSckTEvA+8yn1Das5+33kz4QmUVHpXLyBKMcdppRqtOCAdXj4QQedq8AkW46pEbi9QdeFDVSFozizk5HS3MowgFBzlz7Sx9NMaNAXJ2aX8WOG994KLyOW8Ex8c7CPXsexTPwT7z4pzWE0Gw9bMAqYBkw9Z6vlbNbJdpqXU0Lpww8AvHsT4QMzqXeVPNIIwjiyXvwPPc3CGQTxCUfXTKdGSR/q4OfoYOCruK3+QWcqKHwhx2/p9m7gPQce+DDW0KFAcJzJmK/afxrO5SWaWTHL71x6NvSvVtcSbzzKw8WB3+VVjB/oQmBzG1Kjeu9K0MEgsRsxPu1tm7MwUvdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RMWX/OFlWiKzfKqS6qhhMNfQt0KKKGZYBH6xdcx1BI=;
 b=kO/EIQJxhDtOsNJOxh1gpx7tB2UwvsV1P8tyfpjHcSHFWJgj/i31mNDZbJBxGYz/KV7/o8Ypc2Hv0ukFpggXt2Dsl2jIULlfyrqaJnR6J9NFFMFjpvdy1nHd14BaF4dWrAODI3qOSXgJvxhQG+x1w2PZrtQyyMjAsXwvKYPwhIng+jty6y8P52/YsdcdOvfe6B8jFTfvzR9Dn77lqEI0jwpTrqCG/aAhsd5fSCt1+yaypsw+Mc5vHyj6GuML0Cek+Y8vJDqS/vlMOtzRZnqIvDT+gHUdmX20qSjNZlBqQtBy++fHTBoy3VIDp6IsXo3w1Xt21VV8Tj1y2URRoMrGIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Fri, 20 Dec
 2024 18:34:04 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 18:34:04 +0000
Date: Fri, 20 Dec 2024 13:34:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Imre Deak <imre.deak@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pm: Also avoid missing outer rpm warning on
 system suspend
Message-ID: <Z2W4mTZBwFPujqzM@intel.com>
References: <20241217230547.1667561-1-rodrigo.vivi@intel.com>
 <Z2LdJSyhpJoSNQ-Q@ideak-desk.fi.intel.com>
 <Z2WFSGR0ejBA4yTp@intel.com>
 <Z2WZNp0YZAehJfoL@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z2WZNp0YZAehJfoL@ideak-desk.fi.intel.com>
X-ClientProxiedBy: MW4P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::17) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: e714e377-b24c-4b69-7ba8-08dd2124e14e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z7JV9lUfUMOHNzniMG+uXUlknZDP3ECps86p3kcvwk7HfpSmXqrelKLT7J7t?=
 =?us-ascii?Q?u8TlqdkT6BXf7qiqsjOI2CkyN9cEWQo3z68CtI/eEp179UosYxdm2b/lyPWv?=
 =?us-ascii?Q?5IrVnVXUiEp3RF7Sm4JrwVRTePRG6UYAnwpQpTOQ8wN+y/c7vnRr4nM+M6hk?=
 =?us-ascii?Q?Ofo0ggdnFXHicmItgkiMPZf25d2sOafv+JpOsmSCuo8zKDXuDyP/oRJaie8P?=
 =?us-ascii?Q?N6EahTXjVzQLTo/JDnlVSl6oSDyg/XLOZSC23vlk5RkNsprRL7HLu12Ax/yy?=
 =?us-ascii?Q?Q8AnSxlBsTIGQgCHnGofyohQxxEV0S+j96gY0aitSEux4BAe7wjPhKidQhlG?=
 =?us-ascii?Q?VWLmEmfyUmObnJIXg9gxbT3kaySkR6ozD0QX5o6vkghoLRV+Cxo+j4p7lwSG?=
 =?us-ascii?Q?7s95xME5pvwEYcRGTEoweUOQxVAe6IWYMf24G3emzOLr0oCTlo0SkjUGop1M?=
 =?us-ascii?Q?pBHZ7TzlTFIqg6C7THa0hup4L8ZWvBQpngVboYpvH8dGPd7bBIWe+IArpXiK?=
 =?us-ascii?Q?b7mlsg8fj8EqoyzddCP7ZJdqiqir3QEYmJ38jSyiYuUoRVEz3wzdnjoSSSaE?=
 =?us-ascii?Q?ke2DhHJggsmc1kKYkCx5XdGmr2xG8uGGlNgHadMLWtD/qaNdQSzNy+7yooqx?=
 =?us-ascii?Q?jW/L067dBHbecRDNHNrB2GzpMhz8KecAyE/BabzzoH7QkSZnOhwxWHQIEp4G?=
 =?us-ascii?Q?nlByfevXXIyIgREsWOdRTV84LDr3wmECDKqYGQn0Fgo6HuuRpbwlx2TyFLnW?=
 =?us-ascii?Q?NgCohmFPy1B9uiVwQhZm56mJBK8tQ/8GnVLsRc28j25w2E1F9t74JPmw/Vl2?=
 =?us-ascii?Q?luIpIndoHGmimZC/qQl7g5nL91SfUlijsjo9mLyfmTgi6ZyJFBFHKvboLZsJ?=
 =?us-ascii?Q?h8KvxQiA5P7LNGs23i/w7F4+2q57UJGbEF101NvQ3Sd1IgInXUgQmi4Rt3i0?=
 =?us-ascii?Q?HAfTuvHb/atnO2Qq2lIMiMpw87JGw5M+UiPw7pHp4k4oOQfMmQ6BAtXCFGNv?=
 =?us-ascii?Q?KO/+38egKChv4qanlN4AN7+3ji4jFrycarf6GMrQKEcDxWGBIf4mSz0f/iZU?=
 =?us-ascii?Q?XfavCd1WhRuk0Thp9q4ocH1o1Qg/+PxBt+aJOaMuuqa95GSIdQzXO7xf+mjP?=
 =?us-ascii?Q?i64JcuN+RdybHxEz3yqn4gdku2NHeHAt/fM0cyDwGIQnKe+QPtOGeytr5FQH?=
 =?us-ascii?Q?Zt4Tj7jtXIL32rapYOVoJ+n1vGIBcs95qTebCmaX/oPqaHSezD6QYs7vg5tw?=
 =?us-ascii?Q?EZpt7Lq7nFYuZ1iAQyfn7jn0c+PoVYFjS98mcZ30QLT/jjut1YALFmD4DOxC?=
 =?us-ascii?Q?e9ZSY/uNU5wn3n4FfEGuAtR/G+FWhj2FrW+p4V2i1YFU2bKkxskcDD3tFEUC?=
 =?us-ascii?Q?LkB1y/xqLaSSLEe5pxFgp3rJaion?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sKiFk95TOw8QgB9KfBd4wJiCSB/edW+uFWz1ljYPjYEluu3PbSknjvC8oU6M?=
 =?us-ascii?Q?nZkHD25uMgVScoDIuQ++T2wDNNKSrjzdCd0ZAKY6TDgAE+0mBqnGhn3tT8wz?=
 =?us-ascii?Q?w2tQiuD94MeYYoYNdZj06GF1hCUMgE/ABhTlac7KVwbHloDobAP2G5ofRZ+j?=
 =?us-ascii?Q?AzQlG2uxofJFRbd9YBTV0KY23zL0E7aUjHudmEvor0wW4NKYpRib3/3fk80i?=
 =?us-ascii?Q?bZuJelCNUvZXUcEK8ofVwVGNSPxRMsBLT0NUeBFj+NWgp0WEt3JA0bkSs0p8?=
 =?us-ascii?Q?2BjrX0NWJJeMGI8LqatWeK8qt8a5K4eCTIrSmllB/5UF2Fnvz+cquHK/666q?=
 =?us-ascii?Q?ElA3I8/biflaSWXiC3nGyshzLoc2uNUmepdQdTlIuP9w/BeLIEpyTSfLuUm5?=
 =?us-ascii?Q?bdYngto5EkoZh0ZrTohGfDyeeLVgu4wVM7iBCoWzLZZ54wDI2wKRcpSJRZdK?=
 =?us-ascii?Q?6AxmhBWuk+UMi1a8atOikYUYcSuptJ90eF47SGGKoDTEvaxOKvw0Nihp/hn1?=
 =?us-ascii?Q?h3z7DKMjPTjtIBWId/ZSMXfYdJeJ6jEH6CIK+ScUqW1MKBrMdAa93Or8pANR?=
 =?us-ascii?Q?etctZOGhuHpuSoqgWieLZMykdfeJgpghD9Mv2m46DSvJoCIkJXICDYX0iRFI?=
 =?us-ascii?Q?X4OPvYOXAo5/JMa7AAuvmqN2Ts1fyM5bfFtv+sGu+CTeRl8nkC/XKATOyU8s?=
 =?us-ascii?Q?oT6caQ7NPeiUOszSXP2dztXjBpIf7m4Jgx/jLQvczXvY5BeeLTHXFT0itG3Z?=
 =?us-ascii?Q?E38K3XQ8lBhN4tliLEs/yaTA9fbcEtpUbDoqy8D6Dlmhhq7wSAmRDgnJsC8/?=
 =?us-ascii?Q?yD1BiiL2Ymq6egoIMhc5os53E4L57Yp+xDKUBQE1AMm7iXdaJ1Wq04Zmkcgc?=
 =?us-ascii?Q?5B5ebGL6jJfyNLjtZUcOw567U9gdTyUkwNMHmAVy+6EzkvPGMGZJxugQHZCZ?=
 =?us-ascii?Q?W9rIPcHTSBpQGU3+85pXn0EoSAApZp2m3cw/Ydkm6tTOEpHzI+ZzstyFLzP1?=
 =?us-ascii?Q?9rTzoU78V5b5+LUJORF6EGOUbVJp5ZEC9B10mZffb0fsed23nTDqVoxX7Ek0?=
 =?us-ascii?Q?FTcEVvdsugR0+1w6y3vHFo02fCQE8dC/PXVDqzIRiZ5vt3U+pEDT2t5dHlEn?=
 =?us-ascii?Q?hvTMOrGqw5ZkBaeyrQ3JbAbXb99i3+3xZjzg8ZziD7+GdQBVWQu7r+xWg35C?=
 =?us-ascii?Q?kPa4f8n+VQqBnvZ2nozIZd8ruNRKKrEvNtKzj8IkI1KzEemIjnZinCDrhL/O?=
 =?us-ascii?Q?CuUb/J6H9j1YBWQUyiOXTjm5em81fvpmdnLvG/Gux1LfxdJ8Ii/WoLz9mk17?=
 =?us-ascii?Q?jfHQ2c3boQnIdq7LQK04e+n6iTqhqGemgMY+yU5zqkwrkkEQl2XMRwiHQehn?=
 =?us-ascii?Q?S4+uQs3YMEDLM1ktpUFZt2Lzlif+CRNqMQmpX3BbzvhhUQQt5p1lodbkT+rA?=
 =?us-ascii?Q?SlJeXA8tgz9i3npIcp7ywJ6+r8s+Qta/jQXPTtL22ZAYvxPPcGrc4wUKsogp?=
 =?us-ascii?Q?sv7zcpBSvYmP/eKabn3h2iT4wvIeGpSWuuIXAVFmJXEBQwfqBrDLROvmCZan?=
 =?us-ascii?Q?BbeFcf9VD7l2tgmXcMD3A4+CV5H27ENJWOBNSvlORd66NGkVg69o13VdHFLs?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e714e377-b24c-4b69-7ba8-08dd2124e14e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 18:34:04.1548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8WEP+8uPf+9Hz5RzDnQtYaZ8eHg5EvytstIvydl6FmrmYeWoMcjH84MH5CFxspiAMdHpdJsK9zmLXujvgOqNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
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

On Fri, Dec 20, 2024 at 06:20:06PM +0200, Imre Deak wrote:
> On Fri, Dec 20, 2024 at 09:55:04AM -0500, Rodrigo Vivi wrote:
> > On Wed, Dec 18, 2024 at 04:33:09PM +0200, Imre Deak wrote:
> > > On Tue, Dec 17, 2024 at 06:05:47PM -0500, Rodrigo Vivi wrote:
> > > > We have some cases where display is releasing power domains at
> > > > release_async_put_domains() where intel_runtime_pm_get_noresume()
> > > > is called, but no outer protection. In Xe this will trigger our
> > > > traditional warning.
> > > 
> > > I suppose by outer protection you mean an RPM reference that is
> > > guaranteed to be held at the point (that is right before)
> > > release_async_put_domains() calls intel_runtime_pm_get_noresume(). This
> > > is guaranteed, i.e. such an RPM reference is held by definition (by the
> > > power domain reference that is being put).
> > 
> > not actually.
> > The outer rpm reference needs to be a reference on the outer bounds
> > that ensures the device is awake. _noresume calls should only be used
> > in inner places where you know there's something already ensuring
> > that the device is awake but you don't want to take the risk of that
> > reference being lost while you are in the middle of your sequence,
> > so you call the 'noresume' as an extra thing to ensure that you can
> > go to the end without device getting suspended because the other
> > reference got dropped.
> 
> Yes, that is what I meant. In case of release_async_put_domains() it is
> sure that the device is awake and hence there is no runtime resume
> needed. The power domain reference being put holds a runtime PM
> reference. So the "no outer protection" reasoning in the commit log is
> not correct.
> 
> The reason for the WARN that this patch fixes is simply that
> pm_runtime_get_if_in_use() used by xe to check for an outer RPM
> reference fails if it is called either during runtime suspend/resume or
> system suspend/resume. The existing code took this already into account
> for the runtime suspend/resume case, but it didn't take it into account
> for system suspend/resume. After this patch the outer protection check
> will work the same way for both the runtime and system s/r case,
> removing the WARN in the latter case.

great then, we are in the same page.

> 
> > > Instead, the actual reason for triggering the warn - IIUC - is that
> > > intel_runtime_pm_get_if_in_use() called from
> > > xe_pm_runtime_get_noresume() (probably for the exact reason to check if
> > > an outer RPM is held) fails if it is called while system suspending /
> > > resuming. This is the same scenario as when
> > > intel_runtime_pm_get_if_in_use() would fail if called during runtime
> > > suspending / resuming and - worked around earlier I assume - by
> > > suppressing the warning in this case using xe_pm_suspending_or_resuming().
> > 
> > The get_if_in_use is only the choice inside our _noresume so we can
> > properly check if the device was really awake and warn that we have
> > an unprotected case that we need to handle properly. If we were sure
> > to have all the outer protections in place already, we could safely
> > just use the _noresume option from the rpm directly.
> >
> > > So in this fix the above workaround to suppress the warning is just
> > > extended to the system suspend/resume case.
> > > 
> > > > However, this case should be safe because it is triggered from the
> > > > system suspend path, where we certainly won't be transitioning to rpm
> > > > suspend.
> > > > 
> > > > This wouldn't happen if the display pm sequences, including
> > > > all irq flow was in sync between i915 and xe. So, while we
> > > > don't get there, let's not raise warnings when we are in this
> > > > system suspend path.
> > > 
> > > I think the issue fixed in this patch is just a consequence of how the
> > > outer RPM check works using xe_pm_suspending_or_resuming() and wouldn't
> > > change even after the IRQ related issues are fixed.
> > 
> > If there's other cases where this release_async_put_domains is called
> > out of the suspend path, this warning here is showing that we do
> > need an extra runtime_pm_get right at the beginning of the workqueue.
> > And this patch here would only be masking this warning in this case
> > here, while leaving the release_async_put_domains unprotected.
> 
> Fixing the IRQ handling doesn't change how pm_runtime_get_if_in_use()
> works and hence how its return value is ignored in the outer protection
> check during runtime and system s/r.

indeed!

so, pushed to drm-xe-next.
Thank you so much for the suggestion, review and insights here

> 
> > > > Suggested-by: Imre Deak <imre.deak@intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > With the above understanding:
> > > Reviewed-by: Imre Deak <imre.deak@intel.com>
> > > 
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pm.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index a6761cb769b2..c6e57af0144c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -7,6 +7,7 @@
> > > >  
> > > >  #include <linux/fault-inject.h>
> > > >  #include <linux/pm_runtime.h>
> > > > +#include <linux/suspend.h>
> > > >  
> > > >  #include <drm/drm_managed.h>
> > > >  #include <drm/ttm/ttm_placement.h>
> > > > @@ -607,7 +608,8 @@ static bool xe_pm_suspending_or_resuming(struct xe_device *xe)
> > > >  	struct device *dev = xe->drm.dev;
> > > >  
> > > >  	return dev->power.runtime_status == RPM_SUSPENDING ||
> > > > -		dev->power.runtime_status == RPM_RESUMING;
> > > > +		dev->power.runtime_status == RPM_RESUMING ||
> > > > +		pm_suspend_target_state != PM_SUSPEND_ON;
> > > >  #else
> > > >  	return false;
> > > >  #endif
> > > > -- 
> > > > 2.47.1
> > > > 
