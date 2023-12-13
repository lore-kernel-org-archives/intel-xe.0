Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA65C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 17:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E425810E095;
	Wed, 13 Dec 2023 17:57:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6A310E095
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 17:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702490260; x=1734026260;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LbDNY35mxVuN1rVgxh/jI2lO40iqAWRwtO2Gjl3fDXw=;
 b=ISOmpJfj/N5ZfDNJzTqfmK/Kb9y0N5cWBNvpzM8ObHVj+WmJ+W2EFuN1
 i1IEEEFf0RFkyLxvo7XnP26IrsFCrsCvZwPE/0k5ycTqyTKORgkBB8WHD
 WBW7fi5tupelEwQhefctOlCNAsin7l36UVU4HjdzLpK48i4r71Jck9tx4
 9OOCl/iYcQUmkmaC/WaSOdZbOfEd3kakFxBJkZzrPU99rWEZ3hBiXmTT8
 AHF9xaIPFpTVFl56Gh1dQHGNdaNa9LLAAH9c82z4UwSc4Ml/YFN/9FMWn
 9ZujzlmpkmF4lwZv3d4oUCGbn7oHIZThu7w8xdP85zsxzFv1Mzewhcu61 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="385419429"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="385419429"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 09:57:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="22071708"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 09:57:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 09:57:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 09:57:36 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 09:57:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvCjNdzewWC27SEYGgFsEfH4Y+K09pdt6y9AvtJnIsAQmDvJiDiiIljrrQIhmUQj6nQp/Cch7FxlzKnK8tlZZCtz6tfpdXShJgn2JgAN8OmMuVWq+9ODofMyHOblx13OANuYq1lE57GeDvQSmFPGjVF8ZF+b2BvgdoJraYxd8qSB0jcYsPeCtW3yYkxERfGJhbrYeVMbo9xlv/0zXmfIjXDXhXQd6FkvN2lxeRdfpW55ulEy8hDUzpV20IYgpDpmDHT07quljmihYwMr5I3OGzQBlDiAyfgSPIlEWf5LqlQq4BhFhZjpwI1Ep4PiH6Rbmexg6HqCiimIy/htfQHXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5/Vz8cm8CLNAi6iiI9yD4i8K/uaUQWcHoZY/dW0NPI=;
 b=I8ya58AcgPEtH7kz2u4jjO2IxnfM4CSkQO1MyUcA63zNXsXVr8PS1pRTDe+NWW0H4U0KdrQ5L7HJYRJsDlES4S9hbUMBK3qRmAZzmywrVBEkwqlkbvq3jYVNLVnqYGsbsDBIhJ71SDeINJugLJ+n65jNWsBxThNW90WSmJYgqD2Hd0ueMCQiyonzsmnTt0PS+8DyAtF6cs5A2X1jYXlqUhin3Ab9d0prath/SUpzezbbGKaIRcz2vzB6VGfZZBxJk4e+0DX7xf73laXJl1gpXriqiojMO9JzIEHlYeLtWEHrwr0LwTOw0bVMrSM1SpPmckXvayrqFtuocfYvG2d9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 17:57:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 17:57:32 +0000
