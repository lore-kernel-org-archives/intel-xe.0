Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DCBC6FD1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 16:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2123110E0F7;
	Tue,  7 Mar 2023 16:26:51 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FA210E0F7
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678206407; x=1709742407;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r2uH4tsNIMiMpHu01OHq+AUbPubc/bOV/Q1+BasVY0Y=;
 b=LIfeat0ll2uEmb2eHX4oPtBZFT/6WczKwbIxPB46gFqcVEqS1FuBrsB2
 qNIb0ubzgPKZTtnP3/nOtTF/zSZmlcpHzEbik/C3ua0koE5S8pTVJ/eD5
 OP2X1JAcYYePDebFJvHjvjmio2ascbH7qRLTscKlDHuqOFr6pXBpgYWuL
 ZrtZqWXHRIn40XDtni0RIfA1ff/EYTw8mllOiUqx5A+bFx7Bx2LJAgcf7
 FpIQ+G1A6JduSSf/8bt7MVbTFJVUiO4QRFRoRbghaNg6Og2NgGkd1Px7I
 hG3rBVLe3IxMbePs1frqwFjzcLmNt8+MOiubai9u5OJKJoWeWLYWlgNg4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324202382"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="324202382"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 08:26:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676609629"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="676609629"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 07 Mar 2023 08:26:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 08:26:28 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 08:26:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 08:26:28 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 08:26:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WK3BufGIi/B9CMEk7rAwqZVOBDIdJvMMtQgnL7aISQ+wenrQvs3C1v0uc7B+thHqPyguZBN+HQb7T1Droz3MvrkV+tKdheSp7MTRUx5KhjaGJKUGkL0FOz25LhoqRWvkEK04KHTYbK5irOtWHDHd9+AGMS9zyDnbYrJNmNJBWOJvhn8Eb9kBfu/ICxOaWvyVQP+F5qgPh+FzH5gMRcT++Fwx4qoILaAhUf5cSTacw6vtrGwynE7dchpCQwTV2fb2nTmMgirYUd4EhCvf+oinXQ/yDQVXdyBv0353+7XJUX1ozEpdREbZzOAeoaWDcYr5X+Ew0DdVDXvh5Sw0rsFESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twvn6YbJ8w5Pkha13NtmjP8VM9vAc7WXv7egOaaezw8=;
 b=h3nYpHkkvuA5vW+JwKfLqx4r+PnjPOGitlVx84ze8x9My8oYebr3/wKLUlsinCFE8b6PG2sS/quNPRs84UOL7NUYW+jVfg5gdtzR8VlPETf/eqOr6+KWm61dJXPJvtykNFxzlzlVCFiorPPevQqO0AXMN2vNOJ3MqaGcip8Gs9FoCW6ihhmtdQ1uryW+zSoNCHZ6IyTVxyUF21WfSD0xGRugI4nb+WENwDR11Im9pnxIJb4NrykUWQ0/E7z9c2rnQzLSQOOhnl31E9mSguK5cqgCOOD5qURzX16fsOO3qwWKNcoqqpifQmHIsQHKpAtALo3P9cS+Ji1xgmnhV4zZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 16:26:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 16:26:09 +0000
