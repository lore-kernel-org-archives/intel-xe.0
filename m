Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF167C27C40
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 18:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45D910E5A5;
	Thu, 24 Aug 2023 18:00:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98B510E5A5
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692900015; x=1724436015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pOfjZyBQPPsFGk9Yz8IgtKwHspUffIZcC6WhCE/7Sd8=;
 b=E59R6JzZXEFDCaXzuN+FEMziMdKIYHV0zlFU+/SE0Dkb9IjrEl0bq2kM
 TIYOpo9fz8aKtrasCmI73kONuVUgMGf7Cw5oJYFW5Y1tvry8aUCJOdvZB
 NjBr++RDQnJsuYgshawm3f5GXZmhg/wyVrSfzzc4Q9NauQU5JJjmuTP9z
 B3nCEI5vi6uq9ywfpdbd/Jot8zYhXx8xlOl0nrZPrTJgOI9H3imyBfKkG
 +Rkx9QXcfWKPZAdIs0Sd0TKqy1nIiMWXuPCKPa6X+4cOuHvZhNrNTT95t
 vObD9LffigYOlVDnP5Dl51EQR2fDIAjt7Ph2NIsPthTaGZkcuxMAlhiW2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="378300084"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="378300084"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 11:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="860808171"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="860808171"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 24 Aug 2023 11:00:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 11:00:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 11:00:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 11:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJHfaaGxpYnVitoyW1gla9ydVfL2V058LQl8Vi18ceLdKvvtHWlhJhCIVLJP22b0t267XG3w5MDCg2uD10PIkBqvb+bVT/78B96jb1xcFp6vZ9CgSw+w4cQdD/aK+wsebbKKJ8dJr2cDT3Ulw0MQRDlqBRof6pb4S5Lh2cWjj2Q6Pw9hMeoKjsm9rw03P09iCQCg7o8Sjh1AT3uLttRunCbuaQaa/xXHsZeO36r4D6KLc2f7ktrJ0B6KS6LX/Qvr6Vgztp1CTMyuuYzDpieQ3KNfBbdJMa3eQEOWSsdTnKyzMwD1aRiYDBN8WXseJHQZZpPMkAdh9EaxUOOKQC2Few==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gwDrRPRceh9PXFK9h1h0zt3TPcnqxwsNC5JW1FWu5M=;
 b=KGPVlLNHe9IGFXoWkAb5IjBKOEdDOoEbRogxCPeEyryUN+xDIrjCYXzps6DWyWenKQiNVRRpIHrLJAW6IYd2BSjrfy0IqK9WZdZ6NMsPTPdWwUY4ZsCIxAIg+J9ccOfKWfnn+jJJyovFlDVfo3iLHXx4z7eV3IfAo8NOC0Bf5HEzZMl8lsPIT3aGdSE8xRZtBs+0kvqc2nvRFiCtMGrruNolGU/EIRNA/acbHCNiZPuAweYt+SWRk+AuPXCE+Vdb8t3f3d1ACXKy3LlZuivuyZ0MpnphmHx3v3X0DlnUFTW/5cheB9KyHIpYvKKvSJABA2gj1kDKFdK+fGzg6NH3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Thu, 24 Aug
 2023 18:00:12 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 18:00:12 +0000
