Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53A8C48260
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 14:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1EB10FB3D;
	Fri, 26 Jan 2024 14:47:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8823C10FB16;
 Fri, 26 Jan 2024 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706280425; x=1737816425;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JgZ5a/9km5sIoZfbr/RnN9t74xOGOtvf8MH7yRdhpCs=;
 b=j03kvsXYmKb+FyoodNjckdt97Vl7IfwlpcO7D9lv00FGuH5LPAX4Jit+
 1/XTRxxTN7bw+Yiy3+1PDKTYpH/FvxgqkKJd3r/anxPG39+zqdgtSZbJ6
 hYgVplYHIeZH5SFanuMiLmH6fJP5LErTCN3B65J/xeM2yUvzKuM9m09jV
 zP+go/0lA2RSe6++DC0eLZUdeno4VPKvlqPQ/3KZPpM9zEW+diskhmZ1m
 2/dHbkbJwOkwLK0FDzD1/UTZnb3tstCFZwqaasWSpHjhWsQLwqjPUdwmI
 /XWnu6gVnOyNCrLV3K093EVUo48oRDPoF06//mi2Y0fp94Ns+w1jqCYzJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="401345082"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401345082"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 06:47:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2757654"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 06:47:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 06:47:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 06:47:04 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 06:47:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7l9ZYs9jyGJW+Rndm2BeQ5xuuDIBnCkwyO7e4zwxjq7ByrLdQljrm0aPnDqjlBtuVGG4TOf1SFecrmJ3jvauLGTCwZbcXhLOswuWCcGXlGKnyt/6M1YbLkMYDT0nZMqht5O26SzjXy7fsFP+iuU9Y/9oBJ7o7l9LY/im7TzSzlnsqsS7Ay/Yszt1gTZ35JYnezA+SL3JmGn/4Z9tReDNVzgv6Riq7KkE8GNcuK+yto9XzPnv4TJ42VNkXw8JTLwBgdyJhrVtramV/w4yLekbowMOZjhWH38eKOtQ+Bu+Zt8r+aO7klhwnQHzMKB0PFHCNUABvZpMF8TWb8n8gDj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+sCAIH04iDPX7245BGxFMucBFG4Jr8ecLyigB7DYPE=;
 b=SnRhIfkoIgw8hdX1+s6rFXw55a1O+5pKornO80qwl8+JVf6eB7nhLInVZ6BrdBofxFS5lydG+RF2DjZetXqLYVE+oTo2r2m+CQVOc8P4qziew3CQgcKgrFtty/ba9T6RvvfSWt59cfecdl/PFEydgz0ZDc3LRtyWGuCI0yz9VeKdqUiUItNNQplzGOgiNd+trNXKFcOfyBDTes4V3nKEP/GrM56w58ZWh8sJol819mSLroDqIvXzSte658+1o8xZAclu2iKbB2kqO1ibR1uKPsP9joNWi/E+AA3AqFsUXnomzcZyWaTY4ST/NiyuVxTiYiFFVd+6Z/3bxEaUCnPvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6930.namprd11.prod.outlook.com (2603:10b6:510:205::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Fri, 26 Jan
 2024 14:46:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 14:46:58 +0000
Date: Fri, 26 Jan 2024 08:46:54 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: Re: [PATCH i-g-t 0/3] lib/kunit: Support writable filter*
 parameters of kunit module
Message-ID: <kiflqa7ksoazk52b7ffmzktapvtx3yayqqmqm6gulylvdu7mx3@dzp5fpbsblty>
References: <20240125165749.15599-5-janusz.krzysztofik@linux.intel.com>
 <o5um4wakpooxbxd5algtfpgqmwar5lb2dkahdrc5zkma3nvlul@j6jyzvai4aht>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <o5um4wakpooxbxd5algtfpgqmwar5lb2dkahdrc5zkma3nvlul@j6jyzvai4aht>
X-ClientProxiedBy: MW2PR16CA0016.namprd16.prod.outlook.com (2603:10b6:907::29)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8ed215-8a2e-4878-4187-08dc1e7da594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4hmOzqCAOUuDsm8AJQmpHTcbrojCaM9IxeTJv3Xze8g60eE6CqdOKJSOX9FSwG0weU/7I/8yxrvYcXcs4stecU0AJ2wfIM/tiYyqPW4XEvQhiwjP+ZvNJ1jLAEu7eR8E49imJow6B6ovJOq180ORt2aBXtxVRU0b3TXnAQYY3deF+CN/mkeasFpPv5jVWeBRRS7BVRoGao/+Bl1GKcEfUYBobo4FaxXvZthIpCXPA5Il/R3a6KBdVdBVS8GsMwXhSAHk1HkWPnwlpJAV1CGYxH68BBJmhF0VtK7Yqs0Ico7i1UN0u606zDMFrVz1+w9mIbfTWPvU3RHg1iMQmdMCM2gvqCE5QTmJV/KCqyXbuceQOcxl/1onUr6e3KJfcJcLBKhv41PyM7ilIkZfQ3r/t5tQUAVZc5MJ4io7FIleVy7ITW3Lc4lvqpp027qLuvwB9kFlub0i+WSSke67TRLJQNMH92kndZb+4ZRdKNpSTCsVW3T8I9pZm171Bb3DcgL82awxaNWZQbcJNt7kDNTeU0OHXYppMp/woJ/zCBqv4Ey5NEvlR7POx4bpOPmnkvAf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(366004)(396003)(376002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(41300700001)(82960400001)(8936002)(8676002)(38100700002)(4326008)(478600001)(6486002)(6506007)(86362001)(6666004)(6512007)(66476007)(9686003)(316002)(66946007)(66556008)(6916009)(33716001)(26005)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cRskyQQyR7xioltzpLQYYGXB0vpB3tsCd6TFMLY2gvYFr+7fg62puhELSlds?=
 =?us-ascii?Q?vbQeGYECHhEnBdfvxnimSGMtEugAYTbfVxTUVTGMWt+C1wWOYPopMYb98cs4?=
 =?us-ascii?Q?ciGIAlRusnY04kv3UA/IdhMUEzMBHdIhIP1Y1DCBJoRCN3qnx87XAE/stZ/I?=
 =?us-ascii?Q?1yZZsYK2+nzFAcsxZ0sNemd2ddIqfxTuKAMLgVSP3KW1HWupKeFXXPoN1qGk?=
 =?us-ascii?Q?9qAt1hcpP+ZyiJY1cmkq0DHINSenO/ajg3VtWkNatMvmQZ0e4HRx49Ff6Mv4?=
 =?us-ascii?Q?KIveOG4VRkjt4gjMuI5W/419agTNcVtf1Vz8LWKt1+Ond8oWILQqI7F2x39m?=
 =?us-ascii?Q?Zsw2cgHHyjAroM9SUHLCFF52EOYqGvMWE7PwUWvt//WsgHzmaia25vpU5nAJ?=
 =?us-ascii?Q?Fmreed6dY8eTK38IV21zcX0pfLTPAhfDdNTT21OPOzGXS9Tp+U9tvAw5lrWa?=
 =?us-ascii?Q?/i1/iXNixOPV85BXu2o9TjMZUFi386OMrS0XQCBQCLF9ZXcJRx0LTmxtZ0kv?=
 =?us-ascii?Q?lssxmldoR/nPYTCPSyImEdFbpiwlhCDVBjm7PyoMqKD2IB0p+5bVDXPe2hFY?=
 =?us-ascii?Q?RLWvLY5auqhhEqG4TTvTowX2KSsV4aOlMSQoMM8nYaJdRpWY6cxEPAEu/Yne?=
 =?us-ascii?Q?M1bDQm2VEHsUeLudRtcjLSFL1PqH2hIuIEtQesp7Ew6Rqd9KO/I0IQry5HW0?=
 =?us-ascii?Q?VSQb7zNjh2g6vBvcru8rLqiw+39WxKs9NDQxk1Iq8YzU1hq5ZwyTz80hS+n3?=
 =?us-ascii?Q?EELzzz60LOv6fAhWB1e+3xIg5EaYj5mNLvpFqqDTluMLvJQ7HVRRu5jHbkxw?=
 =?us-ascii?Q?wlelJGxcIfB/xORGzhCXU9Qc01zyiFJn1HVKDAqVHuDWNlT8dnzBQfIsVeiq?=
 =?us-ascii?Q?RtPpQG8NGQwwEt8qh09xWykgWBQHLF4NWXnd26AMPavuY0j5m4pTIBecfArV?=
 =?us-ascii?Q?Mg51+jT3MqGBM0PEFvcbxg9KJC5x0haIMgm9/K55qhNxEHoiurzzFeCGs9Xa?=
 =?us-ascii?Q?YRVbU80ej7bF7aT57DuQ/pd2rQVi60hwIbqilSNKkVWLlEa2fGNzW7BqDJMK?=
 =?us-ascii?Q?sVr+i4mHJ/p4IKxsEdUeaHSEr7lBRK+9x9QxTNRkcyBOhCvUymrfT7YUTLaz?=
 =?us-ascii?Q?riO9W1PaJSCkfbVKtlSKjFxR4KDH5dK57BPwrCftQ6/v5TAyT80lCWYS29fl?=
 =?us-ascii?Q?COwWninWjU/jFtEzrpIoLTREV60Um+LTZ5sJVJcy+XySTMEvv3wr6rscVwLY?=
 =?us-ascii?Q?yfODjjaTxhRUk6Ul3FTA3t4p75wnRuOgTeEXuAXuCG4LCNZO8W/SqJkV4tsF?=
 =?us-ascii?Q?kLwZ+qe8xj0Y9+WMeoVx84A8BcYBWhdqidng6jQccjdjUmH4mg8LhclEZU6Y?=
 =?us-ascii?Q?Uhmp0ah789Ajw7XZGfy1k8ZiqaY/gWsFGVXQ80YFxe1lGDKk+hAkQqEMVL4P?=
 =?us-ascii?Q?ZrGkfzSgo4fdvPdezVIC0aSVqAQBrTpdNf76INc+sjmM1doZqICSID4VKHse?=
 =?us-ascii?Q?/Rh2gWkqL8X98tcWsopsKfH3hn15adRWVIhqsocQGzHKCSpWtERAqboWH539?=
 =?us-ascii?Q?44uUKO12QaO9/rHznZU6ELInDAYl0nFr99r55Wlosta/PBFTu/B9CHI2UyWr?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8ed215-8a2e-4878-4187-08dc1e7da594
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 14:46:57.9523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FkBqhnYzL5RQhS3zjPWAtmYO4Jg61N+lddQCXg8gCxRZ4S92yph/m/qN6/Rv1uTuLqxKc/EN9Xx5mVPVUCcGMcF7otzM2bdH/lq47Kea1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6930
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 25, 2024 at 11:25:55AM -0600, Lucas De Marchi wrote:
>On Thu, Jan 25, 2024 at 05:52:09PM +0100, Janusz Krzysztofik wrote:
>>Instead of wasting resources on reloading the base Kunit module each time
>>a different set of filter parameters is needed, try to write the required
>>values to sysfs representation of those parameters.  If that fails (e.g.
>>on older LTS kernels with read-only filter parameters), fall back to
>
>we can't really execute anything on LTS kernel. I don't think think it's
>worth keeping the multiple fallbacks we have now.
>q
>I think trying to maintain compat is good, but I'm not sure it makes
>sense for these tightly coupled tests with the kernel.

I gave it a try and it doesn't really work for me. It seems that after
you list the tests, the filter_action remains on skip, so the tests just
skips.

$ sudo ./build/tests/xe_live_ktest --r dmabuf
...
Subtest dmabuf: SKIP (0.078s)
$ sudo grep . /sys/module/kunit/parameters/*
/sys/module/kunit/parameters/action:(null)
/sys/module/kunit/parameters/filter:module=none
/sys/module/kunit/parameters/filter_action:skip
/sys/module/kunit/parameters/filter_glob:*
/sys/module/kunit/parameters/stats_enabled:1

This works for me (with my additional patch to rename the module):

# # list tests
# modprobe xe_live_test
# echo -n 'skip' > /sys/module/kunit/parameters/filter_action
# echo -n '*' > /sys/module/kunit/parameters/filter_glob
# modprobe xe_live_test

# # run just xe_dma_buf
# modprobe -r xe_live_test
# echo -ne '0x00' > /sys/module/kunit/parameters/filter_action
# echo -n 'xe_dma_buf' > /sys/module/kunit/parameters/filter_glob
# modprobe xe_live_test

I  think the main issue is that kunit have some different code paths for
not param == NULL and also that writting an empty string is not really
working as it doesn't issue a write() syscall. If you force a \0 and use
len + 1, then I think it might work, but I didn't test it completely.
I may have to enhance the patch on the kernel side to handle that more
effectively.

Lucas De Marchi
