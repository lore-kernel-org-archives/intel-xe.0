Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14A9C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 17:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772ED10E113;
	Wed,  6 Dec 2023 17:48:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6148910E113
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701884899; x=1733420899;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZUElYbgImrJzWmjYqV8lT7XKObxHz3AccPVQt/Lpw7E=;
 b=mLu4NfdT4b5cqBgrclwJioALQAqBcKL8xL0dkFHVMJOqgbjpcWeN7T3x
 4X8XwA6IEpTTcariQZtNVwVk5P58xVv93ASx35gZetUp99u6Oku1trLoF
 ZQhBgfCWiIsuckbcJCgGemgksDvKqBDVh7FO69rGsqarT4MwW2aR+FjOP
 /Ei5l1XlOhBISDc6ZfkzNME2Z1bnuesEx0vgs93Zi8t/iqZWgzk6yrukj
 m4YPjxBAV3LGpbnTvVhrd0QzcPeDaUYqauZEbNMwo59avRdGyr5Urj54m
 umYr/GLyUk/fqB4yE7sIcCx2EIapZBMZgsa+KT9AMXMa8uiwKvvmUaNQU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458422281"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="458422281"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 09:48:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="894812962"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="894812962"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 09:48:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 09:48:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 09:48:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 09:48:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 09:48:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aocGNAo0qdGylc1VkHeNVICt7GIMgXnnz5sv8UCabCERir/nUCjIRDmo191t/cRU/GiTdAGXWPgJBWZB825iiPLRaHKFpbrp/iEBe29BO7fsOntr1EnQdzvcw522RNyl7Z18ko3v7gPIJIhHi1SIbO4kgeImZ/xX3GWP0FMSPjlFrv/lEs0APy6a7phZ0+Zpun78m41VZGkrXNf1ZvyOdfWSREBXw+jppaDgH6vy/ntA7fh3UWKNKnHVkZpflWykYOlDbtrPrP7dDCEAqe0r+4Yhgnf9k84CphmC7u8LlqwcZ8CjyyqkcI2bItC2ciPNQARnGL9aYbWm8ecjA7FXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJUV1GqxFUK52dQ3AUI6/sqKduYoNo1W8FdYXk+iTIU=;
 b=iaTk3YbW7wU84WUnUzUZ0oduhS94os5oNlIXjfO3UnCfP84ibcDf3AmaqjzvZsD0GPYjONOQhnBFY3mkiMMHkyGfzc6nqs47pwi9O6R1IIsQYZyZhyx8Tj2nAE9d7+JEo2lU9s9jF8g3CxE8JzuC+OGD0+IPwnoKeBgnm8nts3EzqfrHnMStbcOwrpQysmKzYTDBOiKurh+rl0oIVwsb1nfAzIlSRPtUDy2KHUOfpJE1afIBV5ixHHUoFBq3tC3Ot3mgx/LbWZkyn/qckRVfHao3QyvP+8VB3J7c4m2ztJNpr6LVZEwMW/mQEhg2xx+N2l2S9vHp3OnTrNCu4rdWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6376.namprd11.prod.outlook.com (2603:10b6:8:c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Wed, 6 Dec
 2023 17:48:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Wed, 6 Dec 2023
 17:48:05 +0000
Date: Wed, 6 Dec 2023 11:48:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <3thkin72xw73v2rnbqd4reuuehwqzfioyuuyqfqospv3vabxfe@27ggwnwadhcv>
References: <20231206160617.7-1-francois.dugast@intel.com>
 <3v6lvfmd37hezn6tudgzrwv235f7wv4wct4d7zswa5qres7sfx@jovwzf4vgh2l>
 <ZXCgqvhDlMiEJNFo@intel.com>
 <wpaxuzibwzygcbkoxzznwvjmb3ruvjbfauzvbkmjebq6jyxlx3@krcvv3no3x6o>
 <ZXCyg6rlskWo9T2P@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZXCyg6rlskWo9T2P@intel.com>
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: 00986eca-bde7-4870-1cda-08dbf6837ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CY+7yBDPoIsELwI1pBc16vMK97LRKdrVNO2jwy6vLp1hp1JSSZq/+LDxQWIfUUSx85in9UeWUj10ttV3SeyifEOD3xxWngb3ovL4jPxUkTgxd4jZ/Um/C3UF7GlqX5tNPuWcU8JaOnlTzN702Yx6ojUNnzsr+7vKOBTvSVVrR5SbaTD6Ol1UumaJnQYVH5Uie9hCxqZAiLWLhkNsYSzc71XYvgyjlLpVsUUK0C8AzGdXN8a8E4fPLE0fVONntqhAGTLlVtElHDUdQmqZbnDxslyfm7hSXjDmc/2Wwlv79iaCMMRCE532z3J/TBpZssKxXvX2rWu5EQAma9uvc0dWeMVmtAjnOSY9RR/rOBqdbVslvmAu4hqIVYL3TpnD+HxuY10y9Jj2XNa9cQoFEpbJ9h2FC9Fz0PkcqJD38Mcbd+FyjzHaU7bWcpAU3e0x7li9DMDITzNQe8FSWiAk7uIm1ofOasKd35nsWILIbc6GFzX63Ok7HuJvqumtMySJPFAe3Aq7CnrhO6yUM3fbcCZVDKosfi6cHGPZSRyfVmCg1Ir1k2q7MH9mFyC8llGMCYa/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(376002)(396003)(366004)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(5660300002)(2906002)(54906003)(8936002)(4326008)(6636002)(8676002)(6862004)(316002)(66476007)(41300700001)(6486002)(6506007)(478600001)(66946007)(26005)(9686003)(6512007)(66556008)(38100700002)(83380400001)(82960400001)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iJQ/CUIztdfvUEjSknUSEGvbk/LioGQ8IaN1uXRxDExZLiSe4qFITKFwdzBP?=
 =?us-ascii?Q?SAw7Mvh1hvFDnUkHMvzZAgk9VwcntACMyh3XwmKGjpJjJ0MqJQbPiVfMmrBz?=
 =?us-ascii?Q?plwOlEzZoU1op3EH2LX5YM1H71emY5VLh/UuyOGrszOZl8MsF74JMaOCE89k?=
 =?us-ascii?Q?xHPlm+VPi03rv9SOu9eFwgsGPeUXl1tdIb1d+qrY7YC1jwZCA40CaNOVnz0F?=
 =?us-ascii?Q?a/lINAuTmhkBXdRC12Fa/yhnrfdPFt1pHMBobN02EBh+flLXgQHsbPjZgb51?=
 =?us-ascii?Q?sA/YUCB4tG93xVrSRa3TiU51QXpu0s/I+BXmf7l+TSgyHRJzf603JZafr/A5?=
 =?us-ascii?Q?t0PMwI0Wu0fg3Mr9gK8JPdDdTvB7qEuqb1Z1IoM6CEWM7ie/TWz0HtwxnmWv?=
 =?us-ascii?Q?22xqjfLTBCGnzMyGdHKsbrTj8l7ji0hit0J0zhw/GG1gNJ0+B8WUFsxjpmEE?=
 =?us-ascii?Q?PeYUwdybNIWcbea4SYoY+yy+s4Va4G4pwp73eN6f7iylS9yhxME+HDCeutu2?=
 =?us-ascii?Q?vwtV8BdvV7UNEw3oZKxYwu9pN0h1dw+xl0AB5nVjzK3iQ/PHAra0o/nC3yZw?=
 =?us-ascii?Q?hftAGpMkTuj8kfAWAO2VleUJlPOfwGq1ZnbDJeuXp7zZ5HDtqhjSol0oz/tX?=
 =?us-ascii?Q?QKrobRGmOimZszlUhehT9YBV4BfFM947590EOeYE5BduJk4MvkY09PK+M4dL?=
 =?us-ascii?Q?uGUknXe5NfO/GQyQRErPiht1oBY8uXPX2+Br/YdN+PBmJS0m6lod/kvEoLdK?=
 =?us-ascii?Q?ms3e8P7zmI9ojPte7htdx0fq89fwUED6gQzKBW6DMXQUNyF0XoyuNqtvKeCw?=
 =?us-ascii?Q?XhP0hhKYMUEt/QE24xfT2hzPw3DieA+d2xfXqp8DtPSV1Tu1Z+lpQruGznDP?=
 =?us-ascii?Q?gu0Q/PNCFLMgZYIIqjB5MWDV78zSi2dSmMNTckYZSuSafgOxxgtu8e8SwReP?=
 =?us-ascii?Q?TEwkIJrib0lUFJcZWmO26XacNcmQnfa48fpHh9uIZb8Ooa5Sc4UENfZ3g1nc?=
 =?us-ascii?Q?XleH+DeLAVwHiqDk4AQPi6VWGTsBx4fnW4SeO9cdT2UDfACQsf7eSM9qxCoC?=
 =?us-ascii?Q?hu+AM4BiJXb6NjW5oFluKVSPX7NWm4VaWao6OGeca2paJatQ3SmsVQEL7WrO?=
 =?us-ascii?Q?AAJeOYygvooX8GPhN0cSvNDmC4HE18r8LLXxVdmcvbkkIyjBjq7/Tj+TgBvQ?=
 =?us-ascii?Q?GoQq4+ZLXwuQzsmVzqhFbQJvZ9mGJmif/UPDMJB+RjejgsRpoc7YdtFF6LaB?=
 =?us-ascii?Q?AY9iXOpspVpS8IAX87G6nXtfVx4pb7BgHgcRHjYXshthS3iH65J881VxLNtM?=
 =?us-ascii?Q?8minsghXZvCY96fMu70APAJ0hneRADxEt0NaL/uXY1W9i72G46ibkXKfJaKl?=
 =?us-ascii?Q?G0VitT7D5oIFsaVlXZDdYdNK8XNvn0A942C6PIS/PEJIkRo0fuvACtA6+BSW?=
 =?us-ascii?Q?nJgx3OjlKq6MsWWyjzbOBHlMbQYKQCk48lX2Jpgf4K17aleIYcg9a+eVWjd0?=
 =?us-ascii?Q?jPYJT1AUE8KNUpvUVC8Sq+/Q2RqbQdUCvw2kG5Xjo/4s2VecWOGQhWMmmAeY?=
 =?us-ascii?Q?OwBe/sqb6xl9l3s9SCSRgeI/8n+crosBEb4fm7KSjQiSmq4mTvLxAdElBnhc?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00986eca-bde7-4870-1cda-08dbf6837ff2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 17:48:05.3102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBzHzemjXF+7Jz5l/5VzWMOWaUVjBthqdYM52yjmgaY0CR67VmrbBcOyqeOzBmOJSG6ncZohdy0JKDI8Vup2i6FQjd02R33qyhJ70ybbJIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6376
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove
 DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 12:42:27PM -0500, Rodrigo Vivi wrote:
>On Wed, Dec 06, 2023 at 10:33:35AM -0600, Lucas De Marchi wrote:
>> On Wed, Dec 06, 2023 at 11:26:18AM -0500, Rodrigo Vivi wrote:
>> > On Wed, Dec 06, 2023 at 10:16:22AM -0600, Lucas De Marchi wrote:
>> > > On Wed, Dec 06, 2023 at 04:06:17PM +0000, Francois Dugast wrote:
>> > > > The exec_queue_set_property feature was removed in a previous
>> > > > commit ("drm/xe/uapi: Kill exec_queue_set_property") and is no
>> > > > longer usable, struct drm_xe_exec_queue_set_property does not
>> > > > exist anymore, so let's remove this.
>> >
>> > my bad, sorry
>> >
>> > > >
>> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > >
>> > > should probably be a fixup to that patch? Anyway,
>> >
>> > no because it is in the uapi header that gets "copied" by the UMDs
>> > and IGT already merged and Mesa likely... and we cannot do fixup
>> > on their sides.
>>
>> wat?
>>
>> any UMDs would just copy the header and point to the commit it came
>> from. It doesn't matter if we used a fixup or not.
>
>But history wouldn't align. If they have already merged the commit with
>the sync pointing to a kernel commit that we do a later fixup, there
>would be a mismatch. Anyone looking the history in a later time would
>think that the UMD code was wrong.
>
>And instead of blaming me for having missed this line in the first
>commit they would unfairly blame whoever authored the UMD patch
>
>right Jose?
>
>But I would be okay with a fixup if that is okay for Jose.


when a fixup is amended, it's not like the commit remains the same. You
will have a different hash for the new commit. Just point to the new
commit which has the same commit message as the previous one.

And we are still on top of drm-tip. All these commits will still be
rebased and have their hashes changed anyway.

As long as we keep saving the tags so commits don't eventually
disappear from the remote, we should be fine.

Lucas De Marchi

>
>>
>> Lucas De Marchi
>>
>> >
>> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> >
>> > >
>> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > >
>> > > Lucas De Marchi
>> > >
>> > > > ---
>> > > > include/uapi/drm/xe_drm.h | 1 -
>> > > > 1 file changed, 1 deletion(-)
>> > > >
>> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > > > index dee750385161..346007e8074d 100644
>> > > > --- a/include/uapi/drm/xe_drm.h
>> > > > +++ b/include/uapi/drm/xe_drm.h
>> > > > @@ -53,7 +53,6 @@ extern "C" {
>> > > > #define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
>> > > > #define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
>> > > > #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
>> > > > -#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>> > > > #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>> > > > #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>> > > > #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>> > > > --
>> > > > 2.34.1
>> > > >