Message-ID: <0e3b90bf-ce74-bd2b-e62a-8a5a37e8b39c@intel.com>
Date: Thu, 24 Aug 2023 11:00:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230816215515.1506619-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230816215515.1506619-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::15) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA1PR11MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f47aa2b-fbe6-42d3-3ceb-08dba4cbf667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lhtwDYs6fEBSjhE5pHXTi0cJxzJ5H2CGQ5pM1y/862AbAZNAiQoSbLtmxKXcYEqmSLud9CYxCKFZqDANcxg2gTPURu0KYGa5NvSiges4asNxfw/VNro3uZa91F9cNds9Mp3EoHK9/Znd0ITV8uDE29IgfPdFQKf0kLlfLTEPZIP4bBC0PCqmlGAmlalFF0b+tHY+PKIQ8DQYv1D+9vU6KUb4mO7Rd8Wi+Pub5alxaCcIi5Jz4yZ7xJPnabPZmHxSaU6vuwTVNTvl3LZVpxZbNVmZf/lX+kUrkd3mGCfZx6o9xs8UZ/Hb9LoE6gaoeNtd1y37v/xEgwQd2HmpOFaZ3B5kn+WdzVOb9jHTcu94f6vxg8LT10JuO3JWoV9yv/f+8jVLQ53MIjRGuzeXvmWz6gBjyyEF2MHcB+T9XV5UomuICYNywd4QZIdlVaPGtHPStoyuZxhscLDNNbnORoOn8wU/rPp7LXcGo+D6lL6xGIQMLTmQd5E5uwpIbKkao9r2P6i6+o2QrJIfySyfVcYSkUF0Sx6zs1Dmsy46IJLyqNwYt2QYvVayT5rkDb/iw5aCqJjszPda9tZAl0QkUpfYCvjw+v+4HuBDaJhlmg+EKvUFj5uNEGLMj4WGfJATGyOl4D98SvcKdpJJuKAwaf9nwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(1800799009)(186009)(451199024)(478600001)(6666004)(6486002)(26005)(6506007)(107886003)(53546011)(83380400001)(6512007)(2616005)(30864003)(2906002)(5660300002)(8936002)(4326008)(66556008)(41300700001)(8676002)(66946007)(66476007)(86362001)(316002)(36756003)(54906003)(31696002)(38100700002)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkNGRU0zc0FmeWRHT25kT25SK0kwTTVRQ1hsWmVzaUYzaXpRenVQblNrQ2lj?=
 =?utf-8?B?blJDREJZbjJVTlJ4TmlVYnNDRnlDVlJCSDhQSTB6VmFBMTA2bHRxR3pYRW11?=
 =?utf-8?B?UGozczhrY3NMMVVaTzE2L2JDTkJSOGhBVE11R3F1cEllbEViVjRnWGVhR1kx?=
 =?utf-8?B?UlNseFBKdm4yY0Z1bk9RaWROWFVwMlozUUVIZUtuZ0V2YUJZQXdQYS9RSUZx?=
 =?utf-8?B?ajhMVzh2ZmtiMW5aeFhSUXQ2SlJnWWNrSFJESnFSazRlQUdpcmx5Z2lhTWJ1?=
 =?utf-8?B?cUxZZitzaVd1eU9oRHMrUnlnL2tDa3Q3QWJNZEQ5RXd6a2hnU3orak1ncmQ1?=
 =?utf-8?B?RlVQMTVyZ0M5em95VXg1dDJ5OFMwMHdnRG8xdnBCWFZMZmtEQmdrTlg4ZWRj?=
 =?utf-8?B?ZXBISEF3QmdSZVFCK2tEc0IxdG40VHc0aDFuVkV1YnBDbjNzdG5Lc2x0M1ZH?=
 =?utf-8?B?WWpkVVpvYmROSEU5TlBxU20zRnZjZ3ZWUmtWNERuRHVVVlUvdG44QituTUxu?=
 =?utf-8?B?aHJVTm9scTcvQVJBeGxwdG1saUhyaWltTGxDV1B2SHVMU01USVVzMVRRRGx2?=
 =?utf-8?B?MnlxQ3dieFZVWUhPdDlEWDJkcGFBa1BjSVcvNzZtVjFoVWg0UllLTVptaUJx?=
 =?utf-8?B?K24zaGN5bmU0a2h0bjZuNjNtTWxXNkdTWk1McUFEdXRQbGhSUDhxN05kMllv?=
 =?utf-8?B?eHFtV01wb0NnMjNHZXFraXA0ZkZwMXR3ek5uWERKSWFudUs2bGsvNGNicFZH?=
 =?utf-8?B?RGc5NW5PRGFpcEpYN3I1RkFtTGNuZjRDSGp1L0tDbmxaaEVNS25vSzNudE13?=
 =?utf-8?B?dVlyT2xSUzlQemVMUS9vL1BYTVNKRk1yKzRWemJGcXNYL1lJdlZuUVVhRkY0?=
 =?utf-8?B?dno4R3lMT05EUUhZUUx5TXZwZFpvRkE4azVibWVqVFI2cytXc3gySlB6VHB2?=
 =?utf-8?B?Q2JlcXM5dEhYcG5QbGNrRWxyQ2NOQlM1MXNZaENjeTBkZ0VGZWFUUmlPSndT?=
 =?utf-8?B?K004MjM0Y1pvRDJxeEowWmJlaGNobEFtb2x2UTJJNEVLQnNYRWowRWdqWXhX?=
 =?utf-8?B?bkxOUlI1UkhhOXNpTGhjR05OMjJzNXZOMU92MkorcWZMalVibitIWmYyY2Zo?=
 =?utf-8?B?Qno5T3VRY2ZPUHRRS2pjMlJ5RUVUbHdZWTlFcElUc1Y3bXM4ejEwZjZJSDhM?=
 =?utf-8?B?Y2xJU1kxclFSM01QcnplbHZ2S0hKeTVFUTJmMFJ1NU4rMGZTZXp1Mmd5Q08y?=
 =?utf-8?B?YnJHYW1JV3QwZjNPL0VDSHByNXlOUjU2d2toQytWdCtMa1RjTXNTVDFjeXEr?=
 =?utf-8?B?ZmNGRmt4ZG9Bb2dHbmhoQ1kyWXIweVJNdUxPMCtJdE5aQ25SbFR2VkpROGpI?=
 =?utf-8?B?SEtkbG9BSXdadjcyVTVVMEZ6bXpyS0diaHQ2cVROSWQ3N0owcUNoRjZMenJJ?=
 =?utf-8?B?aW9PYm5GektxbEdBTklNNTFrWUdjbytQSEJ0YXRSSko2OHZlMkN0aTlPcmNk?=
 =?utf-8?B?NnhpUjZZbHF0Z0t0b3ZSUzl5Wk1RbG5VZk5ZOXhMRE1UTUVJSGZaVVpmemh4?=
 =?utf-8?B?WWY5aXlxemF0L0NDM1dLMFV0eW9uOWcyOVVVditxZHJyWVBiNUFycGVNNGsx?=
 =?utf-8?B?SERvVjBPTWFFVElMY05WRTlMUi9vLzN2Ly91a2RRaGhxbTQrRGo4YnVGQnMy?=
 =?utf-8?B?K1k5YXR3L3N0NVgxMlhlZFNWSjVoWXlEc3h5UlZqTllWOEZ5dGkwUXJJQTFx?=
 =?utf-8?B?ZTQ3b3RGYnR0Q0FtWjE1NXZjT1d2cmI5RktScFcxWFV0Qkl5ZGs2dmpPQ0p6?=
 =?utf-8?B?czhlZUxVQThoRUd2TTQ0bW5ScjZtM3BCVWRKYUw1b3BBVGM4bGU4TlFWYWEy?=
 =?utf-8?B?ak41WVE2TVlhZnhtZEt0M0N6OHdmNlltN2ZFbHFLd2hXY0RaSm4za1p3cWFO?=
 =?utf-8?B?am9IdXIwajNjVWdiR1kwYTkzMGdYVXFXYUcyak93OU5scTBnMDZPRlpPQ25O?=
 =?utf-8?B?R3FUTG5SczRudldzWVEvUk5PbDFQRllka1FNRktDdlR3YWp4UHZkQ2ZvQnAv?=
 =?utf-8?B?dlJUeUdCNHpiUjM1T3I1aCtXYnFjdWovUG9xRkU3OGw0VlhGeE1UTWk3czN6?=
 =?utf-8?B?N2lVUVg3REhFWmZadzNjNFA2VWFLQTlUNEFwQVZOQTZwYUY0NXFBSWdVdlNU?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f47aa2b-fbe6-42d3-3ceb-08dba4cbf667
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 18:00:12.4586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvkHlaISz+DmIjBzMdv+BCxBieVEnnn4fY2x8za0efXO0xiVVENPzphWmjCAXnz2L+ha6OazGk4KkFrtmDZO+LncLNhEtCTR8jQyAGybUfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6967
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe/uc: rework uC version tracking
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
Cc: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 8/16/2023 14:55, Daniele Ceraolo Spurio wrote:
> The GSC firmware, support for which is coming soon for Xe, has both a
> release version (updated on every release) and a compatibility version
> (update only on interface changes). The GuC has something similar, with
> a global release version and a submission version (which is also known
> as the VF compatibility version). The main difference is that for the
> GuC we still want to check the driver requirement against the release
> version, while for the GSC we'll need to check against the compatibility
> version.
> Instead of special casing the GSC, this patch proposes a rework of the
> FW logic so that we store both versions at the uc_fw level for all
> binaries and we allow checking against either of the versions. Initially,
> we'll use it to support GSC, but the logic could be re-used to allow VFs
> to check against their expected GuC compatibility version.
>
> RFC note: I've added a couple of the GSC defines to show how this is
> supposed to be different for the GSC, but those are not intended to be
> part of this patch in its final version. I'd like to get some early
> feedback on this before I build the full GSC version checking on top of
> it.
Seems plausible to me.

