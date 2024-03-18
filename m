Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B887C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 14:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174D110F7BE;
	Mon, 18 Mar 2024 14:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3/SqB6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0AB10F7BE
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 14:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710772052; x=1742308052;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=35dAYGfzLCpTysfRCNDxwnWyC5aE+s2ky+8vX4Rl9dI=;
 b=d3/SqB6+PAGgXC2qFKAtuufk4TBqaHqbmYAO/lrTUyl8DFm/QRcsa/+k
 lj/1L0k56uEaOUNY/UV9OUa0qY4bJ8FijeFcjlQ9+mbh2Pt/GlmPQYA8a
 CRngCtkqK+NF77Oa4LeSOiDX4KWE/rNEy9VhZ0L4mOQTnRu1+dho2kWeR
 o6vl8atpCxsmS6NKvatVBMhE1epFabixtxLXUjVPvQVZT/hwb6gYp08l3
 VIm9hv2orwOkMtxCsfLekiKvouJkar1eNRiGrI5WcqWEfc+pJbfGow0dh
 UBnJeC9/nkuVubz2X8cWN7wHt3bZvVj5d6q5m5tdXq8k6MePA8dINQMTE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5711207"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208,217";a="5711207"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208,217";a="17973992"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 07:27:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 07:27:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 07:27:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 07:27:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROb7ScpskxP60HfLRnvkYD0ajCuXZbXWJzavT4Mk+jo96uxqkvLGxPZ04by8dJyQMAIGVGZ28Pf7UYU1T4oAzwwyhVe1k+OLCFErmd1otW6ui+XogR8Gi1H9P4hS3373siXoofIvF9KQbjkJtLstTLCYrhHN3lLxjaTR83LPmiOLADHKguO3Nj1xYGsqGh2jDRo/1xZqJC8exYsAvqHt6R8gpwsjf4utpQvIYsA6H3tJ3AK92XEpXJ8CjFglWY2mCj3RZpU6Otl5LELKv6wvDnVpa8sFeC4ZYT384lM+HZ4xJJfF2YUa3zvR5VWR7m/zInX2eb2WACXWk2fGk7+4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6lVD4VSU36EBWKTqGBchOLKqybkXpZiU3eZmll1QAM=;
 b=ZuP8HBCI6JuaXJmiJU230BUja4m6kXnwMBUVURNgX9NpXxhBg6w1YU/X/PLORMHepe1zt6TQoo3Orz4XuVbKJgdkrWn/c1ni/ff0ZuUZbbPRQBwTZgLc3Phi3aN8CPyMNXTHKtSLoGRJByX2a217na8Dx6QJ1Z3Q0/xB5tLTNq8tpBHlnUjU43hmOZfefXoM+XBl4XcO1vOaG+O4uvfcqyiqG4MQFomqImVLCzkkUnqNYLkNqUnzcsxjOAspGc+ajzUNJb4Wb3f00W5lG0StA4i3HMGoUXdOMFuM3GAGDu+jw3EfdRtmx57TCp52Z+vANctunEHuWIEUdXKCrvdMIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH8PR11MB6949.namprd11.prod.outlook.com (2603:10b6:510:227::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 14:27:28 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.015; Mon, 18 Mar 2024
 14:27:28 +0000
Content-Type: multipart/alternative;
 boundary="------------T3IdZT2NpuCFV7T0M0TSEZQy"
Message-ID: <6bec64bb-7ec0-4945-b3ff-411c739cbab5@intel.com>
Date: Mon, 18 Mar 2024 15:27:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add a WARN_ON for NULL job in
 xe_sync_entry_signal
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
References: <20240318135000.13032-1-nirmoy.das@intel.com>
 <20240318135000.13032-2-nirmoy.das@intel.com>
 <ZfhN8C+KN+Idi4nz@DUT025-TGLU.fm.intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZfhN8C+KN+Idi4nz@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: DUZPR01CA0191.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::20) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH8PR11MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9a63ea-d547-4690-8e2f-08dc475789cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v+QIAZvY3Ovxj4d+72PrRQUB6MQxejImiYivX7iheYBBiBSGUtnsXnWd7r3Tj/B6itAYrpOZzKd6AGelaWmwOVqB63744EFUsmVYyWXrad6udj6coTRsLd/OdGg79oI8NYDQx020XQCNa5O7o6INzMIcbJBWFENF8Dh0O7vSysYGScGrzGgN6ea1bWDLjVVhIHO1fTk2gR3jKEiqhrDSGtahGCvuIznyAEct/BWFzXk8YVfwOOgTWwsf8tWzV+jCjxGLSF8NoCOA2IWTfgvxwr0KPXAudn/paEMDMznWrc7Yui+CEK4qfpbD2zWGrxaEfzgHpaQtIMY7D/l6TlDb3omnK8dCLwVCbcVN9dUqkqe0oT8GlMjfVMvtcjs2SobD7rb9I3a2l+RVF3Jkn/AOrtijQOgK8CbqU+JGplXG3Siltmq4wem1k6JztcvfIHSaEwtUyL5QjbbDKU5rBqWBCMZ1gAum8din8M+AjT3MvAcnOdcKDXynVqD7TaSQCp1cBtdyDG3yw9UDR/ChNei4iuZ5aS6bdbN3emQUjsXESsu4Dia4JhYKLl8kWTZ62OXv9LmOGezlJaZlK+Z355WjOIx0FIlAFrK6KBkQEphIRiUZPGIEGJ94n23gwsv8VLD24j1TlQtnuRp7VqH0yoxWCoFHjaKKihj8OGuskgl1oik=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ay96UFJGWjQ4blJjeW9iV2dvTTdqVWNJMjNEME9DQ1E0OHNFaXpoWG9uRWpU?=
 =?utf-8?B?Q3JzQ0VPZGRTcUpSbHMyQmhOVGtvckE4OHlqT2dSRG03MkQ0RFRsRmRibDd0?=
 =?utf-8?B?SUljeUVSRzJuamRLMDk2aXgrN1lXdStnbzlsTXBUM2dtZWlSMExHQTg4UlNH?=
 =?utf-8?B?cFdXWUVPZWxoRzJCZTVRWkJwYURXdmh5V1BTUHk3S3ZlMUh1WWFndGJoREp3?=
 =?utf-8?B?ajJIR0RUK1JBU0E3am5jMUsxVFdROE00c0dHNWRhZTRKRTJ3QWxWMHhLcy9r?=
 =?utf-8?B?Tkh1UVk1LzNiSWhyc2NxMWZXT2xNUjIzUWE1ZGRDZ2trd3V0ZmYxbnhEblhO?=
 =?utf-8?B?aTgwSVJ0T1lFWjg4MTlZTWZGbmVaRU52SUY4RThOc0pkL0cvdmJPYUxmYng3?=
 =?utf-8?B?dlNvbDBEZjNER2hFVEJla3lNTTF1TFlXWVMxdDk2Uyt0SDRuMElpclRVcG9t?=
 =?utf-8?B?S3lsdnNQMTk5aHdUMUYvQ1haTmdGWWpMTnNLT0QwL3pFNjhZL2hic2dJM1Mz?=
 =?utf-8?B?OGZZY25PK2FBcWU5UzZkUWxBdXZUZkcvczdVNjdzWDlMUm1tcDY5YXlkWHZM?=
 =?utf-8?B?emJXUkdoTm5lUFBmUk0wYWlCMjE2MlhDVnVwYVN3SzA5bEdXWldSelZMeVdL?=
 =?utf-8?B?U1NXR2NXOFFFbC96eSt4dWtWU0FyZGQ5ZThFWVJxR3IxMytrSXRsQm53Y3ZK?=
 =?utf-8?B?dDFNaUdHT1JIQTdOU00yRTZNSGkrR0FFWE52cFdZeUo3MzNoSXBjNVF3TG52?=
 =?utf-8?B?RU0zSERXZzRSYk4wakZtS2lxMm1ZTGczaHZJaE5BSFp1SmJNZENwOE5XNG5S?=
 =?utf-8?B?TFF2UWx5K09INTFRYTJpVkdDVU9HRHlUWmxDd0dLZlR5YmtqMG9yNjdyaEg1?=
 =?utf-8?B?ZlY0VmFQSXFOY2xYYjA0bXlSU1B1QTNweU5oNTNPUENKeStkWEE5dHlxeEhB?=
 =?utf-8?B?Q1hyZSttTTdqY3JiUUkzRWpYSDlheDZ4Y0N1bWZPeXVmWHVPemZUclQ0QytT?=
 =?utf-8?B?NU80WHY2ZituT2MxQWNjRmtyUGFwS2xkNHpENUpQWjdia1gxWTcyT2x5cEdG?=
 =?utf-8?B?b2ExZGRHOU5oQlEzWHdmZG4vV2ZKaWpSMGVwQ2pzQjZrL0pOWmFua2RFMnpU?=
 =?utf-8?B?ejUrdmRtUGxlZ2EyQVJtak1QRWNQcnY4MFBkLy9yYjlaK2o3YllkQmMyUDJV?=
 =?utf-8?B?VStBdEJ6V2VjZXJnS0Y0QW85WG51c200Q2Nyb2VzU203dFB1UWV4Yng1Titn?=
 =?utf-8?B?Z0FhN3N6YmtkbS9WVEh0dTEzYm9pbzhCc3RMaTQyMjlIK2NXUlNQd3lVTFFw?=
 =?utf-8?B?Sk1adWJRcExyZWlGa3dldjZTNU45eFFvbG5yMHdLZTFUeXVJVjh2OWFTZ2Vv?=
 =?utf-8?B?Q0dwdGNJaWlGZWlSdlZKY3h1OFVRTVFLcUVlL2ZSV2hFYXE2WGJyU3RLb1Yw?=
 =?utf-8?B?Z3I1d1dsWW5KSGRUMUdLMTNMd1lvMFVPQ1RobC9uZWJycWJyY0VEL2IwNk8x?=
 =?utf-8?B?Zi9ZN1ltWDhiRnUvZGhYaW8vYkxwY3pDaGJETDNaWCswQXR6SW5JbTQxdXhS?=
 =?utf-8?B?cGRabGFZVmVIbnN0cTBoSXZMVVovbjdOaURINWZwZjFwcjBYR3hlQ3d2QjMz?=
 =?utf-8?B?Ull6bGFHbzFnMjJJa3pOemlmZlB0ZkhzOGRjZGFZTWpnM3FwU0N0MTV6aFFM?=
 =?utf-8?B?WldNUlZEdHdlblRjSTZqRS8xZlZSUGRhWXhlaXlPNlJyY3RyK1FvcFBIMlJW?=
 =?utf-8?B?RWlIZ2JOQUpOWm43T3ZzUWhsbnFPMDNEa0ZrdnBFN3JOM25OSU96Y1F5QVNQ?=
 =?utf-8?B?a1MxWGphYkhLTHMxQnZwVDJvQ0ZucUErVXFoY2RxUzV5YXlNbWNrU015Q3ZI?=
 =?utf-8?B?bVF1NWJqZDNiaWdVSjB2RXNKUy9vSlJaNG1MY3ZKYXZ6RkN6N0JrZHcxbmxp?=
 =?utf-8?B?YUVpclZ4OTQvQ24ySnVrQ3BmV09ZbjFhSk9MUVQ0NlN5REtwVzROcW9Nd0l0?=
 =?utf-8?B?OG1oZndCVVRweUtJOEcrK3VjVy9QTWR2YndVRjluSmFGYlF5cUxoaGVUUjE4?=
 =?utf-8?B?eXl0eW80MlJKai9pM1BISWxQNUs4TnZ1MzVOUzZQRjE0UVZuM29Cb1NwQXJG?=
 =?utf-8?Q?MQUHkZ76jfuPGcyGAj6z/uaT2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9a63ea-d547-4690-8e2f-08dc475789cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 14:27:28.1765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfDJDMZTPaxOGqHn6Vp+SEQLSu8+1ApZyDdP4e+yZfRSFrxQuUDnAotB9fsVq3dFYo+7LCl8+XYUPbX1bAyZaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6949
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