Date: Tue, 7 Mar 2023 08:26:06 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230307162606.6o57lgms6f3ckjih@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230301144815.248239-1-matthew.auld@intel.com>
 <20230301144815.248239-3-matthew.auld@intel.com>
 <f4fbb52e-0b6b-36de-eb45-616236d4587f@intel.com>
 <fac73afc-c489-bf22-47a5-aef8bb0333a6@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fac73afc-c489-bf22-47a5-aef8bb0333a6@intel.com>
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b80c192-4497-42cd-e33f-08db1f28a87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iHIFvG7HZ5kJd4RA8lRAMR8bkrvS9/EqlkF38Ux9DN4sM+sMISW3EJfIUiK8OUCkiiim5eOcd6SNF+UUko2kInR5EPE1Uhv4SAgqeFIffGAaUsEljh7xYFKo6rC19kTtP1LSEb1+1XMReYzXD5cbxGSuR+qEa0LjvNUGaveC+4E8XkxJ7iJb+kkquxjVZXVES3pb3aalqZ+Ci/HXxm0zMsJu0y1QRgOdIP7Vt+X6IUreHvgz3KSlFqdS+i5v+iFrvpbsb6dW5jxl/6ES6gIQF7Hmxc1Xay7I9JbDIN4QhqpLwH/WEUC3mhNV8fGkKgOid7ZuO1ocGP0T6WbbsaCxzXEm9GltMsXBtnF2SrDqxGrBsGPqhT0pvMuZLjzxkcxIZ3tbUZ9NZh8LuVpqVrKOLnJm+ZDmkwHIAsgHmpDW7gtQXTwbCEUJvLOQaAAzsaWUYepnnmPmUhIu28UIIs4GNpdF1WTedn67q64GbslhEXOYATsVmIMv5W0QU1hGGjERYByPHYiaHI4mVDE8V0O+PFOFuHW17Xpl/1/8agFy4Q4bq0sN5eZ8Kew+BlHd5YPKqxPKgauN/g5v0AzkKz9mabWbwkoLjgniJwMfeApkf2S93qowSWEt4p1+UHLV7Qcm/w3xqTTi4J3oL/5ZhyFfbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199018)(8936002)(6862004)(5660300002)(4744005)(66946007)(66556008)(4326008)(2906002)(66476007)(8676002)(316002)(6636002)(478600001)(6666004)(36756003)(1076003)(6512007)(6506007)(6486002)(26005)(41300700001)(82960400001)(86362001)(83380400001)(186003)(38100700002)(9686003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?O8THjRxzdGEnQ8+2LgHMfJyUgGpYbf6x3FN4p6HPrGa+bSVMaC4ksPrrnM?=
 =?iso-8859-1?Q?lg/EiXO2aXigX4kzqAJC+Agfb6f7AMtm8yDW0m0qY/ipi47XiWkbpzuXq6?=
 =?iso-8859-1?Q?LGFJqzB/f5I01LoR1d46ghRaKUD3up13lLUTE9y9vRWUXuAk6orrZ+Qd/m?=
 =?iso-8859-1?Q?wB+dws4ZZxcObFUeeCPzYj/uZDlitAXR0W+rq05g4UrSTTl5HhSYZbFrkj?=
 =?iso-8859-1?Q?/I5Xv2jvpG2z+yI1xKbU/WGg3eOCUT1FMs0fUsLLHQ3bqok3BFFNl2M5mf?=
 =?iso-8859-1?Q?/ceH5mMEUF9isbDUqjIffCT+Hxx4BOb3BUpFC8d2Qwasdz/HAoVtWPsQQ2?=
 =?iso-8859-1?Q?yRRDZcQPyRTjpT+t+ZEHR3yLGKpXZS/HhrEqSlOH/lQ77A8c6gT60WSX7C?=
 =?iso-8859-1?Q?iEfS42lAGqxFMAb3UWpIs/Ok2enq5bVCdBnZDJX8VY2gi6WfRuouSx94/p?=
 =?iso-8859-1?Q?BcgBKNgbWWBglAGtwLdPd7J03JZN1mbGo0RgWAIR/piluae06Vh5H0qOYi?=
 =?iso-8859-1?Q?rHU3EpOqsv0HIDlGgM1yNOu8jimrOtvGxoSp4o4ogfQqv9xA+e75FMg0WO?=
 =?iso-8859-1?Q?t/kRsHSMS9YTfWK4sowVYF2eIxX+4S0r9bOXjOfKhQPw6Kpgbjlb1XudX5?=
 =?iso-8859-1?Q?M6MPQ/nZGpvHKNkPXIXOfPJbEqgJ0+KEbdWO/L7tMlo/uvvVqBE23Na7Zv?=
 =?iso-8859-1?Q?sbxHnyRb4dmZ46izzS39zhDbJXmWhDxfA2aRah5lD/plNPjTkHrkPnBmti?=
 =?iso-8859-1?Q?Y22r/75c70r3O29KX54PtN6IknP1AOJgvgstQtkKyPKESCpdArm/G0Hfng?=
 =?iso-8859-1?Q?vhLLn4jjiV2q5CWBcwzPJDq1GDQC+Yu4FbGcEWx35JoRYXkzX0OidCgQiL?=
 =?iso-8859-1?Q?NISyJVp24nXIOtX3tu5vdzovsvF89iLApYsIw6sONwKXjnrHFWq/wvoS7S?=
 =?iso-8859-1?Q?dwaDaCrnugM5/oHCQ9QOy/3v4OFa61wPooWafT47XLW83RWkgv+pNxqcq5?=
 =?iso-8859-1?Q?1TCCFYUtPQo9aoEVn6u9Bslt6AryPJ42VFIgRL2D3XV37GAjvvilV7n1T/?=
 =?iso-8859-1?Q?IVloYbqtUaW9ppAWPEBLBokOpdC0j7s59e0pA0GPjoKWfQSCg1OI2El/sh?=
 =?iso-8859-1?Q?d2Z0pAAEEqwhU0CYjB/kYligWjXij3wwgcYTQNC8+zdg6xGd0EqtT9Rfat?=
 =?iso-8859-1?Q?YBAhyIJZZuNQucBHcbfGIpTZ0zW+qhKnsttMNp9WJmmdPdhvkl87Z+p2iK?=
 =?iso-8859-1?Q?+W71PAuV7GqnRHsrmiXSdVm6WAEobdEV9oOLeScPrZ8CQyxgkii9ZybiR6?=
 =?iso-8859-1?Q?y5GpUeOOj6/8nVrJFPAYnANJ6WqhWot75h/AcGMrI99MVQxS5T9HdRpVvN?=
 =?iso-8859-1?Q?laVb5Maxobqo7lW8LfjWQY4T8DcuZbbVTWY+E8kbRpX06s20+De5m/E/L5?=
 =?iso-8859-1?Q?tU4k7KAlYLWjhhXGGjCgiH8D8LTaeClMfPaATXLgPM9UrQY7z2wBS9YX9c?=
 =?iso-8859-1?Q?hPaku/si8y2569QJqkP3JVAfmMbgPoZaj7iKHjL+Eqi/YlrINqCUKZpMct?=
 =?iso-8859-1?Q?23Gnl+B0mRgox4M+b1XkP9YtMrVjbmXJYXxThrt9xqeLPZjqPJxHr4mW8C?=
 =?iso-8859-1?Q?S/oCTY/6Up4aqmYnCPFDnJ8cz+stMXBVzCYyLBF5MPfHxv+4F6tVyWAg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b80c192-4497-42cd-e33f-08db1f28a87d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 16:26:09.2000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9vidSoGkGbvqiE8YGcYLxxPGGlUUrc5Fr2xcW+DPQsW3xEsd6psLFMg5DkjpYCOnO4SksAcQOgf049nuSiuUii4mY/YysJwGBPx1puup7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7757
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe/mmio: s/lmem/vram/
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 11:27:07AM +0000, Matthew Auld wrote:
>On 07/03/2023 10:03, Gwan-gyeong Mun wrote:
>>Looks good to me.
>>Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>
>Thanks.
>
>>
>>In addition, in the code of the function below, a variable or string 
>>named lmem is used. Is the code intentionally not modified?
>>
>>drivers/gpu/drm/xe/xe_bo.c
>>     xe_bo_pin()
>>
>>drivers/gpu/drm/xe/tests/xe_migrate.c
>>     test_copy()
>
>Yeah, it seems there are a bunch more places. But here since I was 
>only really touching xe_mmio.c, adding the plumbing for io_size, I 
>figured to limit to here for now. Also there were some existing user 
>level prints and modparams directly related to this series (like 
>lmem_bar_size), so seemed worth fixing those in particular.
>
>I suppose I can re-resend with s/lmem/vram/ for the whole driver.

yeah... I think it would be good.


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

for that approach

thanks,
Lucas De Marchi