Some comments below, mostly not actually related to this patch...

> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_types.h   |   9 --
>   drivers/gpu/drm/xe/xe_uc_fw.c       | 131 +++++++++++++++++-----------
>   drivers/gpu/drm/xe/xe_uc_fw.h       |   2 +
>   drivers/gpu/drm/xe/xe_uc_fw_types.h |  36 ++++++--
>   4 files changed, 108 insertions(+), 70 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index a5e58917a499..343cc39ce5bc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -52,15 +52,6 @@ struct xe_guc {
>   			/** @seqno: suspend fences seqno */
>   			u32 seqno;
>   		} suspend;
> -		/** @version: submission version */
> -		struct {
> -			/** @major: major version of GuC submission */
> -			u32 major;
> -			/** @minor: minor version of GuC submission */
> -			u32 minor;
> -			/** @patch: patch version of GuC submission */
> -			u32 patch;
> -		} version;
>   		/** @enabled: submission is enabled */
>   		bool enabled;
>   	} submission_state;
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 2e70dd4880f6..e22afd65e5d6 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -201,9 +201,15 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>   	for (i = 0; i < count && p <= entries[i].platform; i++) {
>   		if (p == entries[i].platform) {
>   			uc_fw->path = entries[i].path;
> -			uc_fw->major_ver_wanted = entries[i].major;
> -			uc_fw->minor_ver_wanted = entries[i].minor;
> +			uc_fw->versions.wanted.major = entries[i].major;
> +			uc_fw->versions.wanted.minor = entries[i].minor;
>   			uc_fw->full_ver_required = entries[i].full_ver_required;
> +
> +			if (uc_fw->type == XE_UC_FW_TYPE_GSC)
> +				uc_fw->versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
> +			else
> +				uc_fw->versions.wanted_type = XE_UC_FW_VER_RELEASE;
> +
>   			break;
>   		}
>   	}
> @@ -245,33 +251,30 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
>   
>   static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   {
> -	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> -	struct xe_guc *guc = &gt->uc.guc;
> +	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>   
>   	XE_WARN_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
> -	XE_WARN_ON(uc_fw->major_ver_found < 70);
> +	XE_WARN_ON(release->major < 70);
Is this supposed to be a WARN_ON? There is no need for kernel stack 
traces and such just because the user has supplied a dodgy firmware 
file. Shouldn't it just be a gt_warn() same as the other firmware load 
errors?

>   
> -	if (uc_fw->minor_ver_found >= 6) {
> +	if (release->major > 70 || release->minor >= 6) {
>   		/* v70.6.0 adds CSS header support */
> -		guc->submission_state.version.major =
> -			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> -				  css->submission_version);
> -		guc->submission_state.version.minor =
> -			FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> -				  css->submission_version);
> -		guc->submission_state.version.patch =
> -			FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> -				  css->submission_version);
> -	} else if (uc_fw->minor_ver_found >= 3) {
> +		compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> +						 css->submission_version);
> +		compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> +						 css->submission_version);
> +		compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> +						 css->submission_version);
> +	} else if (release->minor >= 3) {
>   		/* v70.3.0 introduced v1.1.0 */
> -		guc->submission_state.version.major = 1;
> -		guc->submission_state.version.minor = 1;
> -		guc->submission_state.version.patch = 0;
> +		compatibility->major = 1;
> +		compatibility->minor = 1;
> +		compatibility->patch = 0;
>   	} else {
>   		/* v70.0.0 introduced v1.0.0 */
> -		guc->submission_state.version.major = 1;
> -		guc->submission_state.version.minor = 0;
> -		guc->submission_state.version.patch = 0;
> +		compatibility->major = 1;
> +		compatibility->minor = 0;
> +		compatibility->patch = 0;
Do we need any of this in Xe? There is no need for Xe to support GuC 
versions that were obsoleted while Xe was/is still in pre-release state.

>   	}
>   
>   	uc_fw->private_data_size = css->private_data_size;
> @@ -280,30 +283,31 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   static int uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>   {
>   	struct xe_device *xe = uc_fw_to_xe(uc_fw);
> +	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
> +	struct xe_uc_fw_version *found = &uc_fw->versions.found[uc_fw->versions.wanted_type];
Need some kind of range check BUG_ON thing here?

>   
>   	/* Driver has no requirement on any version, any is good. */
> -	if (!uc_fw->major_ver_wanted)
> +	if (!wanted->major)
>   		return 0;
>   
>   	/*
>   	 * If full version is required, both major and minor should match.
>   	 * Otherwise, at least the major version.
>   	 */
> -	if (uc_fw->major_ver_wanted != uc_fw->major_ver_found ||
> -	    (uc_fw->full_ver_required &&
> -	     uc_fw->minor_ver_wanted != uc_fw->minor_ver_found)) {
> +	if (wanted->major != found->major ||
> +	    (uc_fw->full_ver_required && wanted->minor != found->minor)) {
>   		drm_notice(&xe->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
Does Xe not have gt_notice and friends?

>   			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
> -			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
> -			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted);
> +			   found->major, found->minor,
> +			   wanted->major, wanted->minor);
>   		goto fail;
>   	}
>   
> -	if (uc_fw->minor_ver_wanted > uc_fw->minor_ver_found) {
> +	if (wanted->minor > found->minor) {
>   		drm_notice(&xe->drm, "%s firmware (%u.%u) is recommended, but only (%u.%u) was found in %s\n",
>   			   xe_uc_fw_type_repr(uc_fw->type),
> -			   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
> -			   uc_fw->major_ver_found, uc_fw->minor_ver_found,
> +			   wanted->major, wanted->minor,
> +			   found->major, found->minor,
>   			   uc_fw->path);
>   		drm_info(&xe->drm, "Consider updating your linux-firmware pkg or downloading from %s\n",
>   			 XE_UC_FIRMWARE_URL);
> @@ -325,6 +329,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   	struct xe_tile *tile = gt_to_tile(gt);
>   	struct device *dev = xe->drm.dev;
>   	const struct firmware *fw = NULL;
> +	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>   	struct uc_css_header *css;
>   	struct xe_bo *obj;
>   	size_t size;
> @@ -395,15 +400,13 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>   	}
>   
>   	/* Get version numbers from the CSS header */
> -	uc_fw->major_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> -					   css->sw_version);
> -	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> -					   css->sw_version);
> +	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->sw_version);
> +	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->sw_version);
> +	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
>   
>   	drm_info(&xe->drm, "Using %s firmware (%u.%u) from %s\n",
>   		 xe_uc_fw_type_repr(uc_fw->type),
> -		 uc_fw->major_ver_found, uc_fw->minor_ver_found,
> -		 uc_fw->path);
> +		 release->major, release->minor, uc_fw->path);
>   
>   	err = uc_fw_check_version_requirements(uc_fw);
>   	if (err)
> @@ -523,26 +526,50 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
>   	return err;
>   }
>   
> +static const char *version_wanted_type_repr(enum xe_uc_fw_version_types type)
> +{
> +	switch (type) {
> +	case XE_UC_FW_VER_RELEASE:
> +		return "release version wanted";
> +	case XE_UC_FW_VER_COMPATIBILITY:
> +		return "compatibility version wanted";
> +	default:
> +		return "Unknown version type wanted";
> +	}
> +}
> +
> +static void print_uc_version(struct drm_printer *p, const char *prefix, struct xe_uc_fw_version *version)
> +{
> +	if (version->build)
> +		drm_printf(p, "\t%s %u.%u.%u.%u\n",
> +			   prefix, version->major, version->minor,
> +			   version->patch, version->build);
> +	else
> +		drm_printf(p, "\t%s %u.%u.%u\n",
> +			   prefix, version->major, version->minor,
> +			   version->patch);
> +}
>   
>   void xe_uc_fw_print(struct xe_uc_fw *uc_fw, struct drm_printer *p)
>   {
> +	struct xe_uc_fw_version *wanted = &uc_fw->versions.wanted;
> +	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> +	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
> +
>   	drm_printf(p, "%s firmware: %s\n",
>   		   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
>   	drm_printf(p, "\tstatus: %s\n",
>   		   xe_uc_fw_status_repr(uc_fw->status));
> -	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
> -		   uc_fw->major_ver_wanted, uc_fw->minor_ver_wanted,
> -		   uc_fw->major_ver_found, uc_fw->minor_ver_found);
> -	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
> -	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
> -
> -	if (uc_fw->type == XE_UC_FW_TYPE_GUC) {
> -		struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> -		struct xe_guc *guc = &gt->uc.guc;
> -
> -		drm_printf(p, "\tSubmit version: %u.%u.%u\n",
> -			   guc->submission_state.version.major,
> -			   guc->submission_state.version.minor,
> -			   guc->submission_state.version.patch);
> -	}
> +	print_uc_version(p, version_wanted_type_repr(uc_fw->versions.wanted_type), wanted);
> +
> +	if (release->major)
> +		print_uc_version(p, "release version found", release);
> +
> +	if (compatibility->major)
> +		print_uc_version(p, "compatibility version found", compatibility);
These two prints could be done with a for loop.

> +
> +	if (uc_fw->ucode_size)
> +		drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
> +	if (uc_fw->rsa_size)
> +		drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index a519c77d4962..1b5bbbb97aaf 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -96,6 +96,8 @@ static inline const char *xe_uc_fw_type_repr(enum xe_uc_fw_type type)
>   		return "GuC";
>   	case XE_UC_FW_TYPE_HUC:
>   		return "HuC";
> +	case XE_UC_FW_TYPE_GSC:
> +		return "GSC";
>   	}
>   	return "uC";
>   }
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index 837f49a2347e..69d3f2446781 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -55,10 +55,27 @@ enum xe_uc_fw_status {
>   
>   enum xe_uc_fw_type {
>   	XE_UC_FW_TYPE_GUC = 0,
> -	XE_UC_FW_TYPE_HUC
> +	XE_UC_FW_TYPE_HUC,
> +	XE_UC_FW_TYPE_GSC
>   };
>   #define XE_UC_FW_NUM_TYPES 2
>   
> +/**
> + * struct xe_uc_fw_version - Version for XE micro controller firmware
> + */
> +struct xe_uc_fw_version {
> +	u16 major;
> +	u16 minor;
> +	u16 patch;
> +	u16 build;
Should these be 32bit? The submission version structure that has been 
removed from above was all 32bit fields as is the corresponding i915 
structure.

John.

> +};
> +
> +enum xe_uc_fw_version_types {
> +	XE_UC_FW_VER_RELEASE,
> +	XE_UC_FW_VER_COMPATIBILITY,
> +	XE_UC_FW_VER_TYPE_COUNT
> +};
> +
>   /**
>    * struct xe_uc_fw - XE micro controller firmware
>    */
> @@ -98,14 +115,15 @@ struct xe_uc_fw {
>   	 * version required per platform.
>   	 */
>   
> -	/** @major_ver_wanted: major firmware version wanted by platform */
> -	u16 major_ver_wanted;
> -	/** @minor_ver_wanted: minor firmware version wanted by platform */
> -	u16 minor_ver_wanted;
> -	/** @major_ver_found: major version found in firmware blob */
> -	u16 major_ver_found;
> -	/** @minor_ver_found: major version found in firmware blob */
> -	u16 minor_ver_found;
> +	/** @versions: FW versions wanted and found */
> +	struct {
> +		/** @wanted: firmware version wanted by platform */
> +		struct xe_uc_fw_version wanted;
> +		/** @wanted_type: type of firmware version wanted (release vs compatibility) */
> +		enum xe_uc_fw_version_types wanted_type;
> +		/** @found: fw versions found in firmware blob */
> +		struct xe_uc_fw_version found[XE_UC_FW_VER_TYPE_COUNT];
> +	} versions;
>   
>   	/** @rsa_size: RSA size */
>   	u32 rsa_size;

