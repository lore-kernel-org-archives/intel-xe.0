Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65B7CD98EE
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 06:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30BF10E93F;
	Wed, 17 Jun 2026 06:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mY9oMiR3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD9810E932
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 06:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781676712; x=1813212712;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L6nLdhTaNV86/iridHl+hHvTyORN6eX3rz8hi0epbKw=;
 b=mY9oMiR3aa5hBff5EBktpTQ0T1M54GQNJUqP1ug/lkB8iC1Ou+yyTpmq
 lRNhCdDZcuszJWwrhS37wxuNiMCxGPA4U0BGO8ZzNwWMqglKkkGrdLA2N
 /GOLsFR2nTts8TPyoP1ZRzf6R7oEuyazTUa6QQ3ezBI9cXegfneaulDFI
 uOPWU8+Rx20hO/hSTuyXQ6/sop9ZreGkfMH8r/rPOxVkTKr9JCwH/vYyg
 Jh+gzBhHAr3IOYY8DBowBwxgcVngFQJkmi3nbyZRs9RfUOWK0p3GwKhat
 SGBKs2ILuCeC/l5y2gy2JfJp65suO0A61Cpkvu7STFe6dsifUKq/E+8w5 Q==;
X-CSE-ConnectionGUID: DZccsS7LTxa3zgXyuW15IA==
X-CSE-MsgGUID: /+5dSVRXQ9maEhUNP90uCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="92815119"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="92815119"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 23:11:48 -0700
X-CSE-ConnectionGUID: ahT5JsQER8K46duWwbLoog==
X-CSE-MsgGUID: rCc9cLDpR3ekZ2BZCbn7+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="286089400"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 23:11:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 23:11:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 23:11:46 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 23:11:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mt79rO7T7FSHwZaxVu/L3hTq9tVxrMglSuFIlh7IcyU4Ng6Xj1q9VfiB7aso+jc/N8E+ncRmkkpMVfads7CRRjbC9FTup+iRqTydnFWpKeDJTiAeV+JlNL1ckDt1VhPpMebhIuXlr4XIRxp/iEzutUjWHzAAYgVrzik32aCY6WcXVH6tLvwPVermEjv8EEn72zkuDoElkgPx0tCbUYCqaCZtToHgmfMTv6XFhwWR3SqvTsoj0Vm/qxaUjhS/XkNoGEuShyDwZvHUZnZGk8+MbYH5MkFseETpz1PX5ITbJ3qoHeiovE3K0SS5o9TxYXymh5s30qmiohzfaDF2rmQV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soUszJuqIdsOVeSkvEsBA2+BxUSq6KTp0kl2mzOesGk=;
 b=ln4x9OO2gNpxuP+GD0SNC5Ge9qSwLNVBuT6wBIFUYPQdeG79SI33tsWbC2sNor2UeP9k6o+3t/WkbWg1ROuxVsn2ToUFa2Md5HIGjHIp2leLKUsu6EaU96jELXcYJ22xWKVoVNo+cXRh6alo5xq4FYP9YYVXN+qScfMedRg0/1nqiL4PlOb4CDdhb8Y1DgL5aznWSnVUNaJAMFCWNMHQl0NkvmtOTCn2mZC39X0nbL1MPKsDtRXAOdl0RK63uRwOLvLUQy3O6F1hm1QdJtJvIjsPXHlkn6ZOLLt4EDy7CqlkSpKU1dickbSM9EeWIMKjXdlInI+9TLUJMrEXqgewmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL4PR11MB8824.namprd11.prod.outlook.com (2603:10b6:208:5a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:11:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 06:11:43 +0000
Date: Tue, 16 Jun 2026 23:11:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <daniele.ceraolospurio@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v8 08/10] drm/xe: Improve wedged state management
Message-ID: <ajI6m+I7YmGfZVnX@gsse-cloud1.jf.intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-9-raag.jadav@intel.com>
 <aiAIcAihJhDwOj5e@intel.com>
 <9da04b52-c43e-4afd-9d1b-8248034f58ab@intel.com>
 <aiE52oh3F-5OOqLh@black.igk.intel.com>
 <578dc1ba-88d6-4ef1-9912-d58f49fcced2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <578dc1ba-88d6-4ef1-9912-d58f49fcced2@intel.com>
