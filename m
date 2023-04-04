Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C2DC6FD1D
	for <intel-xe@archiver.kernel.org>; Tue,  4 Apr 2023 20:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0119110E797;
	Tue,  4 Apr 2023 20:22:58 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C0B10E797
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Apr 2023 20:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680639776; x=1712175776;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OCQC6rmori9HqXeEiDUxpYZPxxoSiR9UjnAItknhyWU=;
 b=JWc+QYqvsZduc1P5G0rCpYX3eZgDMlHJv86OkS/a+Nrp/7a7ltAgNtOy
 cmcI8R1C6psTiWvEuZ35ecV+tb5ZNHB+49uMwIRLgwEEvyd3PkKFh66ra
 pUKPOlfNIvRcTLlule62clQ3wX4txX/Omnyqdgen+swP++v0Wn3jnrlqa
 DiGDx18gfukbmBMz/Z9hz5QRdrGaoF3F4/nPdVJ7DXwrUe9fw6TosdTU4
 J8FfSXgfpwtRgN+Lg6AgsNJBVRbNVbVaANR6A+857IO0Qp2tL0O8M3ftf
 5uFH25tPUr5mOhnmUl4sQyV5o0GAAT2fCweAxxxftIW9u3qTztJ1lz6y1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="341021078"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="341021078"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 13:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="686503189"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="686503189"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 04 Apr 2023 13:22:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 13:22:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 13:22:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 13:22:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 13:22:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMwh3lZ1D16PM76+Pv+uHF18ajtCauWZdxJsSVlFWX6ssp27nDbrG2FbJJiZkpMznI/5xBIT8yUvqpW8jhp13qY9Gu2bo97aTdf0EPzYvpPijwZd1sIubK/T3hxTYMwKNsbA3iytwjChdQRb4k4M4SiqFxMEJpsk1rYKXECyluHKEow8DzuaYmUCKgmt1EvtvupSnJbSy7WtWKAebt5pbsnh1/+qpuipCoO4HFKu429TN7P56MsHgq8Wp3hef1hPabzyQ3NKGUgE6Vy8ofCpbl7Z8+LuAWIEfRfomvRRFgF1dtEcXu1AOJfn8PRccyOUqGV9lDK5VFS+gGU2QK5bxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvzmRQn8uTmdIlWM+uKz7pMmsOK6KNzsCNDwO+jXL90=;
 b=ZeFGo1cs7QsJGxX5hkfTrnphaZ9cAauQD1hiFeZ+xOSnzsfX39/rM5w58AyhIp6oHGFbpoaAtYeOhjIsVHVe/AGvnO325XaVvJSRTPurTeVe2aA4Y+ek5k2N6+Y5ad8oGremt0E3RW5zjN4swd8Y7jyjM9eOx8KFzDBlX4vLt+U8RPSxt3io2TEdzKrTXrTs9TJOdVc0CtV1iawl+jfAZMQERKbRrmtS+nncFYLwfOlguCDNwctHSOVec3ifnUrMJLV3z4RRw6QiWZX6ud2uOuvbRLD5jESW0yKKx13SrcN4bIJRa6cFnzfB0XEl69Zeb6eQS4Q5BzM5qabdbtkPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 20:22:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 20:22:52 +0000
