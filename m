Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23096C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA89F10E0CE;
	Mon,  8 May 2023 17:06:35 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA5710E0CE
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565593; x=1715101593;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=bH0EfOKsdVXLb9w3ARbGzjsiA9rhh6K7JdJg3kopAVI=;
 b=BludamOzlfFVOqB/UkRMTTkY9q0NtUCNE2XRPGvo7/Ftm4nxEODv9xfn
 4nBcCQTq8j7Da2EGS9bIcIUyRXChwTOnOnjyTyMd3nnN2dvy5jLeQFSz5
 gQWCyHwSVbYmn755zWQcpNgeiOAlTPxR8v3Tla+iz0Gn07XwdB+DBSDxE
 I0UCJfiGxa2Se9aEDiaFvVzCAvYfi6JmI0R9BoXvBL3tvUAifAdI14qA2
 qNZ0qUu+DdlRnWLYXl31Ceq6hPB+tnOSuyZ+DHKR2Cqrhnt4TnYMLeowb
 8A+VNtebVMyDNzBjQMzRl0ewm/m4gqt4XfOlGrb3HwjHsdp9cPQs5uIOh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="412963193"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="412963193"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:06:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729149468"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="729149468"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 08 May 2023 10:06:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:06:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:06:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:06:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrRtO+ViHoZsHicqN19g+qVV4xCEyNxnDqgLPnYo142KLaQagV3A/SRPRw2iOBWRMFAMIoTzjPHv6a6Ipc2NyOv7cxJxRUfgOPNk3fbL7Gn9x/RPZj+NFfBOB+Vbhupoaqz3MeLB9gQQmpOn5LkVN9rhqH+9j8lJIM7fWpUQLIeOLtGmS47HVYsiTwswHbTYkd9UZ8wUdpn46FMoBv3YL9u+JDTQr5hDw8JdJbO1eYmMdxczBTObfKNrfvUOjFEe+Rdy/boWJMHpk+mO+VSYm/ZHMfcUzFe6ldJJogqzwVqeYFNDcl+ToGTnJbh5cifPUp+X9VtoP/oLuWE6SOedZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYydPG4H+pPDChcswuQVyPC6qSwfDhtn4MjyXF1/2KM=;
 b=ByWeMMsXZuNNvXTEcUwBRvb2jfKHo3ra/ybJ/WJmju50hszdsEsDWt8+e0QDkoFx2OAURbYcPLn0cxM6LBT/T8HgMBOE4tstSMbPRTK0Nr9jRQAfQPYZysZxxn5MmTt0JJ6w7Lx9hVbSBHkPjDpfzxOMlyf9/OMlKC99+dJBkgmKVQ2Kt6FqgfaevUPB6dkK6X3rV9b+EnroNVDkSOfUKAWrlpuMS8R6S56gY4LOL1zl/0Jmx1cH68SY093E1Tx7SvTyBsYLsY+vwuYfTBYx0SCKD1B4E2RKADNz3znA28x4fiib4oetwBfq2xHqigYn8qHG808jdG/PR/+1Unt4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:06:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:06:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:05 -0400