X-ClientProxiedBy: MW4P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL4PR11MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 7422f120-d7cd-4583-15d3-08decc374d7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cPlDR9aGTmGkTRIknzcQ8EiH57VA0CU6XPdumVYwJSQG0agAhYcT1Q/yyTRs6cTLuw47P4lsmP2SeLb+Zr3HfsW5jP9DAn01VK9L6jbeZYMM5Tzim8c6JfP/EcN5LjtJJkTvy2KmMnN7YVA0EviVk+ns0jmeHb7MLensPo3sbkhf0cTTZrZBFRysYkP8Z15gFOuZUmO3bRj3OCRBb37uinvvarWwGyVzsqtHPZ8oAMyPcUUGHzRFS8Mtu1O+eJEHbMszL+27pGj1c/F8NccNrLU4NmP6SbTICLT2Olw3NuFw2B+DnwhzFPd1U21e84r1gMm/41aOD0S01/7f6/QWb87rBl37Qr+Um3/NC6yg9XT6cRpDIP5OPSTyz6moyPN+HdvSeqQvOBVNzDNHoJlTnKI7dgcMdeUHs5WS/+o7uqtR8uLQ4UnWzzcLh6VisefWYIgD66IxfbUIgZyGI7sXdyAnAYwjP2kS256V8rO2v3xNLRZBwMk9Z/LARiPxOjCmoWHoL/tg+5zaJ3VpUyPh1NAgotfuw+ysZHlGeWFFv2Fw/H8VBKwhjzL3JImDRxIZpyz5TRIRn2InZzZ9fAn5fdc0sXxUJGisTgwSUoAyuYVpjO0d5nuRAjrV62gW1Mp6Q7jzhOIPB+Dd7b5OlTX3h4ziZoSjNKIp1+ibKUtgPLSvHPpiBhyIrSGY6QtsPY2e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZxJW+yBl4XlD0G0s0+YxlVH2FGhVftU3ha6O5YoZ2KuP2DpdOT79is2dq+Pn?=
 =?us-ascii?Q?Z/jyJ//EQOICWkYr2FUfOjJpOANXwwP+CfryuQZNGIDwTMGjY+4LkeCqSP5w?=
 =?us-ascii?Q?G+Sf91qYWNn+4flkUb/roajybB7Bb4TwIx0UggpnhtKgEeBnFhgM8Rv9cKQJ?=
 =?us-ascii?Q?+SWnwzdmPGJbJeKFqN7OpLyDqoNkC23IeZZR3lp1niqhx5V5LSUmVvNc8jbZ?=
 =?us-ascii?Q?LIrnfJkxvk2DSXvKTx0QZOvExg/Id63DAIJ0duu4y3/X3KBkeMHSC/kebfqR?=
 =?us-ascii?Q?9KfE4nnjSrTdYBW1O5fwXUzY0gJh/DbyWXDxWpLLRU030JLVbnRmIO3YoQdz?=
 =?us-ascii?Q?lFzR7bHSxx3CJJA2KJQON+DD+qICRH7cjNnnu5Cz9sVwrfF+Zc4qC2ZcObNJ?=
 =?us-ascii?Q?S4bx70FhivU+tvLcTIaursdjkOiBMFqTZzxe7IkuALyZA8mxnrSLu3oX8f6z?=
 =?us-ascii?Q?eQrwp4bqMzLXbpa79l/9/Ds8r7TgwP3uErnTzuWA8ra0iXDKk2yZ+ENtKyQ2?=
 =?us-ascii?Q?3ffdPDRgxJaT7RIcNDmjIey3UXFJvubG44qM2a1G2w+l3f9biUDaJ1NhK9sg?=
 =?us-ascii?Q?0fc3U0L7kKbpg2xCyY0aNdOEieebXL5hGavXN2qx59pkXaVjD1bS34i2nkWy?=
 =?us-ascii?Q?++1qdMxD9mdPcf30JW2kbj5TN45LhrqIJmJEFoUhxNJSo39jo5f4jzWkUGka?=
 =?us-ascii?Q?KaSH4f3zWuoU1fC2I0dXEXDhM1u8FhNYANGPLJs+wTogj7Petf2cYhP7ToP7?=
 =?us-ascii?Q?fa5pvTXcCudNK24GBcnlFbP49V0hxaHvjti8CsD+k7sh9nsHS4jN8PbiWycH?=
 =?us-ascii?Q?Awa3lrZ7kHDQ68eIJQ89RR1vMjix46YEiMcEBDB3Q6J0hdJEes29UommRbdc?=
 =?us-ascii?Q?wuB+SeH0TPK0T1xOAK9PHcQXlFrvZLmJ8+lv0SLytQHtsymQfYYBfL2JQdD4?=
 =?us-ascii?Q?vwC+MXd4rIrl7wdQlEtQR1Aj/1yTnqwFvPCvYE5B30aczHyCYMIs50OfLyDs?=
 =?us-ascii?Q?G118ynkX0L8Os6voWykU+VGackUcLwUUz3NrqnMhx7ZedtE2zMVOdxysCbH6?=
 =?us-ascii?Q?C9POFjJmk3371NOLuEfKcbcjrOwycQw12LkwMeC+oAZeaYPOXhZcmUSRd4bO?=
 =?us-ascii?Q?Rysxb4VyxO/JHS5GnGdd3vVBFd9SLuX8dV7oTHoVBd4ZIvrnTF6hDuAyaPeP?=
 =?us-ascii?Q?XyJDFK4Hzml8dAzsdnJwT5aHx80DypQzyr5iPNqhKi+RHqAnQ7ibJtGM8NFJ?=
 =?us-ascii?Q?vgBUNVgDKzpw+efq51yNnkBgeUaarn3NJC4s3s4Z4vOVsJiaO7GXEQ5cb3Zi?=
 =?us-ascii?Q?XxtTKuDvPin6dgRAzw4x+hyb8vU8cLVBioVWHCSxoJRpOBkyzWm7cdU88/ht?=
 =?us-ascii?Q?pjbMXrWCXjbgR6z7VL4r3rB9aOk1qqBKCtLbg+KtxjkPS53+bQb0AIV0b+bY?=
 =?us-ascii?Q?xh5x9JY5rZURGo413xcuS7o+yPO+WEKWKO+UGErpSICZUwN+aqe9WbMoeKxh?=
 =?us-ascii?Q?3l5ZG7TFqXT6xSlXgxllV3h1mY0euzZTzFYNtQ1/+TLyCLfkjk44rgnAULHT?=
 =?us-ascii?Q?CBFlEpAIZgUwWIEknplY07MAz6LuOwlf0olWecDzLCBf4eaRA5P6KFvMgDY7?=
 =?us-ascii?Q?BHz5ynrCYARdlwGy9TG3dh3guYOy/hLv1ubNhUTfi+s3HuRoa0j3eZAdeAQr?=
 =?us-ascii?Q?+r2MJL9bJx16sRrFGoIabi+pUaeFIsQSnwXHCTwB82kApOITm+Q63Bi1Wp1+?=
 =?us-ascii?Q?wy5AISdhsEb+8+3Q5BVtH96hcn9+B3I=3D?=
