Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72763C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 17:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1C310E751;
	Thu, 30 Nov 2023 17:27:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8314610E756
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 17:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701365239; x=1732901239;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J8ImlOx7oxzbEf+Iy7z2raCTLn/XqvBW2TF8hcWj4ic=;
 b=Lxziw92CGQU+Ybm2NqsgWcJgW/DYHg2j9pJsZnjCV4zvBBVSxijh0rsP
 hvXc1iCUOIuG77p9Zks4zQqgg8NmyX64RigY8UZJK8StCICC4l2U3i7il
 DlWVO405YNlmfdRbsaWNQDymM7CxBGxN5ZbSQAzCtpS31Bj/q7RFZ3Y+L
 +HBz/hzO22quzIo345Ya3mnB1dIcsBb4Yw60rLRjA5mfzeBZowiok0z0v
 ltWuy1D2QzSLw4s00eXAnKrGi1wJCCmhAo9s+3VJHHnP1rmnTnTTpsMhD
 GzO0AbDMgA0KxfBzF7wFaO1G8rwgYXi5kVSAejpBNHpS2k03EOa//NtJj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="14909392"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="14909392"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 09:27:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="769373350"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="769373350"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2023 09:27:17 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 09:27:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 09:27:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 09:27:16 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 09:27:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gbb4eoCA/nbosEiIoLUucgBvzfLdQTfRVw8wHldyJtxJPUS0H9b/optFrIaRl2y+YgUab+gYlXeWUbCnp4eHQWde5kJTCAHszLwg3al/pejANTw+Q7pBM6FgWhxgT11kj8zRzPgdV/u5md32Epu3nlU1GJYLlYEG2NJbxmzHdaHyzuKgd5oybWLPFE56/FPo8YUAQsoCjN2FC8VB+uV4Chkf/Ck4FdhqpoKmpXVUZTULNXulBuHDKOlyoOrMHW7WF12QFotV5MVnzgaWNWrOKpHMaRHXGktVJQuqEVxxucjiIQUfxp2wWQCfmyknS8ttGMTi60fYmVk74HJ/aHhTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8ImlOx7oxzbEf+Iy7z2raCTLn/XqvBW2TF8hcWj4ic=;
 b=OZCXxBYXpizMH6S6VWB6hrWoPEXGMK2UcCvStcutp61t+mGiWfQn8rX7Au3Fzv4MyM0pwmy59VZM0WbrCL8G2Duv8IZDyeJGZMTPMeDqznQ0nqaEs0VH3NjXvTUSVgR182rTfbnJm5prgqmsiX3O85SVYYBYu+TuMsm5I6DS/7JDYnM3T0XrRr62u+dDDu470k+c5+xE+E57cCmWZiuK6UjHT6zBcGCBb7j90tpzwbfaztDdGIZV+fvkSY8IK7UQB8vZQgINIzMVZs6vDzl8wIYouECeATv0y8ixR7FS5YH1qEApiwhd0tAXYHiRHazQzKLhBDQAYjZLonRVo+pGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8403.namprd11.prod.outlook.com (2603:10b6:a03:53c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 17:27:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 17:27:14 +0000
Date: Thu, 30 Nov 2023 11:27:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <6ddvvwcd4lovifju72gfzpuqntxmfpozhcdpbudhhz5ebxhses@tle7oryredvc>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
 <20231129214509.1174116-6-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129214509.1174116-6-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: c8417323-650b-40c5-74d2-08dbf1c997ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CwZT8eBK2ahZAQ8GwO4TGoLx2ssju9CUZpEcaOgk9tc/beZq15sMFpRW/TrYjJ3U7iT9mjcxaVo6ybg/pmiR7TQgVV9SJI5HUMIknPArCBwgbhTHG8KWwBwESYsT7rln8jgrMVbp8Ysuby3nuF6nAxRU2OrHTgscMPdyljDSOLwgh9gR7rL5Gc46rvLWQP7bWrCTp9oVdqq6aVnve2GlGRLCev2cq/Tm/uYOEsWLudYtqzWEaPgM/TGTOZrTYUE3iEcbQBvXoEiUkPGug0cEjreL2pMYRUorieuTGuP8iENN62JH37HlLzCaVaj7jHhk4JfAFzqJjTmafIfi/BPOuPJiqJ4yw2FxLk9vnUkrbime+RwErIepkpruHL8SNya3RvW2cwA9dEfFisSxPmlo4tn6CThW3qPPRWv8DzK9OKvoTyNFOGfKpk/pJS8mTWH5nQXLPZMc7JOqfC90V5CyIjQXm/psRLqsvO/2/LMeEfrUlGDlMlBDh616YlkJB+xzPwdb+pRZGcZzN6lUQioEVvFtrKq7x4CO1FKQ08LWZRJzbfWXgajPt4ftph7Wiy07
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(9686003)(6486002)(6666004)(26005)(6512007)(6506007)(82960400001)(38100700002)(478600001)(86362001)(66476007)(66556008)(66946007)(6636002)(41300700001)(5660300002)(2906002)(4744005)(33716001)(83380400001)(4326008)(6862004)(8676002)(8936002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnZZRlhKQ3h5a1RmZW9hYmUydGJzK0lmd3YxQktLZ2VGRXhkZzVVS2lrNjZn?=
 =?utf-8?B?UkpocUwwOTdsRnFxbTY0YTI2dzV0NHk1Z092K0pLdEJQRDRhOXJaTFJ0WGxK?=
 =?utf-8?B?NHNlV1BPemU2QStoaVdOMTYvZUhDTUt5bHFUdVYzWW1EZFRlZzlSVllCNllx?=
 =?utf-8?B?cVlobk52eWVtZ25nVVdxajVubkZtZ3U0MTEwamhiMnp1RHdQeUlWUG04RWkw?=
 =?utf-8?B?dk9CejBQQjRnZm1RRUVVK3Nqam9QNDVZSnBodHpCeE16WmVqTDBTSGpzdW1O?=
 =?utf-8?B?cWtkaFNMb1VzN2s3UzhXWnNqUkdiSjAyNDZBc0l1YVRoUUR1dGd1aStaQW9V?=
 =?utf-8?B?U2cyM2lwZURrbDdQTDZReFV5TGh6eUtUUnJUTnVOeUVJQ0JSN2psRldlc1pz?=
 =?utf-8?B?bXkyalVERFBteVAzdUxYZ3JSa0h2NFJFUTFPb040Y3g5NmRBbEl1T1JBL3Jo?=
 =?utf-8?B?UXg0T05ERGcyT05STUNYOWxBbTltZkFZNTZGL1RyZDhyYjFNOEZTT3BaT0xB?=
 =?utf-8?B?d0ZldjRDR0d2UVEwcnhmUDBwOHFYanpRY1lFaWxFaTQ3MmFHemMrMFU3TUVG?=
 =?utf-8?B?Q2JkMXBBbWwvanZlZ2VaU0pLSXV0a2wzSzdqTC9uby9qR1IvYU5HNFR4dG9U?=
 =?utf-8?B?R2V4dEdYcVN5U1hrbi9sK2NPakorVE9oT3p1SlBwalNyVk9qbEp0NEM1eGpM?=
 =?utf-8?B?UWVWY2ZUYVl1M3NOc2xsNUFOVStQSUNnMU5MTTZGcmUyL3BFSlVKTU1HZ2Fm?=
 =?utf-8?B?SStFR0JORzBrTU54b21GamV0NzAwUXlGSTJZekY3TkFkeFVuSXA3ZG55VDJk?=
 =?utf-8?B?ckhtVUJETXprUTJhQ3RLSmE0cTk5L1VubGNEMzBCWGpkK1ZTY08rOURBZ3dy?=
 =?utf-8?B?K0JJVDkzandDQlI5SXB4MngvSGxGcFNLZnZFWlhaeGlzeVpTRmNseFdWTVor?=
 =?utf-8?B?aThpSTN2U3BkenRZRGg5bUNGb1RYY25hb0xGc3lBekY5WUUxSE1SeXl3ZXBm?=
 =?utf-8?B?T1IwSkh2eUtRS29hTW9lZlAxcGJaWXlpeXd2VzJCQmJLYXJIOG1FNGxtYnAy?=
 =?utf-8?B?YzY4akoxRzhVTWsvRFJiYWtBWnJNSXJUNm16Q2dzQnRhSnFlTlZ4QWFjY2xM?=
 =?utf-8?B?Z29BcEM2dldsVjEyR2xncGJkYXUrb0c3RU1YWktycEZUNWdLOVJsU1VBT09i?=
 =?utf-8?B?aFdPRUZOT3ZoaWY3RWVNYk54bWFaeGJSMjUvZUt0NzQwV2tBY1ZURXlTV25Y?=
 =?utf-8?B?S3ZvN1NFd1Rwb3NuUUxuZ0ZTV2Z0YlRVYzZTZ3hJcGlaTjBVSEk3RXdCamtz?=
 =?utf-8?B?eitmZ09PcGVVSFpKZ1dDNFlST25rMTcrOGxBUVdoN3RncEE3VjdOSEhabzh3?=
 =?utf-8?B?dTNWcDl2LzJGZHR0Vlg5MVlNakZlVmVEemkyMzRNNHdrdkJSaEQrZGlSbDFY?=
 =?utf-8?B?disvZmVYQ21BdG96eG1mMGRYWHFCYUZsOGlaOVdZemRxWFY1Rk5jZ2dkTHAx?=
 =?utf-8?B?a3pCZURZb0VyVFZ5ZTgxRDBKRDJ0UnVmRWExRVB6RmlSNnM2Q2RhdWQvU1kz?=
 =?utf-8?B?NFlXOGZoNEg4b0tGOThkNnowRjcrZDA0SE1QUXNsT3ArbmNUeFNoQTFML0Fa?=
 =?utf-8?B?VjRqUlNOS0xzckFUNS96c2gzNks5VTZrVndPQ2luamZzeHVUSWxXTm8yb2c3?=
 =?utf-8?B?c21HVUFZZWtpOUZraVNnUjJMR1F5Tld0NTNIZkI3UC9hdTNaYnBveEw5ZG1N?=
 =?utf-8?B?ZUwveFlMQlUyTE03SzlDc2lLNk5neUV4Vm1jNzRnUWhjQ0VSaHc5RkZGVzQ0?=
 =?utf-8?B?M3NEMnpVTEtNWW81ZjBKT2w1M3JwQ3hTNjdsWHZNNzN0ZEovWUF0RW9wS3By?=
 =?utf-8?B?VWhjblFrWXdQbjJqMFRZbzFuTFJuaWlLTGV4RUVIcUFjTUZ4eURwcWtxV0xK?=
 =?utf-8?B?NFF5WGp2WXNUUVlPK3RIRHB0elRUZWh0bUFmaG1nMEZaUlZoR1FQOThYN1JU?=
 =?utf-8?B?R0JXRUZWTDlQRmhwM3JicnQ2bkQ1TG9qVDF6OHNDdHFSSm05QTFmbE0xVUhu?=
 =?utf-8?B?MGxEMWpPWC93L1N5ZUZGMnhFOVhyM3pVVmNldVVhUlNrVjhKYjlOOUx4amhn?=
 =?utf-8?B?QVVnUmMxQVdha0F4QU1zVGc0Nzh5bEQ5RmhBc3BPb3YxOEdBWDRLVjhrUThr?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8417323-650b-40c5-74d2-08dbf1c997ce
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 17:27:14.2947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flQPdBUl5g+GaZCdjWnckTOJanbEBjL44A2bpuoCt7Ufrr8Bis6JwV1ojJ9/kwIwcCf97H3xdh/w+z2Qp+vs1MJcPO1jFiKPprzr9b8CWkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8403
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [CI 06/14] drm/xe: Move xe_mmio_probe_tiles outside
 of MMIO setup
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

On Wed, Nov 29, 2023 at 10:45:01PM +0100, Michał Winiarski wrote:
>MMIO is going to be setup earlier during probe. Move xe_mmio_probe_tiles
>outside of MMIO setup.
>
>Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

I pushed up to this commit to drm-xe-next. The next commit has a
conflict that I solved and was willing to push, but then noticed some
issues and was unconfortable with doing that. I will share my concerns
there.


thanks
Lucas De Marchi
