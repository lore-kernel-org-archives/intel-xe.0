Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D61C77B6C
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 21:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1422C10E262;
	Wed,  5 Apr 2023 21:49:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A317B10E262
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 21:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680731357; x=1712267357;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:content-transfer-encoding:
 mime-version; bh=hKpMugnT5uVzfbJUAjrYfWd+lsdG3X180eUjeVjgHhA=;
 b=BNIP4S5vyHL+yEqcbkP2rVskfmR0DR8R/G7DY0tTuqrac8aObbVLDRdZ
 4avsmtEWqS4lqHPFmDpnw6c9aeLkSw+VJxd+sdcF9GsIPic7EXsMy6elV
 dPuhwU7yEINW7BGm8RhE8h5PhRp+rvItGBfAXanMmQqxNPcEfwMcj43nB
 M6EecMjlEOTHCcAzomaIT1EYYMy059boSpdgt8gfcguZlfGZ7T5OLjzze
 rjyLeNoI+S8DwUgThSVuDYXAqShrAB//gTzcQPeyYh4QnSwyOs51vjZq1
 ybwy5ObvhU1B9Jqd0ct1tMsX95wQLKWH6YC62TStmyDSJCz1Gcb9COcin Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370408665"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="370408665"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 14:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="664199941"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="664199941"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 05 Apr 2023 14:49:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 14:49:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 14:49:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 14:48:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kt4P4/ZJ+JYt42J/NssLmDA0HiArQdKAU1xmUlGXEBu7vGN3lTCQfhz1b/RrgMDoXdkogqM6Riu/64YtypmPRniAJYtnBy63/JEzAegw0Cea0PMzOKRHAgK7Q8ejyTemFS3+Al+QQwjrdkvAYXsqYMVZryxWV56mVOY28e0ij72LQ35YnrAEA6l5s6Y67WOBB6IEy5HcpCQLY3GyR+XI0Xz12aamUllAlB8qArajB5L2g/WgiswFtfNm3MVRWo3XmxczSmu8stNNyS7iOG0HA1yiex6nk35ksdWEmS++LJbOJyRscPyBTLfpxRditVOFkie4Vzm77gyD2V/fKo7TWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxNwj+kBue1tvc/WZpc8JCjE8iWBEqprQ7vbvD0DZzk=;
 b=D/eyBwgl4uoNtkSrecozyNB5qAY82y/PVFbz+anHPquLdHDG6IWIvU5V8nEv60FZ1V4KvUUFRHX0yISZqhgSFbQ08ADFJNAK0LHHOag4uIOPKS3NZqjIDrKDyHWO+d9rZkpThV8bdlUQeieuIjv6edulNsc6d6+YgP04yOvlUxoKlyG6n5RuYIzKs+hUM13/AXFqzKx0cwch8zdbXkBH+kzliPrFJWw9Pbf0yjg50z7LdMump6wFjOdrhstdycDPAOzf24/MrwrYT2WuRubk5DnnyNx5sZcCoVXnW7j0GTi+macN9tHueUwk8/xxGptGnEc0IFv05tZSnHPgYdqkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB7699.namprd11.prod.outlook.com (2603:10b6:806:338::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Wed, 5 Apr
 2023 21:48:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 21:48:51 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Wed, 5 Apr 2023 17:48:42 -0400
Resent-Message-ID: <ZC3sunIiCRcuDO8J@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>
Date: Wed, 5 Apr 2023 15:52:05 -0400
Message-ID: <20230405195205.1674844-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4621:EE_|MN0PR11MB6059:EE_|SA1PR11MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d57877-0583-4033-e862-08db361f8b4f
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199021)(186003)(66899021)(6512007)(6506007)(26005)(44832011)(1076003)(107886003)(6666004)(30864003)(37630700001)(54906003)(36756003)(38100700002)(478600001)(86362001)(66946007)(316002)(66574015)(66556008)(8676002)(4326008)(82960400001)(83380400001)(41300700001)(2906002)(66476007)(5660300002)(34206002)(966005)(6486002)(2616005)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b87838d-b43e-40f1-26ad-08db360f49ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 19:52:29.6052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MDreBLEQy8h5wX42Tgruh93RJg2FKB7YQEhLyAVhrt5w1QBzgmM5biu9svR0+/L8pXwlNMbWGb4fUFkLJ+i5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.5512342
X-MS-Exchange-Processed-By-BccFoldering: 15.20.6254.033
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(815096)(250001)(410001)(930097); 
X-Microsoft-Antispam-Message-Info: ssPoSkgV2gbq0MP1YNgXaLUeAY5LswwKMf96Kvtv6bb9zD1WAYx4ZF+5M7WTLF9yRNeJ/JFxwgfbCTR7+WEcj6xhfctMJf5bODUMzY1O9IMfa34LbcqQffjP7RX8mLxcT7YKC13BrjU1fih/KTXuuE61J9NGx2DewNxQ+tbaEQ++N6YrXmyuupqxjQqBok5hfZZqRQryhYMQ4B6XSSoPmxqkwGlxHiJGBThTewA81R4AGNSLlBD6JEbiVISJODBTfhAORKM2YNPfMCGm1ALlQOPtbmWHQw/diJmvZV/sRg4dXTcndWUjhnTn/A+9wchx+NvYeGHRPXeXzYz+hSVoqjTTWxdOYUsvMKZwyGeEVoQOrVjgAjKiCU8GrMegmN9645TV2uKXxGXW3iEdj9jfDruiACIUIxn4aX3USIjtJz131Of1lks5RbEELE70AoO+BS1kcWWpb32NuSdGYiB5xCzgK/Gvg6ulHIxjwo8VCVETVUHMraic8gLUrMxBFpB5
X-TUID: 7ij5AAtsBOsl
X-ClientProxiedBy: BY3PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8b87838d-b43e-40f1-26ad-08db360f49ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTRTVUkvRmJZbDZZaWlNTHo0RkN2QUdZRjFJK1NoYnRwM0xVQ2ExeU9nSmZw?=
 =?utf-8?B?ZkxpY0FYbmgzVDJteitIOXJYeGtySUc1TGZtUE1jWmhyVk1XZFdRV2FCamFr?=
 =?utf-8?B?dlJpUkhPQTZNWUpVRlJBbm45cnluOW9DTzB6MFdaVlUzV1ZGRlVkZ3hJejBa?=
 =?utf-8?B?bEtoMTlJOUNIZzZZNnJQS0s2K3VpUVdsdGc5NUFYcy9jajNBbi9GREhLK0Nj?=
 =?utf-8?B?QTMvNDFsV3A2Z3lsS25HVUZ6em9reWg5OE90ODFNUXJPc2ZUWFc2cEgydDQ3?=
 =?utf-8?B?OGlkWkd1Wms4L3ZFc0p3NUhVK1JRV3JZNkk1TEt1bFNqMFplN2ZnNURlK1RQ?=
 =?utf-8?B?KzJsbWE2ckl1OUFZUmRudWhPaGZnRjB5RnpHQVcvNWtGaUVwdUR1aW4zK2Q1?=
 =?utf-8?B?UGE3cVFEcFZRbEtpUW1KR0U2b3FJbElGenRyRTNWdnM1a3FWZkozd3JuRmtR?=
 =?utf-8?B?akVYRzZQSVNaNTQvLy9aemkzWU9Fd29oZFhHRTNqRVNzbnVlWElvYW92d2NG?=
 =?utf-8?B?QjdPamc1T05ZQkwyZlJkdkhSaGVNelI5b2pOTFNiRWY1L3BZL2hxdnhRV09w?=
 =?utf-8?B?Zlh6eGRDcFNhRlk3NU5CdmpoK0FTelc0azJKRDhOcGZqVjFMYkVRdGdpVTN1?=
 =?utf-8?B?bWdzZFBUQ2JubHRFUm9NaHBGY3hrOU9CNjJIbFlpd3Vzd2Q0a1g4UVZFWnBD?=
 =?utf-8?B?bFZLM2xiNnRJMkhhRmZrUDdMeGNZSjV5eDFseUtEVXRRU2E4QWt3bXVLTXhu?=
 =?utf-8?B?Q0EveURkK2lyaGloK1U5N1BINTR1ZG9SbDJCRmFLUzk0L0wzQjM3aVlVUmh6?=
 =?utf-8?B?OWs5QTM2TCtZWjdHMXdiL0F1K0JkMGpEMll5MzhWY1V3MmMrVG03VUxianlD?=
 =?utf-8?B?ZytPYXVydHo5UDVFY2p4RnN6ZURaVmUyRGE4TFRvTmFESGdPSDJ3NE94M0ZK?=
 =?utf-8?B?SHJyRGJrcERmSndaVDQvODJneUdQc0tyOW0wTE96cWExeEFWOUR1QmRML3Vr?=
 =?utf-8?B?eGExaCtyM2h1UFpJWmNRWUFCV2VFRnp4cm9uZ0RPdW42RUFPS21SRjgrYlRr?=
 =?utf-8?B?MkF5RGNUOENZbVlEbGtidGdHVDRzVXFhbVh4WkRqZFZvekFCVll6aWNYQ3hp?=
 =?utf-8?B?Wm9ORzI0RjBmdjVvVVhETnZXVlhnSTA5bTdUVWtRako2V1o0amsranRZdER1?=
 =?utf-8?B?TytWVW84ZmdSVGpXZTBNN1ZqVmF0NjA5NmtuVW1zRTk1bGk3MVI2OUlzWFBw?=
 =?utf-8?B?SkxEZDIyVjN0VlJOVU01QmFQZWc3YWg2VTJUTGpvMTRiRVJuK0RTZjJvUlZ2?=
 =?utf-8?B?a3JNUFg5R0RQOE9LOGJlczUybkNXOVVuZXc1aHZWSGpYUnhrRnNWNDVqUHJa?=
 =?utf-8?B?NFVUaElHZFNtSlV1amNMbXpYcnF2d1FnTG4ydDVHZjVSdFZ2YmV5QUNwR0ZG?=
 =?utf-8?B?WFVTU3RheWJkeURWaHoyV0owTEdENTVIUXhaTXNjQ3I5bEpzRGc3aGlmMEtp?=
 =?utf-8?B?eG55Qml3Qk0raWxOamFtZ21ndXJMRXdpOUd4aDNXQnFzT1hXMWtHSnBFcXJi?=
 =?utf-8?B?UlJXVDAvdmZmeEg1elhYa0dwQUNJM3FpVUJId0VxYnlzM0tGT3ZZZlM2eWRW?=
 =?utf-8?B?UzNsY3ZLdDJ2QWFBejh1VE9wNlFRVWNBSXRSemM4L1dWMFlnQXVGWXRBcXND?=
 =?utf-8?B?ekU4bDlPekpZZmo2MjdsdDBocGJZVWVTU2tMSStacVpmWDJWWWQ3ZklyUkk0?=
 =?utf-8?B?NHJCSVBoMTlCcHdKQXAyYTVsY2NDVW94ak12WDZWZXN4WW54bGljMjZwUG11?=
 =?utf-8?B?aGFIZmZnWllXMHMvMGlJYlgycHJaa0VjM2dDSlJSUVdlYURSd3g4OE9udFpx?=
 =?utf-8?B?THc1WUU1TTNDSjgxUGxnS3pEdUNkN2JNakIzQ25zektxNi9lNzNIQjRVL2ZB?=
 =?utf-8?B?c2IwdmJvazRnY1l3VHdjY3RlVnhqYUpQdURYdFUwenV5SHhNRllGL2RtRmJZ?=
 =?utf-8?B?eDdydU1ad3Z3dTRJTWxUMUlBKzhtVWxBVWd4UlJVLzdZcDFWUHNWQ29ibzBL?=
 =?utf-8?B?VWFreUZRWEJmSDdyYjdtTFFkblgvbnRaaGQyNlAySlprclpzbHFNdEhOeEVz?=
 =?utf-8?Q?VODmIODBdzwdiGNcNL9Hd0vF9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d57877-0583-4033-e862-08db361f8b4f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 21:48:51.5249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B578DUkHfZjjKzx3zHHjeWpJXNZatHURumrwCbacb87EeYV/RwzGQfvnQaWn0iQxmS1FpsE3X1DN0akPw2a9iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7699
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH] drm/doc/rfc: Introduce the merge plan for the Xe
 driver.
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 Luis Strano <luis.strano@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let’s establish a merge plan for Xe, by writing down clear pre-merge goals, in
order to avoid unnecessary delays.

