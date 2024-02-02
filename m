Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A704C48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 18:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376BF10E5C4;
	Fri,  2 Feb 2024 18:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UPp26ORZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC0010E62A
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 18:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706899903; x=1738435903;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DznIOj2OvU0yBSr5onEoDgVHTIWCzz5SvG7JdAVMppc=;
 b=UPp26ORZWERokgg0kXbfg+CdFCifrkq0o4xeDn9ryoowMLyAgyDe3+Z6
 bnqI94OuQN3WkoGWipdA5LTkFxWzcnwrSERCZil6/g/0gczXRLbWXOe3P
 2a1Rfv8bbltIGA9VAvj8KUKhFFIGvAfrZ/V/cZv88hKnKeN01pLempz6z
 oUIVj+o36Nwb6eFG7lOjjPECgMdPJ9V7CU96TbRbP2RJBaqQvvytE9ZOa
 BiCYuLEsmT8izAJETRioyTPvMwuJlp1Wv2aRgbhGn8XyAOivfGQ7jG6KE
 y3Hlh5MQtnQuPYoGrZVaqsaA5PRTOyrr7hb4lKoEThMjH183L265MDrAt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10960369"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="10960369"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 10:51:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="346312"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 10:51:42 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 10:51:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 10:51:41 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 10:51:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgfHGGjexj5DKEJL11tDLiomZGdHnroEYwZChifzuGikNtF4YXRZtmQJMlac4+HSWeyA9XiMHkms/yg62ENXdEsdAnq2soCmZhR8wd7kCAUEt4bE2HJt+X1j4851vqDef/aV18zKvUvI6lbWaXXs8ScgJq5azQoY5cC9CtLXA3LItl96ueC0n4mul8WY0G4tbPDkibIdJd341V4ycbx6SChLpVNQ43BFCl2guufBhNCkSr2Tmbv9n2EZgM90jiZPE4BOC/39PnZrheqlHhtu5my3hRAjSNO0RbzhDgzf0raUmPgiWy88tpRD5WtwgcgojoLnWLwx253OcJGMMTP93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isNDDxOZfyEGrRahdVfNOlkVTUZXdg8W4mxfRWtNqdg=;
 b=Smh/Nq1wFNEzOWD9BoqKFWKFDq67C7xIuOtz3Q3SeGEoNJ7B1RwWLdYu0tBkio5alO3OL7peUQR1c8jAaA7fJgHavDaCut62b51JdqhSGvDcFtGPXNNkMYo42/EVeW9ScfsBld7HbySdheNri0xry0WVLtUHSthJQ7HI/bTrwjW/FghVgXhj+daLButHzPhqdIa6ZtS+hHdTs8qQgqmNy3Wbwf4UCCR5dcRfFHFyUIpQeMhD/Av+5T9HLOwZAy5o58IEhLzAJyas4AyZaeENyh9hEso1/38Psktr85pqN4ICKJQ5lMmPGyqfcUjV3g6ZxQJDTrlm8nEEiLFmRGodyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BL1PR11MB6028.namprd11.prod.outlook.com (2603:10b6:208:393::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 18:51:39 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 18:51:39 +0000
Message-ID: <2cd956b3-bccb-4423-be46-435125343449@intel.com>
Date: Fri, 2 Feb 2024 10:51:36 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Update to GuC 70.19.2 and add LNL
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
 <njcmjcrd32ztgxa7gwmgsmhszwsm5je3ojv7mfvpkmm5s7dfep@mqy2hfmadmif>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <njcmjcrd32ztgxa7gwmgsmhszwsm5je3ojv7mfvpkmm5s7dfep@mqy2hfmadmif>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::7) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BL1PR11MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c91fc4-377e-430e-b3cd-08dc241ffd0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e4e2ynS2rNGWof/0IJPqSURO05oJ2q0XFsz1Hn+Fw2AACqiWfUBDbAx4qBba3R+dbsxKb6tBctpmpFfVHJXIfNdH74wDK1C2AX5ew9NFSJ+IxmNmqixmRl5NsWxia1YFZtdgU3DbTYGoxtAv0FNsWXQY4fRDYWMui/RotgrzE+9WoZ0ZH7SMpl/txLtTuVkKa/JjnMvtT4euiEuNCZ173RTqLarxhhaesXuSUtqMuH+pWKhNYeKAzlkda/bwFWXIwCt6q2R9bq0nsEEWSy+1Zkpp6nO4MdCaYf0lABhxA6bJR2L7X48THz9rltfyhaIIwn4XTNO6NQjdUHYYro0BfcEfmAzvElUwSz1xaYEiyuTNPHrlgynRYWjDCV28rAvv7NC7SevobyvjQyK7ojazACE5NVJkP8zV+JWNnOC5Jkvkzib9uLv+dpYmPyHTG3+Iwa+ayci/BcHFv845ETFYm64FUWW0VFceKMZK93lNmFC2Yz4PJZwrEcIUbbXJ4IEKgLoq/eKLcmy2o7a0I0cMWI/865GkgHkl3XPSxoytNiLr4iWpCeOxkGs/mI0iXvQZ9Ir+ZA2eZbCgf7fkPjwvNFJhC0QhZMQmGbLyjzJshmOcnSmz2q3sIy/bPp4OkpLQTvgaeb4QZBsgC5KQOW+vvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39860400002)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82960400001)(6506007)(38100700002)(31686004)(83380400001)(2616005)(5660300002)(6512007)(15650500001)(2906002)(37006003)(31696002)(6862004)(36756003)(8936002)(316002)(6636002)(4326008)(8676002)(86362001)(6666004)(66476007)(66946007)(66556008)(41300700001)(6486002)(53546011)(26005)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWFmSkhoOTdyOWlnR2J5d1o5ZlVpOS9lSGl5K2RXdGJPUCttS3BocWJpWndN?=
 =?utf-8?B?Q0dEQ0dGdG56QkxQdWtxNEZqSDVIME1GNytwQUM1NkcvQ0ZoNTF0MS9tZzhV?=
 =?utf-8?B?L2NqZmJ1YjhHV251UVd2N0hOTDJwM2F1eTVpZXFaSmZPZU9kUExpSEtRMXlQ?=
 =?utf-8?B?aVE5Tm1lYy83RUlyNC8zcXpJVTdOeE5DZm5tM0tmTWc1M3QxWUVGUkJqdjdQ?=
 =?utf-8?B?eEVKS3JTb2RpRXVvS0xiZVJZUlVlQUpPYnQ5NE41UzdMcHdTdzNnZmVWSTJG?=
 =?utf-8?B?SDhmekhTNXlBTGdKOXlYRGtHbGUzbWlJa0J6QXFYWmo5dDl6cXZETFBya092?=
 =?utf-8?B?ZXV3d3FYMnBIVUhRdFhlbTdUOGRPSHBKTlZHVThrOEdmNk50encxRUJ4UWd3?=
 =?utf-8?B?cHAycjRHSmc5Zitwd3pNQkZLRDArczdBaGM4WFJoM21oTk1TN3JLbGQ4UG1E?=
 =?utf-8?B?YS9BcWtjNElMdXJZYUJHZVhzOTdYUW16MDlsOG5rY29jMXNJWCtGVGU1WWlX?=
 =?utf-8?B?VkQzVnZWQnB6Z2FwTVAvdHY1TVNKUjdyQkZDbWJHRWdueS91TmZtVHpYZEpj?=
 =?utf-8?B?NEpGOXJmV2wwZ05FK0dzekVrNExHd0lhTEcwQlBIMHlycjFCRjQ4TW0xMUFD?=
 =?utf-8?B?VEFIUzl0VC9BMENnZ2gxR0NFV3plRlNkbWRIa3AwaDFBbEF3N0RBVlRXeGhQ?=
 =?utf-8?B?Y2NWQWYySXB3ZjRzVFEzby9DaERBS3Y1dXdVZ05PZmE3ODFJcVloa01tdWcv?=
 =?utf-8?B?cy9wL3RzdExqK25ZcGVsU1pOOU9Ic0tmbzVTT0RXTE5OejhiK3V1OE04Ujl5?=
 =?utf-8?B?SUlXcWJGWGV6ZUlCN21nbm4reDRLSndmWlZvb0FNL2NpeldITXF2cS9KMER0?=
 =?utf-8?B?V2tjZ3RqZWZ6bFAwK0RlT1VrUzN6amtaR0U1TGdzdkoyN29XempOam1sdjNs?=
 =?utf-8?B?aWgyRXh3QzVvT1FhSE11Y3FreE1xdUwxQVhpcktqUGZaRjlKWXgxS2czanRT?=
 =?utf-8?B?ZFp1eHBUcUZmeUhpWE84WisyQ2NNWTBJbnpuSlcwNzVoQU5DdHhkcWUrYzF3?=
 =?utf-8?B?ZGhnRWEvT3BFYnlySDZSRkUxQlVLTXptc3JWN29NVW93aThIU0Jpd3JSd2x4?=
 =?utf-8?B?WHJXQXVIVTFlUGY0dEQrZHNxYjNUUHBvTWM0SnY0aUY5RlFoR3pPcmh5UzQr?=
 =?utf-8?B?NDMyeVFnd3RjTjg3QVJYZ1FtWXphYlJRWVVUanNRTzJBeFA1Y0JFZjJoZThn?=
 =?utf-8?B?eUswWEppQ2RyMW5xS1NoUnd5dGJSZFVPa29xTUM1ZHg0R2V5VVdlQmNJZG1Y?=
 =?utf-8?B?OUZKdEcyVXo1dkFHdHNCRXJlampUUDR0aWlXVllxdXkvZkl4SEdML0pWQWxa?=
 =?utf-8?B?YnFQVXNvR1QyWlIwS3FxM3YxcEFpcDFVaWJEbXAvOW96c212b01INzdvTDBB?=
 =?utf-8?B?WFA4VmFkaDMza1V1aGMvREZvQmd2V3prQklzVmdWTFViNXNBS1dQK3YyTnFN?=
 =?utf-8?B?WHRhUUtuUGZqSVpzMC8zRGczSEUySTlGRWwrWUFZenNBZ0tuTGtLMHg2YjhM?=
 =?utf-8?B?MjVLbjlWSk9rNHcyZlpjNnpwNG9BdWwwYTUxRW9qQThMSUVhbVg1Z2hYbzVj?=
 =?utf-8?B?ZUtJMlNKSVAvM2dsM0o0RnlOT3VmM1RvaW5aaDdqNFZhYTVNUmxPWlNCVm9J?=
 =?utf-8?B?ZzdQRms5cjRWQmI0Y1NWYlpPUFlvV29VZnBXS1RFbFN1eVNXZFEwZFBtbmdK?=
 =?utf-8?B?UG9PblFLTlJRMndTak50WXIzU1BOVjU5b2lGOEFWNkFNRStuNmhEbmpjcUpU?=
 =?utf-8?B?WjRjOW9iSTZ0UURRSzZjcllVRWlUckc2ejhPeEJRS0xXL21xMW8yVG4yTHl4?=
 =?utf-8?B?UnJjU0NQSVFCRFhOZndiQnJjTXlkZ3VxeXJ5QzVXOXlYOThsZ0JqNU1CUXNl?=
 =?utf-8?B?cmZhaXBVTEVOUUtLODBFYVVhVmQyNCtRR1NCbmozbEZMdWp2Y2ZyeGVreGhD?=
 =?utf-8?B?OXRwNlJaSFR3clk0T2hrWXI2VlJXT0VhYmZRbXVucjJxM2dvWXIvMWk4V2xR?=
 =?utf-8?B?alppd3BsVmxCNy9NYzlFUFdwTTRYREJLem5vZG5udjJnS3BzNy90eEd6SE9B?=
 =?utf-8?B?emVRN1dJbXhSaFBvSExBcWl6T2tWWWZRajRIQUtYelFudWVOZDJaRGlZaGlZ?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c91fc4-377e-430e-b3cd-08dc241ffd0f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 18:51:38.9529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XotyrRyISLV5lI8vqtDYVvA1dLgCyxNyW8jtvAmMCM8c0ruRHqjlVWfefHLjGLsbaukYx+x6GuefglQXV+Rxxahvy4gPIHMxYjNO0A1rQnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6028
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

