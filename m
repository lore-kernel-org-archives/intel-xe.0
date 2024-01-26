Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99632C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C6E10FE5F;
	Fri, 26 Jan 2024 20:30:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E4610FE5F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301056; x=1737837056;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=OC500qZ9Ma8NQNhIu+FXjq8Qqsvx7x5IXvBnEmnku9w=;
 b=PqabFSn5SN23OYGQep0ILn1iXGFC2Mxaa4VCdVEr3O9fmu1IzLztc4ve
 a6OX32Fea5q+sKCmDjzHK64ufI6Eix+vL9o2zbkxSLtq9Vi+ZdTBsNjWe
 wL9Q7ICaY0EDWeqsZQ++qndwUjlk7Zy1IXzM6vigpz3D6jFvOLlEhp2qD
 SCM9RrWhDjbv4loT0TYb0McsJRnCzNlmB28FveXk91wcmCGJ9bKmO6tqM
 FIDbOOeC/1njd3KimL2hMzVlQOJAKI+FVYFRBnQE89NxvnAMIukenjmqk
 7eeSIvBa/pn/TTGE6zgCYbZPjRed0D+SuV+vm/BvbsNQzkQ1NVeftCn8i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948047"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948047"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:30:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877481566"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877481566"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:30:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:30:47 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:30:47 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:30:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFZrh2ajAUm1lYEKHuM7tAjllEF7mCX7LdRqT0mG8i6E3QwMmn0HKywygJO00FoycwOtGhgEb/W8VBgxIAFm7JRQRkhg+IQT3b5NxN3JJad4tEysldMXAvVp9cXbitnJuDkfRoqdv9dJEGh/MBTQ40pjcxz995dhfKz068cxZS9HE2DiI03twRnVNnCcjc1E0wudKD1vocFOWiJ04M1N20yrC0Amp+EZqczC0esBdYxREtaHC4JJDTsPBGpWy3hjJejJU5s+RAy1IQyofpbwaSZZRBeHMAfQjFutcfvseVzuYNgX3gHowXnlAsE283TtI8v9Kr2uCjqgiV/mm4pZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1B5iVYUmg4lCmB5mZdkFVb+IMwnYJmOIMWdmQRLpKWo=;
 b=YN+L8IfvfvPdzX3jCtOa4/jnhVOBoz5Ao4qXL62HSdJuoR4ozE6+mppSuOK9fkPyWl22jLSi4UAVS3vwlalfxUJhhO8lRv3wYkuWQrzLWCn1qZYqvtA6MwfX54ciTd3oR+TFOyn8qj58/icXtMiyxTLZeq1lIHZ/MlyLrCucphsMexUBXcZCR5cxD18NizKfCXOEEFsStdp9RmfdZ0VmfKtJsHeou5KFeAbZW5p04UNN9OELt3DaqWCmS+mRveefswtnCI0sTswM+vZrMOh6hODT87qu74rBgERHczxzw0GjpASayoPS3s72FAtsrGLDETq9bfzq+pMWN5wUsXwRaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Fri, 26 Jan
 2024 20:30:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:30:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 00/34] Kill mem_access v2