This initial document starts with a TODO list containing items with clear and
measurable key results. Xe’s initial pull request should only be sent to
dri-devel after all the items are clearly resolved.

Since many of them involve some level of a community consensus, in many cases,
the consensus will be reached in follow-up patches to this document with more
details of the API or helpers that will be developed or modified.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Luis Strano <luis.strano@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 Documentation/gpu/rfc/index.rst |   4 +
 Documentation/gpu/rfc/xe.rst    | 216 ++++++++++++++++++++++++++++++++
 2 files changed, 220 insertions(+)
 create mode 100644 Documentation/gpu/rfc/xe.rst

diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/index.rst
index 476719771eef..e4f7b005138d 100644
--- a/Documentation/gpu/rfc/index.rst
+++ b/Documentation/gpu/rfc/index.rst
@@ -31,3 +31,7 @@ host such documentation:
 .. toctree::
 
     i915_vm_bind.rst
+
+.. toctree::
+
+   xe.rst
diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
new file mode 100644
index 000000000000..1e3e7e9c67c3
--- /dev/null
+++ b/Documentation/gpu/rfc/xe.rst
@@ -0,0 +1,216 @@
+==========================
+Xe – Merge Acceptance Plan
+==========================
+Xe is a new driver for Intel GPUs that supports both integrated and
+discrete platforms starting with Tiger Lake (first Intel Xe Architecture).
+
+This document aims to establish a merge plan for the Xe, by writing down clear
+pre-merge goals, in order to avoid unnecessary delays.
+
+Xe – Overview
+=============
+The main motivation of Xe is to have a fresh base to work from that is
+unencumbered by older platforms, whilst also taking the opportunity to
+rearchitect our driver to increase sharing across the drm subsystem, both
+leveraging and allowing us to contribute more towards other shared components
+like TTM and drm/scheduler.
+
+This is also an opportunity to start from the beginning with a clean uAPI that is
+extensible by design and already aligned with the modern userspace needs. For
+this reason, the memory model is solely based on GPU Virtual Address space
+bind/unbind (‘VM_BIND’) of GEM buffer objects (BOs) and execution only supporting
+explicit synchronization. With persistent mapping across the execution, the
+userspace does not need to provide a list of all required mappings during each
+submission.
+
+The new driver leverages a lot from i915. As for display, the intent is to share
+the display code with the i915 driver so that there is maximum reuse there.
+
+As for the power management area, the goal is to have a much-simplified support
+for the system suspend states (S-states), PCI device suspend states (D-states),
+GPU/Render suspend states (R-states) and frequency management. It should leverage
+as much as possible all the existent PCI-subsystem infrastructure (pm and
+runtime_pm) and underlying firmware components such PCODE and GuC for the power
+states and frequency decisions.
+
+Repository:
+
+https://gitlab.freedesktop.org/drm/xe/kernel (branch drm-xe-next)
+
+Xe – Platforms
+==============
+Currently, Xe is already functional and has experimental support for multiple
+platforms starting from Tiger Lake, with initial support in userspace implemented
+in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well as in NEO
+(for OpenCL and Level0).
+
+During a transition period, platforms will be supported by both Xe and i915.
+However, the force_probe mechanism existent in both drivers will allow only one
+official and by-default probe at a given time.
+
+For instance, in order to probe a DG2 which PCI ID is 0x5690 by Xe instead of
+i915, the following set of parameters need to be used:
+
+```
+i915.force_probe=!5690 xe.force_probe=5690
+```
+
+In both drivers, the ‘.require_force_probe’ protection forces the user to use the
+force_probe parameter while the driver is under development. This protection is
+only removed when the support for the platform and the uAPI are stable. Stability
+which needs to be demonstrated by CI results.
+
+In order to avoid user space regressions, i915 will continue to support all the
+current platforms that are already out of this protection. Xe support will be
+forever experimental and dependent on the usage of force_probe for these
+platforms.
+
+When the time comes for Xe, the protection will be lifted on Xe and kept in i915.
+
+Xe driver will be protected with both STAGING Kconfig and force_probe. Changes in
+the uAPI are expected while the driver is behind these protections. STAGING will
+be removed when the driver uAPI gets to a mature state where we can guarantee the
+‘no regression’ rule. Then force_probe will be lifted only for future platforms
+that will be productized with Xe driver, but not with i915.
+
+Xe – Pre-Merge Goals
+====================
+
+Drm_scheduler
+-------------
+Xe primarily uses Firmware based scheduling (GuC FW). However, it will use
+drm_scheduler as the scheduler ‘frontend’ for userspace submission in order to
+resolve syncobj and dma-buf implicit sync dependencies. However, drm_scheduler is
+not yet prepared to handle the 1-to-1 relationship between drm_gpu_scheduler and
+drm_sched_entity.
+
+Deeper changes to drm_scheduler should *not* be required to get Xe accepted, but
+some consensus needs to be reached between Xe and other community drivers that
+could also benefit from this work, for coupling FW based/assisted submission such
+as the ARM’s new Mali GPU driver, and others.
+
+As a key measurable result, the patch series introducing Xe itself shall not
+depend on any other patch touching drm_scheduler itself that was not yet merged
+through drm-misc. This, by itself, already includes the reach of an agreement for
+uniform 1 to 1 relationship implementation / usage across drivers.
+
+GPU VA
+------
+Two main goals of Xe are meeting together here:
+
+1) Have an uAPI that aligns with modern UMD needs.
+
+2) Early upstream engagement.
+
+RedHat engineers working on Nouveau proposed a new DRM feature to handle keeping
+track of GPU virtual address mappings. This is still not merged upstream, but
+this aligns very well with our goals and with our VM_BIND. The engagement with
+upstream and the port of Xe towards GPUVA is already ongoing.
+
+As a key measurable result, Xe needs to be aligned with the GPU VA and working in
+our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
+related patch should be independent and present on dri-devel or acked by
+maintainers to go along with the first Xe pull request towards drm-next.
+
+DRM_VM_BIND
+-----------
+Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
+fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
+development of a common new drm_infrastructure. However, the Xe team needs to
+engage with the community to explore the options of a common API.
+
+As a key measurable result, the DRM_VM_BIND needs to be documented in this file
+below, or this entire block deleted if the consensus is for independent drivers
+vm_bind ioctls.
+
+Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
+Xe merged, it is mandatory to enforce the overall locking scheme for all major
+structs and list (so vm and vma). So, a consensus is needed, and possibly some
+common helpers. If helpers are needed, they should be also documented in this
+document.
+
+ASYNC VM_BIND
+-------------
+Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
+Xe merged, it is mandatory to have a cross-driver consensus and understanding how
+to handle async VM_BIND and interactions with userspace memory fences. Ideally
+with helper support so people don't get it wrong in all possible ways.
+
+As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
+various flavors, error handling and a sample API should be documented here or in
+a separate document pointed to by this document.
+
+Userptr integration and vm_bind
+-------------------------------
+Different drivers implement different ways of dealing with execution of userptr.
+With multiple drivers currently introducing support to VM_BIND, the goal is to
+aim for a DRM consensus on what’s the best way to have that support. To some
+extent this is already getting addressed itself with the GPUVA where likely the
+userptr will be a GPUVA with a NULL GEM call VM bind directly on the userptr.
+However, there are more aspects around the rules for that and the usage of
+mmu_notifiers, locking and other aspects.
+
+This task here has the goal of introducing a documentation of the basic rules.
+
+The documentation *needs* to first live in this document (API session below) and
+then moved to another more specific document or at Xe level or at DRM level.
+
+Documentation should include:
+
+ * The userptr part of the VM_BIND api.
+
+ * Locking, including the page-faulting case.
+
+ * O(1) complexity under VM_BIND.
+
+Some parts of userptr like mmu_notifiers should become GPUVA or DRM helpers when
+the second driver supporting VM_BIND+userptr appears. Details to be defined when
+the time comes.
+
+Long running compute: minimal data structure/scaffolding
+--------------------------------------------------------
+The generic scheduler code needs to include the handling of endless compute
+contexts, with the minimal scaffolding for preempt-ctx fences (probably on the
+drm_sched_entity) and making sure drm_scheduler can cope with the lack of job
+completion fence.
+
+The goal is to achieve a consensus ahead of Xe initial pull-request, ideally with
+this minimal drm/scheduler work, if needed, merged to drm-misc in a way that any
+drm driver, including Xe, could re-use and add their own individual needs on top
+in a next stage. However, this should not block the initial merge.
+
+As a key measurable result, the handling of the long running jobs and the minimal
+scaffolding should be documented here or in a separate document pointed to by
+this document.
+
+Display integration with i915
+-----------------------------
+In order to share the display code with the i915 driver so that there is maximum
+reuse, the i915/display/ code is built twice, once for i915.ko and then for
+xe.ko. Currently, the i915/display code in Xe tree is polluted with many 'ifdefs'
+depending on the build target. The goal is to refactor both Xe and i915/display
+code simultaneously in order to get a clean result before they land upstream, so
+that display can already be part of the initial pull request towards drm-next.
+
+However, display code should not gate the acceptance of Xe in upstream. Xe
+patches will be refactored in a way that display code can be removed, if needed,
+from the first pull request of Xe towards drm-next. The expectation is that when
+both drivers are part of the drm-tip, the introduction of cleaner patches will be
+easier and speed up.
+
+Drm_exec
+--------
+Helper to make dma_resv locking for a big number of buffers is getting removed in
+the drm_exec series proposed in https://patchwork.freedesktop.org/patch/524376/
+If that happens, Xe needs to change and incorporate the changes in the driver.
+The goal is to engage with the Community to understand if the best approach is to
+move that to the drivers that are using it or if we should keep the helpers in
+place waiting for Xe to get merged.
+
+As a key measurable result, we need to have a community consensus documented in
+this document and the Xe driver prepared for the changes, if necessary.
+
+Xe – uAPI high level overview
+=============================
+
+...Warning: To be done in follow up patches after/when/where the main consensus in various items are individually reached.
-- 
2.39.2