X-Exchange-RoutingPolicyChecked: GNCK/5RmetLiUdwO8NHG1NX/VwDAljaufnl4upIknkeIAGLWKbetP767S1cOhld490bzo7lqvBOw/n+lCj+usW52irtNnfXf4ag0735Lg5bzhEdLJMWtmU5t6aoEDO2Z1onZx62/nCtxyP+iVS9RIoz3PPP3L+j8QyxkOKmbvmwKoGVE0n+6VL7dQDdQ1HcxDMUTSGaPVWLHCvclxnCzLImqsWZOIxY8aMLEgRWWjZfITS3dY/xzFgAAUiIZuFwVUDTLQOrstdj0wS1suLFZNB6eUecYQam6BFMFhrL/sPSQFblNrFqW/HqJPGSpL536v4OeHovqr2vgZsFjq/l32w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7422f120-d7cd-4583-15d3-08decc374d7b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 06:11:43.0718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+YwjbW82N/bnnCOymjCpM/6dXHCVOo71zQ8tvxjvDmoe0ILS7V2npdy8DWwYw/v4/ulljTmskq26tWFQcwhVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8824
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

On Wed, Jun 17, 2026 at 11:28:45AM +0530, Tauro, Riana wrote:
> 
> On 04-06-2026 14:09, Raag Jadav wrote:
> > On Thu, Jun 04, 2026 at 12:22:35PM +0530, Tauro, Riana wrote:
> > > On 6/3/2026 4:26 PM, Rodrigo Vivi wrote:
> > > > On Wed, Jun 03, 2026 at 03:47:08PM +0530, Raag Jadav wrote:
> > > > > Currently, wedged state is serving a single usecase where the device is
> > > > > declared wedged, but this doesn't allow any wedged state management for
> > > > > runtime usecases. In preparation of usecases which requires to facilitate
> > > > > temporary device wedging, convert wedged.flag to wedged.ref which serves
> > > > > as a driver internal refcount and blocks critical path execution during
> > > > > device lifetime and while at it, introduce wedged.fini and use it as a
> > > > > cleanup indicator during driver unwind which operates independent of the
> > > > > refcount.
> > > > > 
> > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_device.c       |  5 +++--
> > > > >    drivers/gpu/drm/xe/xe_device.h       | 12 +++++++++++-
> > > > >    drivers/gpu/drm/xe/xe_device_types.h |  6 ++++--
> > > > >    3 files changed, 18 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > > index 9e0cbad8adb0..d77f8f054a1a 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > @@ -917,7 +917,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
> > > > >    {
> > > > >    	struct xe_device *xe = arg;
> > > > > -	if (atomic_read(&xe->wedged.flag))
> > > > > +	if (atomic_read(&xe->wedged.fini))
> > > > >    		xe_pm_runtime_put(xe);
> > > > >    }
> > > > > @@ -1413,7 +1413,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > > > >    		return;
> > > > >    	}
> > > > > -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> > > > > +	if (!atomic_xchg(&xe->wedged.fini, 1)) {
> > > Just curious. Why do we need runtime pm reference held throughout till the
> > > end of driver unload?
> > > Even if this is needed why not associate releasing runtime pm wakeref with
> > > the flr_on_fini flag.
> > I guess flr_on_fini has multiple setters and it's not always clear how many.
> > 
> > > I was facing a similar issue for uncorrectable series and i was thinking of
> > > releasing runtime
> > > pm wakeref based on flr_fini.
> > Sure but I'm not touching any existing behaviour in this series. Probably
> > worth exploring as a follow up.
> > 
> > Raag
> > 
> > > > > +		xe_device_wedged_get(xe);
> > > > >    		xe->needs_flr_on_fini = true;
> > > > >    		xe_pm_runtime_get_noresume(xe);
> > > > >    		drm_err(&xe->drm,
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > > > index d61fdb362f91..14677729aa24 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > > @@ -194,9 +194,19 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
> > > > >    void xe_device_td_flush(struct xe_device *xe);
> > > > >    void xe_device_l2_flush(struct xe_device *xe);
> > > > > +static inline void xe_device_wedged_get(struct xe_device *xe)
> > > > > +{
> > > > > +	atomic_inc(&xe->wedged.ref);
> > > > > +}
> > > > > +
> > > > > +static inline void xe_device_wedged_put(struct xe_device *xe)
> > > > > +{
> > > > > +	atomic_dec(&xe->wedged.ref);
> 
> Can you please add a WARN_ON here if reference underflows.
> Since this is already reviewed can this patch be sent separately?

Squash this in unless merged.

> 

So probably...

int orig;

orig = atomic_fetch_add(-1, &xe->wedged.ref);
xe_assert(xe, !(orig <= 0));

To prefer Xe asserts.

Matt

> Thank you
> Riana
> 
> > > > > +}
> > > > > +
> > > > >    static inline bool xe_device_wedged(struct xe_device *xe)
> > > > >    {
> > > > > -	return atomic_read(&xe->wedged.flag);
> > > > > +	return atomic_read(&xe->wedged.ref);
> > > > >    }
> > > > >    void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > index 32dd2ffbc796..66e673e4e3e7 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > @@ -485,8 +485,10 @@ struct xe_device {
> > > > >    	/** @wedged: Struct to control Wedged States and mode */
> > > > >    	struct {
> > > > > -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> > > > > -		atomic_t flag;
> > > > > +		/** @wedged.fini: Needs cleanup on fini */
> > > > > +		atomic_t fini;
> > > > to me it is easier to see this as a 'permanent' flag than
> > > > a flag to 'clean' on 'fini'.
> > > > 
> > > > but up to you...
> > > > 
> > > > either way:
> > > > 
> > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > 
> > > > > +		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
> > > > > +		atomic_t ref;
> > > > >    		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> > > > >    		enum xe_wedged_mode mode;
> > > > >    		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
> > > > > -- 
> > > > > 2.43.0
> > > > > 