Date: Fri, 26 Jan 2024 15:30:09 -0500
Message-ID: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9c2eb6-bb6b-4572-036f-08dc1eadacd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sfs61Os59l6IpOTVgIKut3H7ouvcerFxDQ5toJuvxeqfnd5flHeay4X+X7jhZhOzMb2NB/2WJbhbY2aie4KW1sTtM56CghQcjb3AUURLR92SHjlF0s6/B/zEYrZfzcSUVXaKGgPwmPBgw7fEHb53vVkd1j8ak52PfNEiHQCLXwB0pRGpTe1xsGWt/x+SzNJ/gjAdIgrBEvZ3pv+I6rYbRA/Rpt4jiVE/jcurdxIjvQW4po4+irkeuRBnvI2iVl7Ls1siEHM9DOhes9OawDKlv2gd8V60UrdNh3a6lbnoYuC0JnGY7z3Nf6Y8/auRu/Zn9JmaJ5Axe4wOFpks6nFkQQaiL9VyAC0LE+BthP/tMa3EPMzPpFg1rpj8TgtPBWDZ3rMVrwHxfW8lsZM9yq0LAikUB72ivxoIbCY4uxgP6x6G3km5FeeZJfDakPr1XfrtA5whWzNtKq9QWLo9mHVwS33SqqDkxThPH8q3xqokoaxspE/gIO6bYTsqKtYWiWHq8nKjYSEJhleoZyNQCzXWrAcp3UfiLgZEg49LXGRJnwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(41300700001)(83380400001)(26005)(107886003)(6512007)(66946007)(1076003)(38100700002)(5660300002)(44832011)(6506007)(2616005)(2906002)(4326008)(8936002)(66556008)(8676002)(66476007)(6666004)(478600001)(316002)(6916009)(36756003)(6486002)(82960400001)(86362001)(66899024)(84970400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1c0RUJiQXIzemFuZVkwV2hnVkF0THk5ajVIeHpYdXJpR0F0UitQcTUzNGx1?=
 =?utf-8?B?cng2ZmhwK2Uwa2VESHRTTlRtcmllb0FlU0V1VTZvNXRmcFZqUHZwc0JiS1ZL?=
 =?utf-8?B?aWx6OTBLSlkzQVlQbUpmZmlwRkNpSmt3MHRHZlZPeEoyeWpNRlFVSGl4K3p4?=
 =?utf-8?B?YVhuOGVUenlHcGk5dlJNT3NYdmNkVC9DYW4xb0xQNkJsMGpQRWF0YU5SbDNs?=
 =?utf-8?B?blllM2JLd2JBVmtmbkZwRG55L2s2K1E4VkZNOU0ya3VoZWVFNjJ2Sndqc1J6?=
 =?utf-8?B?dTNOOGxlZnVGRUJ3Wk54OS9jM2pBYmw4dkpJL1RKNy9kL3Nnd3BBWjU5SjhR?=
 =?utf-8?B?b1pYSGlCaHFjL1NQZWVtVXUvalRlSkdMWWxEMGQxSG1pMmtocTBLdzlUcGMw?=
 =?utf-8?B?T1E5UndJeEkwbGo0ZFE1VFB0b3BWMU15WUV1NEo0NEoydnBzVE5nTFZEMUpF?=
 =?utf-8?B?cktiTWUxS0xnUWd0d2YxYTRIS3EzdFc5MjlBek5vQlhnZFdtRnJJUHY2clZX?=
 =?utf-8?B?YW9wU1ZNVkE0OVAxL2l5SmNOanJNWnQwM3ZrWTFodk1FM3d0dkNxak13RnJG?=
 =?utf-8?B?YWxuNFc0NnpoNkRHOEkxbG9GaTlleHdnRUx4UUpaK3ZxSTFSQU9vMXNjdVBF?=
 =?utf-8?B?Z2Y4NVBGTndHSWdMNm9qUHJqYWZ6ZzlpTmRHcFgzRnArR1ZEVXd0d0FDaVlL?=
 =?utf-8?B?V3oxL0FKM2RXdTZpWEhaNEordHgwOVk4Y0tEU2VUZ0xma3NpSFpOTXA3TUc4?=
 =?utf-8?B?TGhyVisyMk9xYm44K3dkaXlkVVVJWTM2S1J2WklubDZTYWgrU0g4b0FRNlJk?=
 =?utf-8?B?N2pNdGtJQlRoWldncEpJZVZ1cXgzcXR4YmlwQ2V6R0luZ3Faak16VFFsRURI?=
 =?utf-8?B?SXNPRDZOQnh2Yy91ZU1MTXpPdC9vMTNvYk9GNDJlTjBSdTdmZCtaQlRyYTJy?=
 =?utf-8?B?b3ZlUE80RHp0eXg3SVVXUFFRZ3JUdFlKeHhMSjQ5VjVTQTF5Q3gvcjhIRmFq?=
 =?utf-8?B?a3lCamJjVytNRkN5aWN1bTFGRGt6N2V0SzltZUlQS1loYXZZdjVaUTNYVmpo?=
 =?utf-8?B?MGhZNGJ3YlZxOFU0UUJ5UkR4djJockd6RDc1Qy9hVEF4QytLWlg1bnRzWU1R?=
 =?utf-8?B?SEkrVzY1UXVBenQ0OGtOMjZlMUJHMFZwNDZXc3h1THFJS2JTUVBJcDB6M3Zj?=
 =?utf-8?B?TGMxZGY4UU4yL3Y3TmYzOG11WUlBT1RmdTk5VTQxMk9pVlFRNlg0QWc5NzVI?=
 =?utf-8?B?YzJuWEFjVmhaOHlpbWtxNjR6YldscEVMSjRabkZJeVNyYTdGdWsxYW5YbTlK?=
 =?utf-8?B?NXFqT3FieXBSWHpxbnJ5Ny9PZWdMNlA5Q2lFZ1BGcDJGOWtBNXRMZHFRT1cy?=
 =?utf-8?B?TXUxZkNhU3pGV0owemlYMWI0ekMrdUZydUJ3Y3BONFlKWCt0bWFXWGdpVGo0?=
 =?utf-8?B?c2MwVVhmSkY1UUJWdkE4T0Z5VGRNMk91RjliOGR4bTQ0Y0VFaVdsVWwxN2ZY?=
 =?utf-8?B?N1J5RmlYWDU4UkdZV1IrTmYwLzcxNnhUOUcyR3FZaG54eGpTS2xqdDdSb09K?=
 =?utf-8?B?eE1nOWVwZmVzU3RZcjhYRm4zL05uQUpsSjN3RHJVTEdieS8vem5GRlBwYldt?=
 =?utf-8?B?ZWk5aHk4L1g0R0pXMWI0NEE5MWZBUjA4THpXQTVkOGFzVWwyQXZhNDFCZG1m?=
 =?utf-8?B?Nm9mWG1IbnBVMldCK0Y1MnI4cnkyWVVUeFd2QkFwUlgrcGZQVnk1WkNUWDg5?=
 =?utf-8?B?R1VrOWZONWoyQ3pycG42T3FXb2dKZ08xSUdQYkVpeW00bGI3RVhWRzljV1hi?=
 =?utf-8?B?VGtReVAwUW9pRFFaSGZvTVk4RjVjQjI2d2VYQzFxdWlocmppaDBUcWx6d0or?=
 =?utf-8?B?enlYbzBGTkdsWkZ5K2pzUzJ0YzZ6aEtueGExd2hEMGg0MjRhY1UyM3dhMlZW?=
 =?utf-8?B?TkkwZ2tOYU13OFJhdEIrb25EUVFQOFVQWHplU0k4dzNqd2thZjZLb2sxUVdP?=
 =?utf-8?B?aDdxNUF3SVB5OFAwYitUSUVxcUFWUlB4eUEvdVZjT0dIa014c25lWFBRQ0xZ?=
 =?utf-8?B?UW9OWERCMENPZ0VPNEtydUtsMWU4eXBFb2xCMWRJZHlwQnNwd2dLb1V2bTly?=
 =?utf-8?Q?U5h+hdLs7NvnG9Z6/x/sIzVWA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9c2eb6-bb6b-4572-036f-08dc1eadacd4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:30:45.9702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuZZ+FwkDQwKEFd5ZyWBDKTKVBIiKTBB81IfFAd/q/aWOAH3Kt7mkWZDi8wia5gOUuV5FALXa1wvzZ+xGHKhAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi all,

First of all, thank you so much for the good feedback and ideas on the
v1 of this RFC series:

v1: lore.kernel.org/all/20231228021232.2366249-1-rodrigo.vivi@intel.com

First of all, this v2 has a more organized/split patches. So I'd like
to ask you to start the reviews of the simple ones already, so I can
try to split the series and merge a little by little.

I have 2 pending issues on this series that I couldn't solve yet.
Matt Brost is already helping me on these, but any help is welcomed.

But as I told, I'd like to start the review of the simplest ones first
anyway, please!

Details of the current issues:

1. Underflow on a gpu-hang test coming from d3cold. The culprit is the
pm_runtime_{get,put} around g2h_outstanding.

[  476.450482] [IGT] xe_exec_threads: starting subtest threads-hang-basic
[  476.507039] xe 0000:03:00.0: [drm] Engine reset: guc_id=78
[snip]
[  476.518814] xe 0000:03:00.0: [drm] Timedout job: seqno=4294967169, guc_id=78, flags=0x8
[  476.524595] xe 0000:03:00.0: [drm] Engine reset: guc_id=78
[  476.532615] xe 0000:03:00.0: [drm] Xe device coredump has been created[  476.801805] [IGT] xe_exec_threads: finished subtest threads-hang-basic, SUCCESS
[  476.808391] xe 0000:03:00.0: Runtime PM usage count underflow!
[  476.813455] [IGT] xe_exec_threads: exiting, ret=0
[  476.819146] xe 0000:03:00.0: Runtime PM usage count underflow!
[  476.829816] xe 0000:03:00.0: Runtime PM usage count underflow!
[and on, and on]

2. Failing rmmod due to an invalidation that happens at xe_pci_removal
(a case that fails only coming from D3cold and with display_enabled, but
on idle/blank-screen)

[  326.857464] xe 0000:03:00.0: [drm] GT0: resumed
[  327.135455] show_signal_msg: 126 callbacks suppressed
[  327.135467] gnome-shell[2488]: segfault at 0 ip 00007fad50e315cc sp 00007ffd6f04a360 error 4 in libmutter-clutter-11.so.0.0.0[7fad50dbd000+97000] likely on CPU 15 (core 28, socket 0)
[  327.157020] Code: e9 6f ff ff ff 66 0f 1f 84 00 00 00 00 00 48 8b 05 49 12 07 00 48 85 c0 74 4c 48 8b 38 e8 fc 49 f9 ff 48 89 c5 e8 14 75 f9 ff <48> 8b 55 00 48 8b 92 d0 00 00 00 48 85 d2 74 07 89 c6 48 89 ef ff
[  328.160905] xe 0000:03:00.0: [drm] Xe device coredump has been deleted.
[  329.099696] pci 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation time'd out, seqno=1668, recv=1667
[sip]
[  329.312763] ------------[ cut here ]------------
[  329.317417] pci 0000:03:00.0: [drm] Assertion `ct->g2h_outstanding == 0 || state == XE_GUC_CT_STATE_STOPPED` failed!
               platform: 7 subplatform: 4
               graphics: Xe_HPG 12.55 step C0
               media: Xe_HPM 12.55 step C0
               tile: 0 VRAM 8.00 GiB
               GT: 0 type 1

Thanks in advance,
Rodrigo.

Rodrigo Vivi (34):
  Revert "drm/xe/uc: Store firmware binary in system-memory backed BO"
  drm/xe: Document Xe PM component
  drm/xe: Fix display runtime_pm handling
  drm/xe: Create a xe_pm_runtime_resume_and_get variant for display
  drm/xe: Convert xe_pm_runtime_{get,put} to void and protect from
    recursion
  drm/xe: Prepare display for D3Cold
  drm/xe: Convert mem_access assertion towards the runtime_pm state
  drm/xe: Runtime PM wake on every IOCTL
  drm/xe: Convert kunit tests from mem_access to xe_pm_runtime
  drm/xe: Convert scheduler towards direct pm_runtime
  drm/xe: Runtime PM wake on every sysfs call
  drm/xe: Ensure device is awake before removing it
  drm/xe: Remove mem_access from guc_pc calls
  drm/xe: Runtime PM wake on every debugfs call
  drm/xe: Replace dma_buf mem_access per direct xe_pm_runtime calls
  drm/xe: Removing extra mem_access protection from runtime pm
  drm/xe: Convert hwmon from mem_access to xe_pm_runtime calls
  drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
  drm/xe: Remove pm_runtime lockdep
  drm/xe: Stop checking for power_lost on D3Cold
  drm/xe: Convert GuC CT paths from mem_access to xe_pm_runtime
  drm/xe: Keep D0 for the entire duration of a LR VM
  drm/xe: Ensure D0 on TLB invalidation
  drm/xe: Remove useless mem_access protection for query ioctls
  drm/xe: Convert gsc_work from mem_access to xe_pm_runtime
  drm/xe: VMs don't need the mem_access protection anymore
  drm/xe: Remove useless mem_access during probe
  drm/xe: Remove mem_access from suspend and resume functions
  drm/xe: Convert gt_reset from mem_access to xe_pm_runtime
  drm/xe: Remove useless mem_access on PAT dumps
  drm/xe: Remove inner mem_access protections
  drm/xe: Kill xe_device_mem_access_{get*,put}
  drm/xe: Remove unused runtime pm helper
  drm/xe: Enable D3Cold on 'low' VRAM utilization

 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   8 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   7 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   8 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |   7 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c            |  14 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  10 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |  13 +-
 drivers/gpu/drm/xe/xe_device.c                | 129 ++++------
 drivers/gpu/drm/xe/xe_device.h                |   9 -
 drivers/gpu/drm/xe/xe_device_sysfs.c          |   4 +
 drivers/gpu/drm/xe/xe_device_types.h          |   6 -
 drivers/gpu/drm/xe/xe_display.c               |  22 ++
 drivers/gpu/drm/xe/xe_display.h               |   2 +
 drivers/gpu/drm/xe/xe_dma_buf.c               |   5 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  19 --
 drivers/gpu/drm/xe/xe_ggtt.c                  |   6 -
 drivers/gpu/drm/xe/xe_gpu_scheduler.c         |   8 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h         |   3 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h   |   2 +
 drivers/gpu/drm/xe/xe_gsc.c                   |   5 +-
 drivers/gpu/drm/xe/xe_gt.c                    |  21 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |  53 ++++-
 drivers/gpu/drm/xe/xe_gt_freq.c               |  38 ++-
 drivers/gpu/drm/xe/xe_gt_idle.c               |  23 +-
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     |   3 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |  79 +++----
 drivers/gpu/drm/xe/xe_guc_ct_types.h          |   2 +
 drivers/gpu/drm/xe/xe_guc_debugfs.c           |   9 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |  62 +----
 drivers/gpu/drm/xe/xe_guc_submit.c            |   2 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c           |   5 +-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  58 ++++-
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   7 +
 drivers/gpu/drm/xe/xe_hwmon.c                 |  25 +-
 drivers/gpu/drm/xe/xe_pat.c                   |  10 -
 drivers/gpu/drm/xe/xe_pci.c                   |   2 +-
 drivers/gpu/drm/xe/xe_pm.c                    | 223 +++++++++++++-----
 drivers/gpu/drm/xe/xe_pm.h                    |  16 +-
 drivers/gpu/drm/xe/xe_pt.c                    |   3 +
 drivers/gpu/drm/xe/xe_query.c                 |   4 -
 drivers/gpu/drm/xe/xe_sched_job.c             |  12 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  10 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c            |   1 +
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           |   5 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |   4 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  10 +-
 46 files changed, 565 insertions(+), 409 deletions(-)

-- 
2.43.0