--------------T3IdZT2NpuCFV7T0M0TSEZQy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Matt,

On 3/18/2024 3:21 PM, Matthew Brost wrote:
> On Mon, Mar 18, 2024 at 02:50:00PM +0100, Nirmoy Das wrote:
>> Add a warn for NULL job when sync->type is
>> DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming
>> error and should never happen so warn and let the kernel crash
>> if that ever happens.
>>
>> Cc: Matthew Auld<matthew.auld@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sync.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index 02c9577fe418..2b45950aa0af 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
>>   			dma_fence_put(fence);
>>   		}
>>   	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
>> +		XE_WARN_ON(job);
> For a warn on you this inverted - a WARN_ON(true) will pop.
Thanks,  that was stupid of me. I meant to do "WARN_ON(!job)"

>
> But I think we should actually use an xe_assert here which has this
> opposite behavior - pops on xe_assert(xe, false).
>
> So the I think it should be:
>
> xe_assert(xe, job);

xe_assert needed a xe device struct which I can't find a better way to 
retrieve than to pass it on as new argument

I think that is bit too much change for it. I will resend with 
WARN_ON(!job).


Regards,

Nirmoy

>
> Matt
>
>>   		job->user_fence.used = true;
>>   		job->user_fence.addr = sync->addr;
>>   		job->user_fence.value = sync->timeline_value;
>> -- 
>> 2.42.0
>>
--------------T3IdZT2NpuCFV7T0M0TSEZQy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Matt, <br>
    </p>
    <div class="moz-cite-prefix">On 3/18/2024 3:21 PM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZfhN8C+KN+Idi4nz@DUT025-TGLU.fm.intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Mar 18, 2024 at 02:50:00PM +0100, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add a warn for NULL job when sync-&gt;type is
