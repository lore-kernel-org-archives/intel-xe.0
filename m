Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7E6EB64D7
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 15:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F9B10E0B8;
	Tue, 13 Jun 2023 15:54:40 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EED110E0B8
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686671678; x=1718207678;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OA+025KuMErEG7Vlwi1BhOnpy5NDPaIV5xgMKInOpHk=;
 b=G55XFleuMEI6+d1pZ6INMnQrCPt1WcSXYFUfC70yFqZ8aAJL7aDZJyMU
 5Lz14cVmgW0jOp1mIbwg8ghOZYcf5rdbugdDevyrTufEdaj6HF/zImQ4O
 aRzOT2riGW4i1r4z1GKjW53FoopencUKJXgVcx+ABnfL7bsqB968IIOcG
 MgP33Dt3i+bos6z9iPm7+HVJ5ET7LAb5nFk9tQ7F/XMLXGsMHBElF5QIq
 C+t8uZMjtwHOWraCoXZAKzH558xOsvRASn4BCB+PaJ5t8GeTXazvYnHhI
 dmdB/PnGGUapO7cMz67q8r2ldeFGLgb6lutYnVQ5RqHBLqw5a7FVhWxDf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="360855138"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="360855138"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 08:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="781728017"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="781728017"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2023 08:53:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 08:53:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 08:53:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 08:53:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cx8jIBD6nI4hXtR00IvWiZwIjKOL4h96vZyGeqqalJYLohP2v3O1YHbBBUtpENTYnGzyWD9VHrfkwp2wi5PfSAwVOPcPK1j/Y7Q1MfguC9nymYYP1u/HOZjikWVRnIgNqiZMeb5c7evOMkHHJ2sM2BHdr/SiFrqXXltHCF4cfTeKEeBoGr3rcSLOq9lQr9AzLAOaF6T6zQ9zjh0E3FQthnZ4j2TfU7bI/hivT0glelWGWXOspYt4dkHmLHfdDrVG8MbbKONyaBMHa7IBZcuDaroLeUSyL32U2fIyBH921U2Lrn1Q6zmOCPNm/+nTNDFCQOChFC/8Wkgla3/FR/deUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHU5/grxC9/u/RTzoWsPSIxDIKrJ/kS9Ap6yxIQJH1Q=;
 b=UPxvKqpzeJ4RVLrn8wSsu2Y0iqoietPp+nMuWi+MF3+tutOGAdKQ8xqg/+nZ4DihKyFIGhihZdEaKo+9zHZ+sJz/y3YX2idSDMbtzO3rn43lF+sT018Y/W4v/9kbAgTyk2WOaBhccuPG0Vc00CFi/HLtrJpJOl0bOW7GnMXw0gPWubLu7ThywIN29Lf3y0f5PPznMA4WMXIu4bOXxKYvQbBxpbPFjwlZn7wjbrXdG05lebDf89u7fot6AlENwsQN9NFjtJv1jVx3gnqfDY6cNZ0XTyLqvNfZE/JYTDnJu9LxNZkcFvcqewrMjJHGgSm8z8IRmnU8Td78M3pLIMfRfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ2PR11MB7645.namprd11.prod.outlook.com (2603:10b6:a03:4c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Tue, 13 Jun
 2023 15:53:04 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 15:53:04 +0000
Date: Tue, 13 Jun 2023 08:52:55 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIiQ14S0KPIlAuAs@nvishwa1-DESK>
References: <20230610001226.4577-1-niranjana.vishwanathapura@intel.com>
 <649e8484-08f4-2c2f-fd19-de3839025fac@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <649e8484-08f4-2c2f-fd19-de3839025fac@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ2PR11MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6770b6-af98-4034-e0d1-08db6c264603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5jvPuV6HLL2slmyMI4astWSvkbj57SxfJf5f29bHp8bJuLKRivP4nkQBCRpHrbJaSFOiG/cpSWU2Z8KBGhp6TTa1l6ATRER9W+CBTnKU9uE8++9pqYx9UWVQw4zswX7SNY/2xGh2AsaiJzHgLADLGrUM/NArFEbe0/f45zW+Nje+nzvSnpqx9FLLXOhPyD48xnyBwIOGgX8g7eG50FNZjQcjatsPphRBkfQ6blGFtfbniejNeks90RfF1TsjLzzVI5qhlHRvLBG4VPvK0FtxrzpA8frhlOPDjqi7OugK8chHXjIinTChOs5UDUrMe0zcz483YGVnBGkzv6r1D+1qMiMeDmM+Cw6st+2Fo6VxxYKJEa+zK1yFs8YW875lL5dV8myC7wACyIIhGolTR3bayswuzDpTPELA2o+Z8Gkm9ry7ov5Qq2eKAvZtrhBUz3a2PMQZqNLXA0B22oFwsv+I5WJQBa5P/Pus54S7Cah6hDrVOi98/bAE9465ff3e7TEot2xAndZ8hQJjFcRHiKPlvqy/m1BmAZ6DtbF+VycwXNCqyf6oPrQlJtWhsQP9X3sd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199021)(6666004)(6486002)(478600001)(66574015)(83380400001)(186003)(9686003)(6506007)(6512007)(26005)(82960400001)(38100700002)(86362001)(33716001)(66476007)(4326008)(66946007)(6916009)(316002)(5660300002)(41300700001)(44832011)(8936002)(8676002)(66556008)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ie4F85ciiw3CsePXLegr12/5yBDZtseR53l9LYBQMKKo1JAV1oG+d7hgsH?=
 =?iso-8859-1?Q?MBGnFOX/SUWH8mxDiPxCWqe3Sf0OZAPg0PJkpkYZpLGEC8Il5d8chsWrjK?=
 =?iso-8859-1?Q?bGRokIceNbKvmiKgPeWicoVAiImgud7g2J7fkwzyN/ABDlhN1SOVRDeNWm?=
 =?iso-8859-1?Q?xMV045az7M/DQUvy5JZTWhZDYaEuc6BoEf23UUo5FnpYYaFXR5xJzHsBbz?=
 =?iso-8859-1?Q?wqjtABLKi4ucN2LE4xQub9P7UByh24Lcw6upNZviu+SIdG6HDRYWZciuf5?=
 =?iso-8859-1?Q?EVcOdZnexlBIALa//iESDNIj8Pg4NM8ivPGHVSh++vRHVOQ/li1oBWS5Bi?=
 =?iso-8859-1?Q?GJeUUFfoat6eT2GLQZ2Xf2qGl+tETMkDKCKPr+SnVRYJkU32YjFsgq7Nj2?=
 =?iso-8859-1?Q?n6RRjvIupA/tQCn6Exq9HDXFvgI8STnqa78nd7OfDGvoayzUAMUnNoq+Ch?=
 =?iso-8859-1?Q?uHQtAGj7sQxW6cObgIRFx/TU3kQSAYwLnhpXbbVIBcAHYPQJxhvUNpsmW6?=
 =?iso-8859-1?Q?KSRXEv6fvboMq2yuVmxsdUh7IQawmnbrV/GR+NGS+DRxvuvxoQJLoqsQ86?=
 =?iso-8859-1?Q?ERCOPNz7kXFw5xpCXtqWmDhYWVRMwOvEEmIivW+SDCf5qakKasdVv4Na7N?=
 =?iso-8859-1?Q?faDRg3/HsPnQsTqQ8vIhbbl5dUC6rgQmp73EQ6GhIAM8BFcT5iDJYakxph?=
 =?iso-8859-1?Q?dNSFJu88OWfhhDzC1jWBrDAZ1BEygxKzWwQycEay1wWSQSb8LeIbckeXVK?=
 =?iso-8859-1?Q?NuWlisQ/ryuwLabOkEYIMmZsnvZR+ghJrGZ0+l0slFGvYDGY+f6PojFRkt?=
 =?iso-8859-1?Q?rXPdeoJTpRRVTrcTwXCoQ320HxkvJlwahYxgTqKYMj8x+DCVp4QHVsgYTL?=
 =?iso-8859-1?Q?0GYHLAVyA47uozRPaeM1T3pyhqZ8nvQONAAgOZBzjlGKbAVzBTNunKqRz5?=
 =?iso-8859-1?Q?9TEDHfA6XTCWJj8bPpw4u9T5b1Z5rrg6RxZ7f+FTD6Tv9XJ4nyq6nfEBfJ?=
 =?iso-8859-1?Q?/7E2U8AErSkmPB/7QVq8tZKo5BCQNRdXLyiKYaKmyzKGle1tQFs7jSthE8?=
 =?iso-8859-1?Q?HvVE+gXca+esGUTGI4owda9EETpS9TaTzUJv8szP8djMhl0x2FxpvNPCxE?=
 =?iso-8859-1?Q?cVf3FcDnbEok2j9oFkpvJBpjACn05aqRX87IYTgNMIUgkMBO80OHX0OwNl?=
 =?iso-8859-1?Q?spoD0pXZQ0IXZ/bPLxdZll4cwVsSeiDDVfo9cP1uCEJw+qIBpqE65cu4do?=
 =?iso-8859-1?Q?qeoOr98nLJ0IQ6YPVxfEZ2BB9TBXKGv4VHHntjhX85v4xNkC1tPHZQa69q?=
 =?iso-8859-1?Q?nfOkXUu3yA8aQnOahFzq6SBWmhsV+QwXw4S0le39eH/nNr1MJkiI/K3f4Q?=
 =?iso-8859-1?Q?Z+WR96WX0+ahSQAs9xmAO0ZTOkj/3Dewf3MlZaD1ZkFeceb42L4ilFdGbK?=
 =?iso-8859-1?Q?CfUGS3whHZHOzGOJBBBxU8TN3BU1hmXtUrv+eTlDkVdFoznKkqCiex4tNB?=
 =?iso-8859-1?Q?VA/9IPYlKt6kz0QvhAbf0vg+F7DHPyp87kp3DFMZDj9MdEO6QaXlXITnJS?=
 =?iso-8859-1?Q?0xJmCSlVbPxXq3mXrbJbifzvtp6AqXfJN++WGcFXbSrz2PppHtsLPHsvZ3?=
 =?iso-8859-1?Q?cn7hAolyuQWki+hF7b3kcEXbXo0lJIfO5/Vs3CY0iUjsUMEihUMjrAOqkc?=
 =?iso-8859-1?Q?agBBVBCn5I1vV2LxZZ8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6770b6-af98-4034-e0d1-08db6c264603
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 15:53:04.4027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +S8qblariHTwIpLg6Azk43nnoPRH97vV7xLmtFJgFcpU3XlouVKKaLkFehKE8avTXz1X4h7u26gjKxxJS6Ssk9Vs9LtLWiQUYAHzerUQLwxfyCWvA43w6t1soWqBvkzU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7645
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 0/3] drm/xe: Add preemption timeout config
 options
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 09:31:00AM +0200, Thomas Hellström wrote:
>Hi, Niranjana
>
>The plan to handle non-preemptible hardware with Xe is either to use 
>faulting or to pin memory and use CGROUPS to control the
>pinning. So when that is fully flushed out, there shouldn't be a need 
>for these changes?
>

Hi Thomas,
Currently the preemption timeout is hardcoded in driver to 640ms. These
patches are for preemptible hardware and allows preemption timeout to be
configurable during compile time. These patches are being ported form i915.

Also, the purpose is actually to give compute tasks longer time to reach
a pre-emption point after a pre-emption request has been issued. This is
necessary because Gen12 does not support mid-thread pre-emption and compute
tasks can have long running threads.

Similarly DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY sets the default timeout
for copy engine to a higher value for PVC.

Niranjana

>/Thomas
>
>On 6/10/23 02:12, Niranjana Vishwanathapura wrote:
>>Allow preemption timeouts to be specified as a config options.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>
>>Niranjana Vishwanathapura (3):
>>   drm/xe: Add CONFIG_DRM_XE_PREEMPT_TIMEOUT
>>   drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE
>>   drm/xe: Add DRM_XE_PREEMPT_TIMEOUT_COMPUTE_COPY
>>
>>  drivers/gpu/drm/xe/Kconfig         |  6 +++++
>>  drivers/gpu/drm/xe/Kconfig.profile | 40 ++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_engine.c     | 30 +++++++++++++++++++++-
>>  3 files changed, 75 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
>>