Date: Tue, 4 Apr 2023 13:22:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230404202249.t4rn476e7uv2767q@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230403222031.4255-1-yu.bruce.chang@intel.com>
 <20230404184839.qlbwgv7lvvbi76i4@ldmartin-desk2.lan>
 <ZCx+Qfwr7KSaKGiw@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCx+Qfwr7KSaKGiw@intel.com>
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN6PR11MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf3d048-2e15-4634-2203-08db354a5db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3NpbOzQOKXwzOxjAC3Wmt+sVNvGX7hNNxxjS87qNkh5LmInQuKeDqfO7z9xmZW27Rq7sRdKyFF4fnK0+xFJTLE6n4uqjKXIsrywZr5Hp42eJHA6cAi5oSlOuVA/+4kNfBb3jvFD4BdvHotai23VwwYGa6p/w8E35Lh4XTPiDg1i6Dyl6htoxEmun0dGBt6qG+yYPVm7OZ4twC4nlbvpeHWCX3eQOu7IQ89BBm14QzhH2F5ygXUbFsvA71bDK/ybGTM8LOCQbH0dSyhi+ZOHE2er7B+KlKt9X/Zm6MTIWRdNd85l7FvF5czbtFAN7bOY+pXMwiQDWsLTLnQFWqLRh6dJOECwlFioqxxzQdfpnMHWqlEMcm1o1ciIR0LFYR8er4dfyeSmoJMTRV8aeaRIjFEkDJhdt3k7h1kbcapWg2aWc1Zf6y1ym63dRFkSMlLBIGGSIw22Hlqnzk2peqgsUcWYPF08ooftd4G9ve5VP+umtJV3WlZ1/rf8FTd7zkPwF05dgbaldYH21MmFKsw686Ii7fdkYav3KuDEP7yomNhL1St/QnHEOyIsf3YD/f4kq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(9686003)(26005)(186003)(6666004)(83380400001)(6506007)(82960400001)(41300700001)(8676002)(478600001)(1076003)(4326008)(316002)(66946007)(66556008)(66476007)(6486002)(6636002)(38100700002)(36756003)(6512007)(86362001)(2906002)(54906003)(8936002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVUzNnhTRzJTbFNUK0dlVURnMWc3NmFrMEJsM0tlM044UGdVZWZIZDYwOWEv?=
 =?utf-8?B?N1lVcnhwOGdxQVJxbmVFTURtT3I5Mkp3akVtWlZnTThES3V0Wm1XS3czU2J3?=
 =?utf-8?B?YWxwZk1od3dYZElZMG9HbzJScTBUN3NlY0MwcEVwT25KUmJBNTVGRWxzc3c2?=
 =?utf-8?B?TEE4WkJGVXRpajFQNWVRM1cwK3NJNTVPblVUbmJUWU1zRHlzL09uS0lUL1BW?=
 =?utf-8?B?dTdDKzRJMFdLaDlIdlU0MGJrU0Z0d0RxTElIWFJCTnhHZXlRQVIyR0FGNlVL?=
 =?utf-8?B?bVhmWk5xWDQ2cGZTclRrZktkREFYZDZWQ0ZRUDR5aWluUGlGSjcvNnRJUXpv?=
 =?utf-8?B?dmUzbVdoZVJsWWhISXVGb2lDQkp6Y0R2aGlYWUN1VnRGc3VRQXZDeG5iZkVw?=
 =?utf-8?B?QWRiV3p1eVNIVzRvbVR5SHhnbFBSSzcvclBENU1LM2tBRFRJWE80TzlzaDdO?=
 =?utf-8?B?SCtMWUtyM3JueTV0alRJa0IyUFlqUVpyY1g4NWNSRkNwb1FuYjN3UWJhRncz?=
 =?utf-8?B?YTNoMzRFcmxsVnVSMTQvYVB5U1VBTzVCSjJjNVNEQjlrR1NRa0w0Vk03dEgz?=
 =?utf-8?B?ZTNKNzRvMU96bzdGREU5VzkzUFJSN214RVlEZzd1QytJUXlyQ2dwRWZNTGRI?=
 =?utf-8?B?M0hyTUpMeXJ4QUJFa3JUNlpGMUF2eGd3em5uNCthR1pMWDJ3NjJWczlKajRX?=
 =?utf-8?B?UFlpT29lczFIeWxuaFhmdjFYZ2U4OG5YMWMzYkVLRjhHZWZRTHdpT0NtaVhW?=
 =?utf-8?B?NzBTOG9OV2NKWlFQanJMK1I1eWtFY1E0NDI0WGZ6S1phSXFudXFhWkdqSThC?=
 =?utf-8?B?VWxCR1R1Tzd6dzh0TndOeHk5a2l5U2c0VHUxOW5CWkNQMkkyRHFNWXd0empZ?=
 =?utf-8?B?T1lnc01BNzVTcmgyYnVYZUpoL0Z3cTJQMU0xYk5pK2ZjZHI4VmhwbDBnQ2Nw?=
 =?utf-8?B?bklWcDBwcTVSQWN2MnBZYUw5SEpGelFjN1E2QXQ0WFFlZW5nZk1ZY043U2Qz?=
 =?utf-8?B?R3ZpVjNCdGxDbDFvTUtFRU5nMlJwS2lYdHRzeWJTcXdaaXJTOUNEa2xuSzU4?=
 =?utf-8?B?OEVNc3hXTGlkQzErY1NGMWdIN2xnVTB1dU52ZVJoTUsvejNTRHloYjhUSzVt?=
 =?utf-8?B?WlBnYThTU1hBUWpQald1YStJeTdMQWpKMThrbkNVcTBZMzV6QjU0UlRtNktv?=
 =?utf-8?B?NDdHYzF3aHVzQ3p6WVBhY1Z5NmVTZ2hHUkFiTGk2ZSt5MFdRRVA2cHVCZENY?=
 =?utf-8?B?bk1xci84OVZ0K3BtK1FYVERKUFRVL1dSYXd5NFRuRXI3aWEwbTIwQUVPUlRs?=
 =?utf-8?B?bkVjVWdTUzdoelczT0hWL1c2dHFVTEMzbEs3aUdjdit2T210MFh3RlF4aFI0?=
 =?utf-8?B?bS9KdlpJNFRhL21oMXhmRHBpNXI5c05nSFNLU29qRmU0cWNzd3lEOTNtUS9F?=
 =?utf-8?B?SDVqYnU4R0x3YUZTYVhra2pud2VSa2pWQmFpbldKUUtNdkV6MkRQVjM1REpv?=
 =?utf-8?B?SVZFRkFVeTl1YXlkMEZkNkVKcGp2ckloS21URmcwZFZWZENWU2dvbHZSQTBm?=
 =?utf-8?B?UENEczZ2NHpLekwvYUgyVGk1Q1JKeVBXM21ScnB5S2J4WGZrelhqbFJvMDZu?=
 =?utf-8?B?VVdUbjZ4Yk1zQ1A0QkJXWVdDVXQvbHpXYWNvVUpKTzh3Tkx4SW5DbnhQV0lE?=
 =?utf-8?B?UHNoemcwV2thQzllNnA3YXBRTEoyV1N5M0lIUWtpcnFSdEQ5K0JZbHlibGtT?=
 =?utf-8?B?N2hzd3ZWZXBYWWFKMDZRTGIwTDlqeTZsb1dvZEZCSDM2VWxEa1pheTIvcSth?=
 =?utf-8?B?MWZjVVRlMlMra1dIZC9vUUFaN01GdXovUlN0UXI4QmF1aHZDWHdMd2g1WEdH?=
 =?utf-8?B?eVNWSE5JSEQzdFlwYm9EYmdPVEF6OFFQbmpYMFZKTFhueUs1RVo3amdwdVVO?=
 =?utf-8?B?VWlLY1VTbTg0bll2S2N3Q3RqeTFBTG5MTXNZb3daOUxpMmhPTThFMmJSY0Rt?=
 =?utf-8?B?UGd0SzFHeHlpemxTbHltM0ZNaFMyRGFtT0RzSmxUNVpSNHB4U2JBT01KU0NT?=
 =?utf-8?B?b0NXUW9ST2U0VGRWOGUvOWQwOVdOa29zVWU0S0kyUGlTTSt4L3Z4eFQ0aFZj?=
 =?utf-8?B?Vk50QndjMEtoemVZdzF6eDAzckJ2eVZORm9aWG9Wdm10L0lHMWgvV2x0dENh?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf3d048-2e15-4634-2203-08db354a5db0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 20:22:52.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovyH7X0Plc6PsxBYZDXGjKRqES3z1enpSxEei9m3CiAL0r2UnOCHoZBdh9gzhZ0Y1OlnhcpKmivzvVCoxgMjOdc54LEYRyehGYthRuOg24M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8148
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix pvc unload issue
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
Cc: Stuart Summers <stuart.summers@intel.com>, "Chang,
 Bruce" <yu.bruce.chang@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 03:45:05PM -0400, Rodrigo Vivi wrote:
>On Tue, Apr 04, 2023 at 11:48:39AM -0700, Lucas De Marchi wrote:
>> On Mon, Apr 03, 2023 at 10:20:31PM +0000, Chang, Bruce wrote:
>> > Currently, unload pvc driver will generate a null dereference
>> > and the call stack is as below.
>> >
>> > [ 4850.618000] Call Trace:
>> > [ 4850.620740]  <TASK>
>> > [ 4850.623134]  ttm_bo_cleanup_memtype_use+0x3f/0x50 [ttm]
>> > [ 4850.628661]  ttm_bo_release+0x154/0x2c0 [ttm]
>> > [ 4850.633317]  ? drm_buddy_fini+0x62/0x80 [drm_buddy]
>> > [ 4850.638487]  ? __kmem_cache_free+0x27d/0x2c0
>> > [ 4850.643054]  ttm_bo_put+0x38/0x60 [ttm]
>> > [ 4850.647190]  xe_gem_object_free+0x1f/0x30 [xe]
>> > [ 4850.651945]  drm_gem_object_free+0x1e/0x30 [drm]
>> > [ 4850.656904]  ggtt_fini_noalloc+0x9d/0xe0 [xe]
>> > [ 4850.661574]  drm_managed_release+0xb5/0x150 [drm]
>> > [ 4850.666617]  drm_dev_release+0x30/0x50 [drm]
>> > [ 4850.671209]  devm_drm_dev_init_release+0x3c/0x60 [drm]
>> >
>> > There are a couple issues, but the main one is due to TTM has only
>> > one TTM_PL_TT region, but since pvc has 2 tiles and tries to setup
>> > 1 TTM_PL_TT each tile. The second will overwrite the first one.
>> >
>> > During unload time, the first tile will reset the TTM_PL_TT manger
>> > and when the second tile is trying to free Bo and it will generate
>> > the null reference since the TTM manage is already got reset to 0.
>> >
>> > The fix is to use one global TTM_PL_TT manager.
>> >
>> > v2: make gtt mgr global and change the name to sys_mgr
>> >
>> > Cc: Stuart Summers <stuart.summers@intel.com>
>> > Cc: Matthew Brost <matthew.brost@intel.com>
>> > Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> > Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/Makefile                   |  2 +-
>> > drivers/gpu/drm/xe/xe_device.c                |  2 +
>> > drivers/gpu/drm/xe/xe_device.h                |  1 +
>> > drivers/gpu/drm/xe/xe_device_types.h          |  2 +
>> > drivers/gpu/drm/xe/xe_gt.c                    | 18 -----
>> > drivers/gpu/drm/xe/xe_gt_types.h              |  2 -
>> > drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h           | 16 -----
>> > drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h     | 18 -----
>> > .../xe/{xe_ttm_gtt_mgr.c => xe_ttm_sys_mgr.c} | 67 +++++++------------
>> > 9 files changed, 31 insertions(+), 97 deletions(-)
>> > delete mode 100644 drivers/gpu/drm/xe/xe_ttm_gtt_mgr.h
>> > delete mode 100644 drivers/gpu/drm/xe/xe_ttm_gtt_mgr_types.h
>> > rename drivers/gpu/drm/xe/{xe_ttm_gtt_mgr.c => xe_ttm_sys_mgr.c} (52%)
>> >
>> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > index 669c7b6f552c..7e19a15af3dc 100644
>> > --- a/drivers/gpu/drm/xe/Makefile
>> > +++ b/drivers/gpu/drm/xe/Makefile
>> > @@ -83,7 +83,7 @@ xe-y += xe_bb.o \
>> > 	xe_step.o \
>> > 	xe_sync.o \
>> > 	xe_trace.o \
>> > -	xe_ttm_gtt_mgr.o \
>> > +	xe_ttm_sys_mgr.o \
>> > 	xe_ttm_stolen_mgr.o \
>> > 	xe_ttm_vram_mgr.o \
>> > 	xe_tuning.o \
>> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > index a79f934e3d2d..4fb9aff27686 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.c
>> > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > @@ -279,6 +279,8 @@ int xe_device_probe(struct xe_device *xe)
>> > 	if (err)
>> > 		goto err_irq_shutdown;
>> >
>> > +	xe_ttm_sys_mgr_init(xe);
>> > +
>> > 	for_each_gt(gt, xe, id) {
>> > 		err = xe_gt_init_noalloc(gt);
>> > 		if (err)
>> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> > index d277f8985f7b..d9d1b09a8e38 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.h
>> > +++ b/drivers/gpu/drm/xe/xe_device.h
>> > @@ -116,4 +116,5 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
>> > }
>> >
>> > u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>> > +int xe_ttm_sys_mgr_init(struct xe_device *xe);
>>
>>   CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
>> ../drivers/gpu/drm/xe/xe_ttm_sys_mgr.c:99:5: error: no previous prototype for ‘xe_ttm_sys_mgr_init’ [-Werror=missing-prototypes]
>>    99 | int xe_ttm_sys_mgr_init(struct xe_device *xe)
>>       |     ^~~~~~~~~~~~~~~~~~~
>>
>
>that's awkward... I didn't get issue here, not CI got it...

I enable W=1 every time I'm going to push so I get this kind of error.

We used to have it in the gitlab CI, but lost when migrated to the
mailing list.  I talked with Ryszard to setup CI to run
"dev-provided-checks" so we can enable this back and probably run some
more. Hopefully we can add it back soon.

FWIW these are the commands I use:

	alias m='make -j$(nproc)'
	alias m64='m O=build64'
	m64
	./scripts/config --file build64/.config --disable CONFIG_DRM_XE_DISPLAY && \
		m64 modules_prepare && m64 M=drivers/gpu/drm/xe W=1
	./scripts/config --file build64/.config --enable  CONFIG_DRM_XE_DISPLAY

which does the trick of "build everything, rebuild only xe.ko with
display disabled and W=1 (otherwise it fails), then move
CONFIG_DRM_XE_DISPLAY back on.

Lucas De Marchi

>
>>
>> couple of issues:
>>
>> 1) you moved the implementation to a new file and didn't include
>> xe_device.h, creating the build issue above
>
>I was wondering about gcc version, but this wouldn't be magic in older gcc...
>
>> 2) The decl shouldn't be here though. You need a xe_ttm_sys_mgr.h, just
>> like we have xe_ttm_stolen_mgr.h, xe_ttm_vram_mgr.h, xe_ttm_vram_mgr_types.h
>
>yeap, that sounds the way to go...
>
>>
>> Lucas De Marchi