Message-ID: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 3097b590-dc77-4814-18b2-08db4fe68c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t3RYwPvkTzGzqQSeuL0U1K51LyGCsjfc77YF0mIRjbYuGjcORUCYgXXj0Vt41A4Mu917EDvd0GW5LPAPW8Nvh6tKmleuL1YM3YGsRPujIQkqKTyTo8L1saQBEcq+ebs34pwcnPWOPrXi3nE0YieI+AnI3Seae3qCSGT20C6AJQ34GxrUHOqz8WiqJzrBqw8L+V9HDQ6o9CUXXx2CRVCH5O5kPBf17JSjklgqIOFw+XPLUHIjJbBgFvCRMToSOP0ZEhTmrIKCVBwYj5GCd3wmP+nhkHzO/2owNIw5m/UF0wSvGEuqShaqNkHTuucRxT7ZDiEcEPDsq9ILONhSejtOfsEDfJAKiCV3CwxscMtL6ETcs5Df25YOfMnwNbDJ3DWCQE8+eOD/fVVI7+UBPAm+Z3JIiErvXinTbJOGQSuwOrAxwW24FbALOs4y4c5WgH9J6EMrRgMTuPYbRxDj0R1et/knsSW2TSH6+U9kLpHFw9jqJFcFVIYrSDd/OcPqEZMu/vnIde7c1WGTLG2pcgzMECT9jSyvyByrNWXdsQKU+9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(54906003)(2906002)(8936002)(316002)(478600001)(8676002)(4326008)(66476007)(6916009)(5660300002)(66556008)(41300700001)(6666004)(44832011)(66946007)(6486002)(966005)(1076003)(6512007)(26005)(6506007)(107886003)(186003)(82960400001)(2616005)(36756003)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWRPL2VoR3lkTjVjakRkRjdHWFBGbEIvbEo5SHdoRUJ4U1lJVVdqbFcxdlVv?=
 =?utf-8?B?S3pFT0lBa2xMeUxNS0FZVVM1b216Y2w5ejV5QXBCRit5RzBCUmd5aTBraW00?=
 =?utf-8?B?VFdNazhKRndjTlBZQ0pRTDRBY3UwVElmQVBTbFU2K0s0S0xualAxYW1POTNP?=
 =?utf-8?B?dDdPWFdkRXdpUUVTSFlXVWt5bUlTdlZBeWVNZHZQdng0Z004Qi93REtwYVN3?=
 =?utf-8?B?QWMzcnhmR0pRUzVvSUFyWVAwa2pkenUzTy9MUXBGNkxpNXhVSXp3YVZjOFVE?=
 =?utf-8?B?dlV4dkNaeFR5akovdE51OE5XNGYrZzdmZmpYLzF4UE84NGtsQzM4YjlQcUVC?=
 =?utf-8?B?eStDdDkwUnVGaUlSNzQ1WEVjQ3ZrcDc3aWhvbzMzTEdmMUcvWjBXWDVSV0NN?=
 =?utf-8?B?alBzLzRnbDcyNzRPdUNPeDc0YUZheDRyRG1TOFk2V281SUJobmpwLy9xZ2dU?=
 =?utf-8?B?OWxCQmt6RW0xY2VYME0vdHE0ZDd3Vk1sSmxFamljUXRtZWphLzVmblZtbXFY?=
 =?utf-8?B?NkU5TDMvSjZEQTVTQzhnNXkra2hiNXRFcFJvbkJXcjdqOW9LbkFMWURWVVJn?=
 =?utf-8?B?K05QMjRyRUVhK05hNkpaRUV2NjU3M0FvbjdNUXpMTEJYOWFwZHpVdkR5eVZ1?=
 =?utf-8?B?MVFtVnd5eXhvaDErWURqSnI0c0hhajJYQ0FDVEJIRm1RVmVLRjNTOWU3aWhF?=
 =?utf-8?B?ZlJSREZpZGczV2NxaGJzMkFuaWJaOEFwekxQMXJtUEs3b1d6ME1DZ1RwQUJC?=
 =?utf-8?B?Z2JIZWE4S0NUMjBjQ1FEKzRMSEs0dDh5Wjhsd2g2ZzNiUHNEcGg3V2hOVjdw?=
 =?utf-8?B?YXdCaUt1OHZlcXFLclJrNjlBRENYNnRPQXpXUjlNRXVRc3I5dE1JSnhkdEda?=
 =?utf-8?B?SVAyanRuK3Y0c1BEZmludXVmSitLTmsxaWtqZS9RVTV6cnRERnIxUlhqclkr?=
 =?utf-8?B?UCtmeTQvckRPV3BibzJ2RzNvOCtldGFXK0RHMkVEUUdSdkxEVWM2enJodnNS?=
 =?utf-8?B?VHpPd0kxTEVwS1EybnJHNGZUUDIxRVhHc1ozWFpuSnVVTDl0UEhhNnI0VXJo?=
 =?utf-8?B?bU1QdWYweEdNNHdWRkNtVVBSazJyNTkxK3JBR1lTWEJoZVJXNStFZEp4Z3kx?=
 =?utf-8?B?RHNJT1pUVUgvVGVZUUE1V0VIbmgzRzlteGtpV1FSZmJzUlc0YzR3cldzYlpt?=
 =?utf-8?B?VmtaZzFQVWk5SVdjSjhVWEZDblBvR1NJRTljaVF1QW11SXdkMWQ2ZW5Rc0lJ?=
 =?utf-8?B?VDRNNThBVGo1UGdnWjBrYW9JdE50b3JOQmkweGlHY0hLVjc3UDgvd0RHTEl2?=
 =?utf-8?B?NnpCS2h6UHZtM21mL3FGdm9uN3l0VUtXODc0S29ZUW5YMEJaWVErMEorMHFU?=
 =?utf-8?B?QnZxbjhIWGZMK2JIZ3Q5QnZodlVZU0p4SzVtNjhqNktGUm0yQVVndXZyZlVl?=
 =?utf-8?B?bzVKU0VieU4yVk9BNnVSUkMyRDNJM293OGNUQXJLWDY1VGJMTytjY0kxVXp5?=
 =?utf-8?B?bC9uL0VTc2JkQWdOb0hUaVF3NjZ4V1VQTWxObjkxMkwxcXF0QnhtSVhmMm5h?=
 =?utf-8?B?emtKdjgvdG9SdEtKNitzWkthQXR2alZ6eHl1VGV2KzhBdFNTaWxZaFdLbjNZ?=
 =?utf-8?B?T3prcGg0NGt1OVo3L0tkMStnMjlmczNsbkJobnBiNTdzRTVrMC9CeG1LSVh4?=
 =?utf-8?B?VTBmSmRsQjZoV3BvOEFMNzR2MEtSOE8vdWxEckk2b0ZycXRNUXI2UE1JU09Q?=
 =?utf-8?B?MVcyNGpkMm43WVJNN0dUUVBBQm5MQVZkekt6NzhvMUZZR0MyZk84ZkpUVG5O?=
 =?utf-8?B?Q3hFRkpFK2gvZFl6S2hzSzEwK0dmcDlqMWNrY3g2UWd4N0Y1T2VQa2NtVWx2?=
 =?utf-8?B?cHhOdTRPL3NkbVZQQm5sbTZJa0w2VXpFUnZnS0ZXN2VqWHJhMmZGbWM4dlEx?=
 =?utf-8?B?eEtpWUxsOEtBQ1JWdW12VVpYYld6Smo4ZDdkYWhiM1h4Mm9wU1BJdDg3d2t5?=
 =?utf-8?B?enV4bmFkcUVBNyszajFWa1lzSExDZjByTlVNcG5aMzRqYWROdkhYWTh3RWZv?=
 =?utf-8?B?dEl5bkVKem84c1JiRnNRcTVRYW1kWm9WS3VVbmVvL3VXMGlueFpHZk1HeDgx?=
 =?utf-8?Q?LjMrVkQfUnXloDqktrcerm/WV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3097b590-dc77-4814-18b2-08db4fe68c62
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:06:22.3073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsTYNHuAVO1nmwCr7uKZpDUTQSky5R7lupKe9u3zM1c4wEzocZu7pBoLzo2q26yIROPcmbATcqEfq7F4N6kJcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 00/11] Introduce xe_devcoredump - v2
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