DRM_XE_SYNC_TYPE_USER_FENCE. This should be a programming
error and should never happen so warn and let the kernel crash
if that ever happens.

Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_sync.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 02c9577fe418..2b45950aa0af 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -255,6 +255,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 			dma_fence_put(fence);
 		}
 	} else if (sync-&gt;type == DRM_XE_SYNC_TYPE_USER_FENCE) {
+		XE_WARN_ON(job);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
For a warn on you this inverted - a WARN_ON(true) will pop.</pre>
    </blockquote>
    Thanks,&nbsp; that was stupid of me. I meant <span style="white-space: pre-wrap">to do &quot;WARN_ON</span>(!job)&quot;
    <pre class="moz-quote-pre" wrap="">
</pre>
    <blockquote type="cite" cite="mid:ZfhN8C+KN+Idi4nz@DUT025-TGLU.fm.intel.com">
      <pre class="moz-quote-pre" wrap="">

But I think we should actually use an xe_assert here which has this
opposite behavior - pops on xe_assert(xe, false).

So the I think it should be:

xe_assert(xe, job);</pre>
    </blockquote>
    <p>xe_assert needed a xe device struct which I can't find a better
      way to retrieve than to pass it on as new argument<br>
    </p>
    <p>I think that is bit too much change for it. I will resend with&nbsp; <span style="white-space: pre-wrap">WARN_ON</span>(!job).</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite" cite="mid:ZfhN8C+KN+Idi4nz@DUT025-TGLU.fm.intel.com">
      <pre class="moz-quote-pre" wrap="">

Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 		job-&gt;user_fence.used = true;
 		job-&gt;user_fence.addr = sync-&gt;addr;
 		job-&gt;user_fence.value = sync-&gt;timeline_value;
-- 
2.42.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------T3IdZT2NpuCFV7T0M0TSEZQy--