On 2/2/2024 08:53, Lucas De Marchi wrote:
> On Thu, Feb 01, 2024 at 11:30:47PM -0800, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Update to the latest GuC release including the first release for LNL.
>> Also include the patch version in the expectation check as it can be
>> important.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>
> For CI to be able to test this series you have to do:
>
> a) be on top of drm-tip, not drm-xe-next
Is this instruction special for this particular patch set because of the 
for-ci conflict? The wiki page is definitely still saying to base 
patches on drm-xe-next from fdo:/drm/xe/kernel.git.

Is there an Xe specific repo for an Xe specific drm-tip? Or are you 
meaning the genuine drm-tip from fdo:/drm-tip?

John.


> b) revert the commits from topic branches that would conflict
>
>     e4cfe0cd9819 ("drm/xe/guc: define LNL FW")     6fed16fd875e 
> ("drm/xe/guc: define PVC FW")
>
> c) Add the patches you have in this series
> d) Add back 6fed16fd875e with conflict resolved and mention that
>    specific patch is for topic/xe-for-CI only.
>
> Lucas De Marchi
>
>>
>>
>> John Harrison (3):
>>  drm/xe/uc: Include patch version in expectations
>>  drm/xe/guc: Update to GuC firmware 70.19.2
>>  drm/xe/guc: Add support for LNL firmware
>>
>> drivers/gpu/drm/xe/xe_uc_fw.c | 50 ++++++++++++++++++++---------------
>> 1 file changed, 28 insertions(+), 22 deletions(-)
>>
>> -- 
>> 2.43.0
>>

