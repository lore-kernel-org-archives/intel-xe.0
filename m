Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4105C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 16:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6388810E6F7;
	Fri, 19 Jul 2024 16:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdrBQdx4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23DF10E6F7
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721406552; x=1752942552;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pcDMDtmjeytedJE/3YFfjCF9tX39HxELogYotoes/WE=;
 b=KdrBQdx4S+eekjtLgzcGgF0Ieo/dQRh6vft8gUdE3rcAmivVLwbkqZC4
 7HTQ730690bg7Zx7n2a5Ybhg4hVbpbT6y8OHr7MbFDlld8pecGQkhXV+t
 7M8gRlIUJIHicDLarNtWAr1PcthIUW6keYfPl3wxregglXn7MYgONjPWH
 tM3pypohuDyy5l5vjuIgkXptdaH7jWikQtaM2kfzzVE8WhpMI1sFLwfIB
 bx3OvLibgQ2mb1bCFWbdBiMwZ4WX9GKnghil+I52bf7opyU/qp4SxdZMk
 Yj6iAyX7q/gKUw5KpPftP86HfMGO8GU2W3N8lfrXbIIPLwQoT1d1Z+kF8 Q==;
X-CSE-ConnectionGUID: GNf3QfPzQQ6Uvkxy2NEpqA==
X-CSE-MsgGUID: JlNdTuwcQg2rPan47fxqOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="12622813"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="12622813"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 09:29:11 -0700
X-CSE-ConnectionGUID: 7vlDCYy/T9yINUEyu389UA==
X-CSE-MsgGUID: PYhoyLzLR8K/Xs/dRoInsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51054346"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 09:29:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 09:29:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 09:29:10 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 09:29:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfmi39+lHdcL0G21S8yqcfHwPcy9zGPXI8K9swVnIDekms+uCnk8ORkDgKEQekwm8cj532v6sjy2yfXQPIb10Vr4KrRM53JlAe7Nsn41wV8K3dJW6ULyPzHxh1yrwkTrvYROfSraeA0X8FLaMcN5FkedEruyvXpOAGjfxq4tkUpdFyvVK9nnshZ/IAnDIQ9UFNCxKjABloF4jANNh9OAfs0m+MXlkei5baWn9cAeKms1eywwaHB5pDod42u5N37xQ4jaLRIAtfwQ4wF39XnHCCpuQpb4keliJT9fki582/XRe6c+INnQITGaslGHri7XQKT7OGP1x0dKXvmjGL2TVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcDMDtmjeytedJE/3YFfjCF9tX39HxELogYotoes/WE=;
 b=Od5ngkyk7wulM8xa8JmDJ4yfBbTdApNMyOMp8KWmZ8yJIyutpNGeaNYFRQ8NH4suxgWA2CV2sUXCZRZaoVJj5VZvj26Hh8WCRsZARJQFRnqp7KcNJNvegmsWggZgJlhlDqt7duLGWhjwT927DAfqqhtxcKuF5Anyj7ou26CIaZAHL1vslchpYhIwi/KUdPcKQ+GhQ6WXdNj3Avi2aAgepK71a9E3f6TbsNlFte7IJDaPDqiSx+GSj7gcQ4ybcSSBEmftJ85QacIjxlkVKKPHPBlSibKUOnyftCknteu8bzKkgwBUxSngE7A2CLbj5TAFlkmvvnP6y9Qwn4wPJjdu/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8581.namprd11.prod.outlook.com (2603:10b6:408:1e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 16:29:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 16:29:07 +0000
Date: Fri, 19 Jul 2024 11:29:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Unlink client during vm close
Message-ID: <qf6jrn4m35pfvbxsec4jzw647m4au7s3hl2546wsmygz376hbm@27ir4foejwoa>
References: <20240718131752.3736689-1-tejas.upadhyay@intel.com>
 <Zpk7jBGDn3Eo9VoM@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62048D1E37A856E52AE40C4381AD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZpoNHwGU6OXxmpqJ@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62040D9AF56895B69161194781AD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62040D9AF56895B69161194781AD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:303:6a::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 81dffd6a-b7b9-4be4-5c50-08dca80fe958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aVx/dQDOOmV0D4x3HsV/LSdQrzIRzFi94wwQU/pwgxQAWFNNUPgJ4I4asUoO?=
 =?us-ascii?Q?fykHjHeCrV8z+i7xCNn0FDUJ76vJXsKpfqD0ooLA0rR8hHAlACzIojJnzX+R?=
 =?us-ascii?Q?4q30wFpZQSSAPPP3a+UHKY9sFj6RAYKJuYOi7RhRlLJe5F4ao/a6ucE5Xsif?=
 =?us-ascii?Q?nxIvmxYb64TkWQke/Ht1IdbNdPabvPSC9MsTu54bqdv1Szk0jJ2VCVIRE033?=
 =?us-ascii?Q?n2qIK17cRxp34CKY9y1MzA/+v6LInMq73yJs0JcQ8DLFIbGgQe1h5QWp+LR6?=
 =?us-ascii?Q?/QD7lpWpTR7S/NODLiefbKkv1tK0A4XcFii/vqRrQnE0lO/FUcvvAcfPKGpP?=
 =?us-ascii?Q?9/XYTW4+GNppMhlY9+h1uSyfTfthRtvpEx8thw3h3iZPKXBEXUI3i9APdq4V?=
 =?us-ascii?Q?UF74BwdQ2QNT3QSUtLzdavgoxkb6uHJvYwnX6xO9BkTJG39pYvWIHnVidADO?=
 =?us-ascii?Q?zYbQItdf0bgKGjbXZufrqNdRrl3yxovpBW8cC61gqCdx3eFFIxJ57cPCZmYQ?=
 =?us-ascii?Q?+o8tGIgYgMKNnCt1onvOnJxJiqhRte7lac28al9hvLNyk67KnyU7OQBOFRC5?=
 =?us-ascii?Q?kaDf2RtOKSCS4sODtI1oKfsB13gttdZjuOnqht+e2kEBB0+leHu7N++Gb6H0?=
 =?us-ascii?Q?Doge2TrpLOUCM/zF0Q86JAfhBcjtgB6cHg66hxLSH7nh1KUYUpYuPg+J+GZd?=
 =?us-ascii?Q?ZouQEYJ1IyA0HcKjKVyFWvyT2Ia179ZJ0ZbPCBeOU7ZDxnZ/LCKKn5Ve1zYd?=
 =?us-ascii?Q?T5UTfVEvkds7cXXYORBwbaXj277cJIMSpxG+z0mdtVMADynqRwHP2pxzb+bg?=
 =?us-ascii?Q?abSDhhBVbycrxCcj9FkOodB1ZHOpfFeF5CRatVCKcSS6Lut5EwFTrKHTv38v?=
 =?us-ascii?Q?yDMmCCy8qCLwan/dLn3sDxBOGyCqQkMv/r8eITPwz9eHwkXcdSEOOHvHHCVl?=
 =?us-ascii?Q?zk5CCNAJG6z99mI9vS1CP/95XpE8cf1iPUhPcCFbgbH1/4kkHpVvdOH/kT0C?=
 =?us-ascii?Q?K04JjqrdTEyky0ASA99uNyX46slO3bapEBCCCqdbfpuoPz9usPDH3MIjoFs/?=
 =?us-ascii?Q?x2OFL9TINiO408BISD7z5tEC7bX3JFPfFZe0+Ao1zkEKAAYT7bulg45wsely?=
 =?us-ascii?Q?kiKTuFyo3WxI1O2JrGfCqSaDGUM/ZFZYD3qSSt7Yq6cP7RDtEpSKQW4cZJlq?=
 =?us-ascii?Q?OB+QHeGzf86g8dPzNaXgnTu2i03t4VPhML6VPmHyasWQIBz583AmOKoDnE/I?=
 =?us-ascii?Q?C5ZG88yti3UsmzrtJUaitKA+UY4idZ3tUK+JpxcG1qzMBiPRGwXOYLrV5i7/?=
 =?us-ascii?Q?9U4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZNnKqQqzY9JQnoYTT/sSfMHAX2J19KZvh1v5NJLSYoDotBCf8p3a4vlI/040?=
 =?us-ascii?Q?lixLmPIm5QVWna17igia1i3DPifKiGSKq8H0icSD6CZdN3pRaD5mWZfDGFBl?=
 =?us-ascii?Q?8Io9HDad/5akOf6eHlVKCiouvjbFBYLimbiS5WFaTKAX9PpGJGAyzvRUOEwL?=
 =?us-ascii?Q?hQavGpeCxR9ZluXo8m9ThiRlQGL6XLXjt02V+F/TihSmSGXXxHWZN5RwsneP?=
 =?us-ascii?Q?eMRteq3feV9QxqH4bFnqmw9BvALRh04QdJrw9pQv+IqCm4v6oAM5fkutXP2I?=
 =?us-ascii?Q?sALurQquSZPEEAzX2/Ijx9jVPjkuh1NMeldv0LDwpobCjWC+xVJOZ0tT2mnj?=
 =?us-ascii?Q?hr8nq5g9vC2INTCmT+hGwfqv6iWSuxcaswzZ9F2M0twV1OpYekG2btgMlNzL?=
 =?us-ascii?Q?UCcDa1GOUVqxwdFM/zpG50fhCl6B+6plmG94cbnfcdO3FbOWTUrV8eaBHeJw?=
 =?us-ascii?Q?/LNm6IMCzJ+H3KHlWYJGln+QQYFNS4HwSHy79jLdlNqx9rWgFkVynbmsHPds?=
 =?us-ascii?Q?IcDgE9YMo+4kcWZugyv6cVPG6QFJqecgXZPvFv5ixh81o/TwcP7y7DNb2DNh?=
 =?us-ascii?Q?Cp651iZ0Eu4K9Ykd9QygkcDxAFfrHYgA2bFYqpztPcvlRRlKRqGSwlGTYgji?=
 =?us-ascii?Q?lYDS50UO851oCqeUAYtTX3IohCYg6ebf8oQR7fqtiLA8Kiuh9/4cJxRP1Klt?=
 =?us-ascii?Q?er9vkKzczOnHjqpS2rCmXBdIiKloqUfj1oa8gHs4uxbOSUg9uNAjOeZVVVW2?=
 =?us-ascii?Q?PziKMnlkwSEHSWjaRcGmVKKnyKUimphkqhAsTC0hfmq5ITZq6P3o0sLCvDzc?=
 =?us-ascii?Q?SaAT1kkUyDRrWlOMPMexGz9xsOOvYOIgmZ/w9ZM8D1WouA+BbQj7cF5NuR8u?=
 =?us-ascii?Q?53e8Sof/DOnOLxYGbhzHaVjKgvvIwx7kAsz0gYnkTKXaYP8z2SnmkrVARroi?=
 =?us-ascii?Q?zfKtLsTy9hy87dS9Yxw9/7hGMTcNzSMet966Nqu7gTeoEtzxebO033pvGCI8?=
 =?us-ascii?Q?LL/vti50xGLNTFrP25zESm4d+OW2IjlXZjU3ImvBFBKmT2uf701ipGLVhrAy?=
 =?us-ascii?Q?e7STjOUShk2IDKK6eb0RwsHq+RukyF4xSCb7/WHVhbcQaR4mRUK/BJwDa2Y9?=
 =?us-ascii?Q?Qev7DJWWfTRGFHkLdWaz8VWStlPk9wA4r+f5laVnjzRGtobNn1UH+jed9uP3?=
 =?us-ascii?Q?VQdKzj5W+qRUnClvAdI4St0Hyk52KBKlFO8iyLDL83WpRMj1pLwQncSBU2mm?=
 =?us-ascii?Q?ulUj5ohJc9f3ID6znmhni3/U1wlqhPHRkvkZ3behGAfWizpdeHov202/IbyH?=
 =?us-ascii?Q?bW7ojwyV9FyHSiambASFIKZyhCSl33Wejj/iKpi31GQanaztbCrIWRFXcX/A?=
 =?us-ascii?Q?0xpxAGDL0QEyYkfSFHmMMxSL/RNjS+SiJHOxMRHSqUDvcv9gYWwe+px/n5c6?=
 =?us-ascii?Q?m4fyWB6bHhOh7gcS/tQtH96FR7rueN1QCy2CVmk2j1rR5vy/ck65u72YWpgX?=
 =?us-ascii?Q?gJqM54omhyrA/L9TotNhkI41Eou0HVcn37wopBdX1qMM28eRD6A0ZCm+PmhB?=
 =?us-ascii?Q?sU+xE/n8wz3DLk5ma6fMDkNF8uLPUrLMSDqGj4u0BZ0wLW7LH4JDedlPB6+3?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81dffd6a-b7b9-4be4-5c50-08dca80fe958
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 16:29:07.5823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQQ5iM+EEcHuyetk3sfN5tyKSPnRZncXd92S117a/FasmdfDwHFBWIT+fBf9aGhqKkmwhiwbaptMftO19uq+CbglucGGpN7JWOfg9FeXMLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8581
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

On Fri, Jul 19, 2024 at 10:14:42AM GMT, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Brost, Matthew <matthew.brost@intel.com>
>> Sent: Friday, July 19, 2024 12:22 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/xe: Unlink client during vm close
>>
>> On Thu, Jul 18, 2024 at 11:08:42PM -0600, Upadhyay, Tejas wrote:
>> >
>> >
>> > > -----Original Message-----
>> > > From: Brost, Matthew <matthew.brost@intel.com>
>> > > Sent: Thursday, July 18, 2024 9:28 PM
>> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> > > Cc: intel-xe@lists.freedesktop.org
>> > > Subject: Re: [PATCH] drm/xe: Unlink client during vm close
>> > >
>> > > On Thu, Jul 18, 2024 at 06:47:52PM +0530, Tejas Upadhyay wrote:
>> > > > We have async call which does not know if client unlinked from vm
>> > > > by the time it is accessed. Set client unlink early during
>> > > > xe_vm_close() so that async API do not touch closed client info.
>> > > >
>> > > > Also, debugs related to job timeout is not useful when its "no
>> > > > process" or client already unlinked.
>> > > >
>> > >
>> > > It kernel exec queue timeout jobs, now the 'Timedout job' message
>> > > will not be displayed which is not ideal.
>> > >
>> > > > Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273
>> > >
>> > > Where is exactly is this access coming from?
>> > > BUG: kernel NULL pointer dereference, address: 0000000000000058
>> >
>> > In guc_exec_queue_timedout_job() accessing "q->vm->xef->drm" after
>> client closed fd causing crash. We cant take ref and keep client awake till jobs
>> timedout is what I thought.
>> >
>>
>> Taking ref to q->vm->xef is exactly what Umesh's series [1] here is doing. I
>> believe this is the correct behavior and based on you comment above, I also I
>> believe it will fix this issue. Please test with this series. Hopefully Umesh gets
>> this in soon.
>>
>> [1] https://patchwork.freedesktop.org/series/135865/
>
>This series also fixes https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273.

applied it yesterday, so hopefull drm-xe-next is now clean.

Lucas De Marchi