Date: Wed, 13 Dec 2023 17:59:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Uniform async vs sync handling
Message-ID: <ZXnw+J7tM+UUi8fx@DUT025-TGLU.fm.intel.com>
References: <20231213043517.609363-1-matthew.brost@intel.com>
 <22f9b3e8e2e0ec2e7d5da4f3e6e9a1b1b4cc0316.camel@intel.com>
 <73bce39d-f902-ef27-72d8-fbad642a37ca@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73bce39d-f902-ef27-72d8-fbad642a37ca@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb07deb-d505-40e9-0ff5-08dbfc04fab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UWwJ8OTQoui48AWMkanakV2opoZBrfoEFw20KKrAEbq74RQ0Rt5oZ4OGiNj6G3F62g2eXNWKbkSVnAAB12VtWBgUL0b+GCdP/CfPjDUWG2diHSliZXXLoXLR3ogu1+Eu1A380ltRuvjDKplA4e4NgnN21SQOZJv6A5LbpTUaqaTcZ0dKRIMPPWqlqliQP5qSeFwZwFXM+aU/sWJFrMvpcSzul+pEkIPYpcac/FmkSqY17FR2kSpf2GTCVLRI6BHCiWUMQaZQQmUNYxeFcHkIrTSr7ETUW18UWx4U3HADNTXpThtqJeQSPh9V7fZMdY4gqDfH/Ky1mXVoM5ZNsxx9E+MUFf9b+TIjLkv/iu0ctt9GNf9z+aFLPDVF6d4U8MtkP9SUnL3djejUb01QeQb/1DsUsDwU+YukIkS+PC5WAfcKeJ8l+sHF/Mjzb5huNK2oP2woPIHld8xrlMVBPinwc/BTxN8g3EKfTDcIr9HtYAaFx7ccuPnm7Pw82ySulzmlOpUDCFoBCMjtBhvibr9OsnkJQRVANiAm0Dmb3rUi/TW/2pGESJgSDlBvx4GFCQhw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(66946007)(54906003)(6916009)(66476007)(66556008)(82960400001)(86362001)(38100700002)(4326008)(26005)(83380400001)(66574015)(6512007)(53546011)(6506007)(6486002)(2906002)(4001150100001)(316002)(478600001)(6666004)(30864003)(5660300002)(44832011)(8936002)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2sa9rDpd4m8rrClrpJ/YhAJhnw5EowmP+AvlG95w0lccGkLheuVYLvwKKH?=
 =?iso-8859-1?Q?IGFLKe87aC4i7SiQ1qUwgWprjK89hzp3dxmPIJKyrzaRvDQvbV4+UciJC9?=
 =?iso-8859-1?Q?7CohMIyHMPN6RKNh85ug403GmlhiQ6w5i/u/4AUx1JclY+Z4N2hCvDdQMP?=
 =?iso-8859-1?Q?HwFSXepmfNpJvAvFJzg9KJiGq1s0TSdgkbav1MkQ0ZdRYkqhdPs8mHZUza?=
 =?iso-8859-1?Q?Z1EBgR+MlTJ4cE/81AbhdqwEF5/ud5QiTksiIZP5G7wtiUIf8krcRXjIsr?=
 =?iso-8859-1?Q?n50YLndgjs5+wK/Q+1ZIweuAd5bVZOVRpcxG1k8vSTG1QrVR4AfElYgaX+?=
 =?iso-8859-1?Q?CuK0s3DbkWmb7VX49ysS3XSk0CxA2EdnLIfm8NfKaOtyLe1wWjGLNYZ+QU?=
 =?iso-8859-1?Q?L0T72Zn7s7TVH/cedDGL7JevSRvBYylSC8rJdMFp+gqOdEJcCEQztCLFFt?=
 =?iso-8859-1?Q?E0AhOLx8ZTz/3YlCuHav59NdUXQ2PJYCePLzfYvoMzo8OSJ9CNv75jT7yz?=
 =?iso-8859-1?Q?teynqAuYTyz1lAo5ijMo+qsW1Ze0z+kWbZxBDl5ln5SJ4hcXYtr53bA3Yv?=
 =?iso-8859-1?Q?WoNH0BfllTuxTcJg1AV3yWvA9wYPvJAiU7kwMmsoiQ5uh7QPpxOqcsAAgF?=
 =?iso-8859-1?Q?xJVnMyw6zLRl2oS7SW4na0u76ULPMr6DGCl4aAq2gD3PRppiz3+3fl4+wI?=
 =?iso-8859-1?Q?J+m3YAe7f57d9e/B6bux4lpH2YO/KA5IKRah4Ue+aZxshT0enfYCK0cYWF?=
 =?iso-8859-1?Q?gnmts3BT2EaaXesc1zg+YmJLqpgRs/mAXkxZqopzf6APCcf5gM6/IOtSsE?=
 =?iso-8859-1?Q?r5iB8LqVUcp/46qoalOrE8N+phLz5nvvOD3aqxFXzTpXvPH/CwjH4410Tj?=
 =?iso-8859-1?Q?rRVzznIxSeBXwVep729qUmSi6po/H9gIjgeTGDQSMfTFbhV6mhaARS3W2i?=
 =?iso-8859-1?Q?jkS7Go4s6ZEJuFGXTl38HPXLP0gNZbCbH0h1JmQBJLoZUgG883BCVEFb1a?=
 =?iso-8859-1?Q?h2QPI+YS7Cb+xftVyxE88XEqp2Q9jk4R2fvMD1au3b/VZAlPkG26KWHwVv?=
 =?iso-8859-1?Q?+raSrZ9h22CwY3WX/aH55PeEJven6umZ+mLpBg5n+1g4RNrtXPAsoejvW9?=
 =?iso-8859-1?Q?MT/H9DmOYSzlSTKQrc1748UiwB92OUGAjeTnRc+htRiiTPq4D6z8b4TjmC?=
 =?iso-8859-1?Q?LAMpGaFl8DEGBqHXtYvy7z++KGkoQIg1wqEzdIimIvRzPyXhGyiCbwSgke?=
 =?iso-8859-1?Q?tvP4tjO90oUURklwV50PGYrYt3unq4ftnpkx4piv0/wRRv4p0AOwjHjzOn?=
 =?iso-8859-1?Q?OTXS+OEgnpwfjdDyBhuafVJZA3cbTAkUtnfzP8mBjiqwp587tuzR5rBu8h?=
 =?iso-8859-1?Q?pHaZXwJQeMEfDSbYedZu1QeoxIRS5eyDxmVUoMlVaAXx9qEi09RUisqxWC?=
 =?iso-8859-1?Q?0q1NT4rYMqadj0d46jgw8eDjoM8FFMO4VF9/+escjV5rHGTGrB4YHuPh2g?=
 =?iso-8859-1?Q?bi7y/1WzH2g1Pkp7107sJd56mB8MfS/WJ5aJG7R0H2TIq2CKPS7PyOgCCo?=
 =?iso-8859-1?Q?Cdm4N+0D5nNhSOdcrmNbFw38Cf2ylCIcs3V4y6YV0pqz6sjykpvayNBuXy?=
 =?iso-8859-1?Q?qqai4WEC1VXotur0NQz+ilLoHNGxvogbqNfbOWGkitmnUciM33+6R+vw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb07deb-d505-40e9-0ff5-08dbfc04fab3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 17:57:32.1161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqZrbuaTfkbGOuk7isQYVFIEdz9Lajct2Go4ejKqKYgIIpfcl7pIYRppOMFbjyXKyE9cUEpHudf5K7Y8fDR0vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 13, 2023 at 06:36:58PM +0100, Thomas Hellström wrote:
> 
> On 12/13/23 15:13, Souza, Jose wrote:
> > On Tue, 2023-12-12 at 20:35 -0800, Matthew Brost wrote:
> > > Remove concept of async vs sync VM bind queues, rather make async vs
> > > sync a per IOCTL choice. Since this is per IOCTL, it makes sense to have
> > > a singular flag IOCTL rather than per VM bind op flag too. Add
> > > DRM_XE_SYNCS_FLAG_WAIT_FOR_OP which is an input sync flag to support
> > > this. Support this new flag for both the VM bind IOCTL only with a path
> > > to support this for execs too.
> > > 
> > > v2: Add cookie, move sync wait outside of any locks.
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_exec.c             |  12 ++-
> > >   drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +-
> > >   drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 -
> > >   drivers/gpu/drm/xe/xe_vm.c               | 116 +++++++++++------------
> > >   drivers/gpu/drm/xe/xe_vm_types.h         |  13 ++-
> > >   include/uapi/drm/xe_drm.h                |  64 ++++++++-----
> > >   6 files changed, 109 insertions(+), 105 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > index ba92e5619da3..8a1530dab65f 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -104,7 +104,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	struct xe_device *xe = to_xe_device(dev);
> > >   	struct xe_file *xef = to_xe_file(file);
> > >   	struct drm_xe_exec *args = data;
> > > -	struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args->syncs);
> > > +	struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args->syncs.syncs);
> > >   	u64 __user *addresses_user = u64_to_user_ptr(args->address);
> > >   	struct xe_exec_queue *q;
> > >   	struct xe_sync_entry *syncs = NULL;
> > > @@ -120,7 +120,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	int err = 0;
> > >   	if (XE_IOCTL_DBG(xe, args->extensions) ||
> > > -	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
> > > +	    XE_IOCTL_DBG(xe, args->pad || args->pad2[0] || args->pad2[1] || args->pad2[2]) ||
> > > +	    XE_IOCTL_DBG(xe, args->syncs.flags) ||
> > > +	    XE_IOCTL_DBG(xe, args->syncs.cookie) ||
> > >   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > >   		return -EINVAL;
> > > @@ -140,8 +142,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   		goto err_exec_queue;
> > >   	}
> > > -	if (args->num_syncs) {
> > > -		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
> > > +	if (args->syncs.num_syncs) {
> > > +		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs), GFP_KERNEL);
> > >   		if (!syncs) {
> > >   			err = -ENOMEM;
> > >   			goto err_exec_queue;
> > > @@ -150,7 +152,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	vm = q->vm;
> > > -	for (i = 0; i < args->num_syncs; i++) {
> > > +	for (i = 0; i < args->syncs.num_syncs; i++) {
> > >   		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
> > >   					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
> > >   					  (xe_vm_in_lr_mode(vm) ?
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index eeb9605dd45f..a25d67971fdd 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -625,10 +625,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > >   	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
> > >   		return -EINVAL;
> > > -	if (eci[0].engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC) {
> > > -		bool sync = eci[0].engine_class ==
> > > -			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC;
> > > -
> > > +	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
> > >   		for_each_gt(gt, xe, id) {
> > >   			struct xe_exec_queue *new;
> > > @@ -654,8 +651,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > >   						   args->width, hwe,
> > >   						   EXEC_QUEUE_FLAG_PERSISTENT |
> > >   						   EXEC_QUEUE_FLAG_VM |
> > > -						   (sync ? 0 :
> > > -						    EXEC_QUEUE_FLAG_VM_ASYNC) |
> > >   						   (id ?
> > >   						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
> > >   						    0));
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index c7aefa1c8c31..0f7f6cded4a3 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -84,8 +84,6 @@ struct xe_exec_queue {
> > >   #define EXEC_QUEUE_FLAG_VM			BIT(4)
> > >   /* child of VM queue for multi-tile VM jobs */
> > >   #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
> > > -/* VM jobs for this queue are asynchronous */
> > > -#define EXEC_QUEUE_FLAG_VM_ASYNC		BIT(6)
> > >   	/**
> > >   	 * @flags: flags for this exec queue, should statically setup aside from ban
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 2f3df9ee67c9..ab38685d2daf 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1343,9 +1343,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > >   			struct xe_gt *gt = tile->primary_gt;
> > >   			struct xe_vm *migrate_vm;
> > >   			struct xe_exec_queue *q;
> > > -			u32 create_flags = EXEC_QUEUE_FLAG_VM |
> > > -				((flags & XE_VM_FLAG_ASYNC_DEFAULT) ?
> > > -				EXEC_QUEUE_FLAG_VM_ASYNC : 0);
> > > +			u32 create_flags = EXEC_QUEUE_FLAG_VM;
> > >   			if (!vm->pt_root[id])
> > >   				continue;
> > > @@ -1712,12 +1710,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> > >   	return ERR_PTR(err);
> > >   }
> > > -static bool xe_vm_sync_mode(struct xe_vm *vm, struct xe_exec_queue *q)
> > > -{
> > > -	return q ? !(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC) :
> > > -		!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
> > > -}
> > > -
> > >   static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > >   			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > >   			u32 num_syncs, bool immediate, bool first_op,
> > > @@ -1747,8 +1739,6 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > >   	if (last_op)
> > >   		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > > -	if (last_op && xe_vm_sync_mode(vm, q))
> > > -		dma_fence_wait(fence, true);
> > >   	dma_fence_put(fence);
> > >   	return 0;
> > > @@ -1791,8 +1781,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > >   	xe_vma_destroy(vma, fence);
> > >   	if (last_op)
> > >   		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > > -	if (last_op && xe_vm_sync_mode(vm, q))
> > > -		dma_fence_wait(fence, true);
> > >   	dma_fence_put(fence);
> > >   	return 0;
> > > @@ -1800,7 +1788,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > >   #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> > >   				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
> > > -				    DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
> > >   				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > >   int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > > @@ -1854,8 +1841,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > >   		flags |= XE_VM_FLAG_SCRATCH_PAGE;
> > >   	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
> > >   		flags |= XE_VM_FLAG_LR_MODE;
> > > -	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
> > > -		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
> > >   	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > >   		flags |= XE_VM_FLAG_FAULT_MODE;
> > > @@ -2263,8 +2248,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> > >   static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> > >   				   struct drm_gpuva_ops *ops,
> > >   				   struct xe_sync_entry *syncs, u32 num_syncs,
> > > -				   struct list_head *ops_list, bool last,
> > > -				   bool async)
> > > +				   struct list_head *ops_list, bool last)
> > >   {
> > >   	struct xe_vma_op *last_op = NULL;
> > >   	struct drm_gpuva_op *__op;
> > > @@ -2696,16 +2680,16 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > >   #ifdef TEST_VM_ASYNC_OPS_ERROR
> > >   #define SUPPORTED_FLAGS	\
> > > -	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_ASYNC | \
> > > -	 DRM_XE_VM_BIND_FLAG_READONLY | DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> > > -	 DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> > > +	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
> > > +	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> > >   #else
> > >   #define SUPPORTED_FLAGS	\
> > > -	(DRM_XE_VM_BIND_FLAG_ASYNC | DRM_XE_VM_BIND_FLAG_READONLY | \
> > > +	(DRM_XE_VM_BIND_FLAG_READONLY | \
> > >   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
> > >   	 0xffff)
> > >   #endif
> > >   #define XE_64K_PAGE_MASK 0xffffull
> > > +#define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> > >   #define MAX_BINDS	512	/* FIXME: Picking random upper limit */
> > > @@ -2717,7 +2701,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > >   	int err;
> > >   	int i;
> > > -	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > > +	if (XE_IOCTL_DBG(xe, args->pad) ||
> > >   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > >   		return -EINVAL;
> > > @@ -2745,6 +2729,14 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > >   		*bind_ops = &args->bind;
> > >   	}
> > > +	*async = !(args->syncs.flags & DRM_XE_SYNCS_FLAG_WAIT_FOR_OP);
> > > +
> > > +	if (XE_IOCTL_DBG(xe, args->syncs.flags & ~ALL_DRM_XE_SYNCS_FLAGS) ||
> > > +	    XE_IOCTL_DBG(xe, !*async && args->syncs.num_syncs)) {
> > > +		err = -EINVAL;
> > > +		goto free_bind_ops;
> > > +	}
> > > +
> > >   	for (i = 0; i < args->num_binds; ++i) {
> > >   		u64 range = (*bind_ops)[i].range;
> > >   		u64 addr = (*bind_ops)[i].addr;
> > > @@ -2775,18 +2767,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > >   			goto free_bind_ops;
> > >   		}
> > > -		if (i == 0) {
> > > -			*async = !!(flags & DRM_XE_VM_BIND_FLAG_ASYNC);
> > > -			if (XE_IOCTL_DBG(xe, !*async && args->num_syncs)) {
> > > -				err = -EINVAL;
> > > -				goto free_bind_ops;
> > > -			}
> > > -		} else if (XE_IOCTL_DBG(xe, *async !=
> > > -					!!(flags & DRM_XE_VM_BIND_FLAG_ASYNC))) {
> > > -			err = -EINVAL;
> > > -			goto free_bind_ops;
> > > -		}
> > > -
> > >   		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
> > >   		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
> > >   		    XE_IOCTL_DBG(xe, obj && is_null) ||
> > > @@ -2854,12 +2834,25 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
> > >   	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
> > >   				     fence);
> > > +	dma_fence_put(fence);
> > > -	if (xe_vm_sync_mode(vm, q)) {
> > > -		long timeout = dma_fence_wait(fence, true);
> > > +	return err;
> > > +}
> > > -		if (timeout < 0)
> > > -			err = -EINTR;
> > > +static int vm_bind_ioctl_sync_wait(struct xe_vm *vm,
> > > +				   struct dma_fence *fence,
> > > +				   u64 __user *cookie)
> > > +{
> > > +	long timeout;
> > > +	int err = 0;
> > > +
> > > +	timeout = dma_fence_wait(fence, true);
> > > +	if (timeout < 0) {
> > > +		u64 value = 1;
> > > +
> > > +		err = -ERESTARTSYS;
> > > +		if (copy_to_user(cookie, &value, sizeof(value)))
> > > +			err = -EFAULT;
> > >   	}
> > >   	dma_fence_put(fence);
> > > @@ -2875,6 +2868,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	struct drm_xe_sync __user *syncs_user;
> > >   	struct xe_bo **bos = NULL;
> > >   	struct drm_gpuva_ops **ops = NULL;
> > > +	struct dma_fence *fence = NULL;
> > >   	struct xe_vm *vm;
> > >   	struct xe_exec_queue *q = NULL;
> > >   	u32 num_syncs;
> > > @@ -2889,7 +2883,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	if (err)
> > >   		return err;
> > > -	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > > +	if (XE_IOCTL_DBG(xe, args->pad) ||
> > >   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > >   		return -EINVAL;
> > > @@ -2904,12 +2898,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   			err = -EINVAL;
> > >   			goto put_exec_queue;
> > >   		}
> > > -
> > > -		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > > -				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
> > > -			err = -EINVAL;
> > > -			goto put_exec_queue;
> > > -		}
> > >   	}
> > >   	vm = xe_vm_lookup(xef, args->vm_id);
> > > @@ -2918,14 +2906,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   		goto put_exec_queue;
> > >   	}
> > > -	if (!args->exec_queue_id) {
> > > -		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > > -				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
> > > -			err = -EINVAL;
> > > -			goto put_vm;
> > > -		}
> > > -	}
> > > -
> > >   	err = down_write_killable(&vm->lock);
> > >   	if (err)
> > >   		goto put_vm;
> > > @@ -3015,16 +2995,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   		}
> > >   	}
> > > -	if (args->num_syncs) {
> > > -		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
> > > +	if (args->syncs.num_syncs) {
> > > +		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs), GFP_KERNEL);
> > >   		if (!syncs) {
> > >   			err = -ENOMEM;
> > >   			goto put_obj;
> > >   		}
> > >   	}
> > > -	syncs_user = u64_to_user_ptr(args->syncs);
> > > -	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
> > > +	syncs_user = u64_to_user_ptr(args->syncs.syncs);
> > > +	for (num_syncs = 0; num_syncs < args->syncs.num_syncs; num_syncs++) {
> > >   		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
> > >   					  &syncs_user[num_syncs],
> > >   					  (xe_vm_in_lr_mode(vm) ?
> > > @@ -3060,8 +3040,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
> > >   					      &ops_list,
> > > -					      i == args->num_binds - 1,
> > > -					      async);
> > > +					      i == args->num_binds - 1);
> > >   		if (err)
> > >   			goto unwind_ops;
> > >   	}
> > > @@ -3077,7 +3056,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   		xe_exec_queue_get(q);
> > >   	err = vm_bind_ioctl_ops_execute(vm, &ops_list);
> > > -
> > > +	if (!err && !async) {
> > > +		fence = xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
> > > +		dma_fence_get(fence);
> > > +	}
> > >   	up_write(&vm->lock);
> > >   	if (q)
> > > @@ -3092,13 +3074,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   	if (args->num_binds > 1)
> > >   		kfree(bind_ops);
> > > -	return err;
> > > +	return fence ? vm_bind_ioctl_sync_wait(vm, fence, u64_to_user_ptr(args->syncs.cookie)) :
> > > +		err;
> > >   unwind_ops:
> > >   	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > >   free_syncs:
> > > -	if (err == -ENODATA)
> > > +	if (err == -ENODATA) {
> > >   		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
> > > +		if (!async) {
> > > +			fence = xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
> > > +			dma_fence_get(fence);
> > > +		}
> > > +	}
> > >   	while (num_syncs--)
> > >   		xe_sync_entry_cleanup(&syncs[num_syncs]);
> > > @@ -3108,6 +3096,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >   		xe_bo_put(bos[i]);
> > >   release_vm_lock:
> > >   	up_write(&vm->lock);
> > > +	if (fence)
> > > +		err = vm_bind_ioctl_sync_wait(vm, fence, u64_to_user_ptr(args->syncs.cookie));
> > >   put_vm:
> > >   	xe_vm_put(vm);
> > >   put_exec_queue:
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 2e023596cb15..63e8a50b88e9 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -138,13 +138,12 @@ struct xe_vm {
> > >   	 */
> > >   #define XE_VM_FLAG_64K			BIT(0)
> > >   #define XE_VM_FLAG_LR_MODE		BIT(1)
> > > -#define XE_VM_FLAG_ASYNC_DEFAULT	BIT(2)
> > > -#define XE_VM_FLAG_MIGRATION		BIT(3)
> > > -#define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
> > > -#define XE_VM_FLAG_FAULT_MODE		BIT(5)
> > > -#define XE_VM_FLAG_BANNED		BIT(6)
> > > -#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(8, 7), flags)
> > > -#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(8, 7), (tile)->id)
> > > +#define XE_VM_FLAG_MIGRATION		BIT(2)
> > > +#define XE_VM_FLAG_SCRATCH_PAGE		BIT(3)
> > > +#define XE_VM_FLAG_FAULT_MODE		BIT(4)
> > > +#define XE_VM_FLAG_BANNED		BIT(5)
> > > +#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
> > > +#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
> > >   	unsigned long flags;
> > >   	/** @composite_fence_ctx: context composite fence */
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 0895e4d2a981..d72e4441cc80 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -140,8 +140,7 @@ struct drm_xe_engine_class_instance {
> > >   	 * Kernel only classes (not actual hardware engine class). Used for
> > >   	 * creating ordered queues of VM bind operations.
> > >   	 */
> > > -#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
> > > -#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
> > > +#define DRM_XE_ENGINE_CLASS_VM_BIND		5
> > >   	/** @engine_class: engine class id */
> > >   	__u16 engine_class;
> > >   	/** @engine_instance: engine instance id */
> > > @@ -661,7 +660,6 @@ struct drm_xe_vm_create {
> > >   	 * still enable recoverable pagefaults if supported by the device.
> > >   	 */
> > >   #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
> > > -#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
> > >   	/*
> > >   	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
> > >   	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
> > > @@ -669,7 +667,7 @@ struct drm_xe_vm_create {
> > >   	 * The xe driver internally uses recoverable pagefaults to implement
> > >   	 * this.
> > >   	 */
> > > -#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
> > > +#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> > >   	/** @flags: Flags */
> > >   	__u32 flags;
> > > @@ -777,12 +775,11 @@ struct drm_xe_vm_bind_op {
> > >   	__u32 op;
> > >   #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> > > -#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
> > >   	/*
> > >   	 * Valid on a faulting VM only, do the MAP operation immediately rather
> > >   	 * than deferring the MAP to the page fault handler.
> > >   	 */
> > > -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
> > > +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> > >   	/*
> > >   	 * When the NULL flag is set, the page tables are setup with a special
> > >   	 * bit which indicates writes are dropped and all reads return zero.  In
> > > @@ -790,7 +787,7 @@ struct drm_xe_vm_bind_op {
> > >   	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
> > >   	 * intended to implement VK sparse bindings.
> > >   	 */
> > > -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
> > > +#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> > >   	/** @flags: Bind flags */
> > >   	__u32 flags;
> > > @@ -808,6 +805,35 @@ struct drm_xe_vm_bind_op {
> > >   	__u64 reserved[3];
> > >   };
> > > +/**
> > > + * struct drm_xe_syncs - In / out syncs for IOCTLs.
> > > + */
> > > +struct drm_xe_syncs {
> > > +	/** @num_syncs: amount of syncs to wait on */
> > > +	__u32 num_syncs;
> > > +
> > > +	/*
> > > +	 * Block in IOCTL until operation complete, num_syncs MBZ if set.
> > > +	 */
> > > +#define DRM_XE_SYNCS_FLAG_WAIT_FOR_OP (1 << 0)
> > > +	/** @flags: Sync flags */
> > > +	__u32 flags;
> > > +
> > > +	/**
> > > +	 * @cookie: pointer which is written with an non-zero value if IOCTL
> > > +	 * operation has been committed but the wait for completion
> > > +	 * (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP is set) is interrupted. Value only
> > > +	 * valid when IOCTL returns -EINTR or -ERESTARTSYS.
> > > +	 */
> > > +	__u64 cookie;
> > what is the usage of cookie?
> > from what I looked the xe_vm_bind_ioctl() will return -1 and errno will be set to -ERESTARTSYS in the case mentioned in the comment.
> > 
> > if really needed would be nice if you could provide a example of how it should be used.
> 
> It's opaque to user-space, except for clearing before first command
> submission.
> 
> If the wait for operation complete hits a signal, then the IOCTL writes a 1
> to "cooke" and is then restarted either by the kernel itself or by
> user-space (Unless it was a CTRL-C) The KMD then reads the value of cookie.
> If it sees that it is 1, it skips performing the bind again, and goes
> directly to the wait part...
> 

Ok, I missed this part that the KMD has responsible for checking the
cookie value. I thought it was up to the UMD to check the cookie on
restart and either issue the op again (num_binds != 0) or wait for
existing operations to be complete (num_binds == 0). 

Easy enough to fix this.

> This is not very nice IMO, but is the price we pay for interruptible waits
> after the BIND has been commited. IMO it's better that user-space, at least
> in production code, implements sync binds using async binds with a follow-up
> wait for an out-(user) fence.
> 

I think the argument is 3 IOCTLs (create sync, bind IOCTL, wait) vs. 1
(bind IOCTL).

> > 
> > > +
> > > +	/** @syncs: pointer to struct drm_xe_sync array */
> > > +	__u64 syncs;
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > >   struct drm_xe_vm_bind {
> > >   	/** @extensions: Pointer to the first extension struct, if any */
> > >   	__u64 extensions;
> > > @@ -839,14 +865,8 @@ struct drm_xe_vm_bind {
> > >   		__u64 vector_of_binds;
> > >   	};
> > > -	/** @pad: MBZ */
> > > -	__u32 pad2;
> > > -
> > > -	/** @num_syncs: amount of syncs to wait on */
> > > -	__u32 num_syncs;
> > > -
> > > -	/** @syncs: pointer to struct drm_xe_sync array */
> > > -	__u64 syncs;
> > > +	/** @syncs: syncs for bind */
> > > +	struct drm_xe_syncs syncs;
> > >   	/** @reserved: Reserved */
> > >   	__u64 reserved[2];
> > > @@ -975,14 +995,14 @@ struct drm_xe_exec {
> > >   	/** @extensions: Pointer to the first extension struct, if any */
> > >   	__u64 extensions;
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > >   	/** @exec_queue_id: Exec queue ID for the batch buffer */
> > >   	__u32 exec_queue_id;
> > > -	/** @num_syncs: Amount of struct drm_xe_sync in array. */
> > > -	__u32 num_syncs;
> > > -
> > > -	/** @syncs: Pointer to struct drm_xe_sync array. */
> > > -	__u64 syncs;
> > > +	/** @syncs: syncs for exec */
> > > +	struct drm_xe_syncs syncs;
> > DRM_XE_SYNCS_FLAG_WAIT_FOR_OP is not implemented for DRM_IOCTL_XE_EXEC.
> 
> That is intentional. The scheme above is awkward and IMO we shouldn't
> implement it for EXEC unless there is a specific need, that cannot be solved
> with waiting for an out-fence.
> 

Yep intentionally implemented but bits are there to implemented if
needed. Implementation is trivial too.

Matt

> /Thomas
> 
> 
> > 
> > >   	/**
> > >   	 * @address: address of batch buffer if num_batch_buffer == 1 or an
> > > @@ -996,8 +1016,8 @@ struct drm_xe_exec {
> > >   	 */
> > >   	__u16 num_batch_buffer;
> > > -	/** @pad: MBZ */
> > > -	__u16 pad[3];
> > > +	/** @pad2: MBZ */
> > > +	__u16 pad2[3];
> > >   	/** @reserved: Reserved */
> > >   	__u64 reserved[2];