v2 of: https://lore.kernel.org/all/20230426205713.512695-1-rodrigo.vivi@intel.com/

Addressing comments and requests, specially around atomic memory
and memory allocation failure.

Also, leaving VM stuff out for now since that might conflict with GPU
Space from Matthew.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Rodrigo Vivi (11):
  drm/xe: Introduce the dev_coredump infrastructure.
  drm/xe: Do not take any action if our device was removed.
  drm/xe: Extract non mapped regions out of GuC CTB into its own struct.
  drm/xe: Convert GuC CT print to snapshot capture and print.
  drm/xe: Add GuC CT snapshot to xe_devcoredump.
  drm/xe: Introduce guc_submit_types.h with relevant structs.
  drm/xe: Convert GuC Engine print to snapshot capture and print.
  drm/xe: Add GuC Submit Engine snapshot to xe_devcoredump.
  drm/xe: Convert Xe HW Engine print to snapshot capture and print.
  drm/xe: Add HW Engine snapshot to xe_devcoredump.
  drm/xe: Limit CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE to itself.

 drivers/gpu/drm/xe/Kconfig                |   1 +
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/xe_devcoredump.c       | 225 ++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.h       |  22 ++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  57 ++++
 drivers/gpu/drm/xe/xe_device_types.h      |   4 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c        |   2 +-
 drivers/gpu/drm/xe/xe_guc.c               |   4 +-
 drivers/gpu/drm/xe/xe_guc_ct.c            | 310 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_ct.h            |   8 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h      |  46 +++-
 drivers/gpu/drm/xe/xe_guc_fwif.h          |  29 --
 drivers/gpu/drm/xe/xe_guc_submit.c        | 301 +++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_submit.h        |  11 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h  | 155 +++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c         | 225 ++++++++++++----
 drivers/gpu/drm/xe/xe_hw_engine.h         |   9 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |  78 ++++++
 drivers/gpu/drm/xe/xe_pci.c               |   2 +
 drivers/gpu/drm/xe/xe_vm.c                |   7 -
 20 files changed, 1228 insertions(+), 269 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_submit_types.h

-- 
2.39.2

