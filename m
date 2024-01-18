Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37490C47DAF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 20:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA06E10E907;
	Thu, 18 Jan 2024 20:58:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6FF10E8DC
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 20:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705611518; x=1737147518;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+Q1mQahXZDd1Q7Li1zCRmu6ZidNfLgR4cRz7uKCQ3kY=;
 b=P0ZmO3/3Rtd4+mTN1jwoUQ5X3aaJP1vmjet0SJG2I34+7WSBY5iWbFyz
 XroA0X1lVdOGJqcyItraaSSigNnR/ZKPtSJz4Yj3hzE1g2RF7b7buGSzQ
 1N5wF/mNOM7mc6EXqq/zIf6Q7Vv3DmB3kKotAvML/RNCkRCFmA/RR5OkA
 Tk+NgRGZGTjwgkC9QFkoQdtboNTuFNsEU+tzGwMA5OMfdxUN44XSUKAfc
 nQjCpysnPsJyavxj17CjAFD7+P+RGp3YUa1c2NaePI9Oe9l8L0YeB2Mhm
 zZKHsaczHXgT9J1V9JjhJ+4PU0lr/Bcw+2M/lpjfyg61UkJ2CgJJxkIZX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7668884"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7668884"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 12:58:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1031770098"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="1031770098"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 12:58:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 12:58:36 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 12:58:36 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 12:58:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJgogx9YtQj5bcifzGUxpvwjDVRv/ALhWnBG4bJfRzni+9sONdNvgiIEDHZ57moang8Q0rUYV/XWi1CGWQDXoFU8URWV/SmJgXkW33jqRMtq1AqtY5zZ/f8fKe2ohPM3JTm1Xzl3N+ocsVV3k+7QdbYku50FD4Zte2Ujt90TEiYb3w9gz0Wsb91O+Uv818iZ1Mz9UjmGPB9Lc5hDksZmW0TlUpV6ZqgV27qkbjGV+nXhWPVHUJDH9n+EqyREG2uGypNrvNwZgNRj2yeHpzChB3tEiRYDsDjahdokagQ2mP1hovgKXAghuDAza7eZiry/sa5TTyCwOFwempdCY4JDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SynoSXjYLpwd4K1pb2n7JW3gbridFCIPQeIVEJ/LDr4=;
 b=iN2n4BhUGSROb7JmkbQRroO6nU8/hQ72Dw4scK9VT3BnOv9hUl5+/n3bFOycIL+kCxN/HV2NsRSpjIRtwDD8zxKeWpkW/Wb038CwwlMboer072vu5bFrZZPCIKY+uJ7hD9d4noEGSKQPFRKLilVXISVWBh9N5XKyhNXyePi0vRTDc6YTQhP2bRtCoWcLmsZlQ+8JyZQVIGROiQ6kwYutZTLFPbQgSfljGEQqxpQackDtxR8+3wUq1iacBgfiR5MKL2ZeX5eO0O1OXtzcwyfkxiLdHOq6x3iZ6RtvuWsiaA9s3iW3PoKn5ZdmvRC2BTMb+uruQKSdHi2WTvmRw/D+Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB5892.namprd11.prod.outlook.com (2603:10b6:303:16a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 20:58:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 20:58:34 +0000
Date: Thu, 18 Jan 2024 14:58:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: Re: Re: [PATCH] drm/xe: Do not flood dmesg with guc log
Message-ID: <umt5wovebemjsdu64vzskml7u6cn26isgxkgyzs7dyb4yjipwe@gnmq5lt6tf33>
References: <20240117204059.345143-1-rodrigo.vivi@intel.com>
 <ztv76j5a2333n3sdl3h6nuulqcdscqcosambxe62rydprzpepz@mitp3w4jgb2o>
 <Zak2LTfFOPRulNje@intel.com>
 <osoxittwh6wna5rq3awbvzddqp6dsggbxg5xrfgcmft3bcut6x@y4vfqvgb4kw5>
 <Zal3oznvaamLHv6x@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zal3oznvaamLHv6x@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR11CA0045.namprd11.prod.outlook.com
 (2603:10b6:a03:80::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ffb98b-482c-4534-5238-08dc18683c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /uQXoVYYAGWZkjoV40zjhrPZdFWRAIMc9MHEyuKCjb/gZgLRGSw4bIpuC9vd2f9OwU1u06NCKRJIn3SOlcMwkis9SQ03S5g2zOO8LCG91A+z+ZzdSa9PN54bP7RWnnwuSg54mwDHou3JTJx+B4zvA4hObSGNPXJE3YWG32GR1WKx4YXh8M9fEYUIPo3NgzuS/XbXf76jTLEbatDEVsCp2CPC8M8U6jSMRaSFqC8Pu64wlVSZ+Y4nfNl2j5VmUszHcSyQbrUlwJsOofEt65fhiO/rEHN37kmcly4I8B4jaTzSFd8oYGLe7wZrmHad+ym9ZS96wa+sC9OuhZ37kmwzoMsltgoxQCXHtlYoDik18lB2QF5FTH+Rxe6QzmdlKVOYlhYijLC2zZ1/SiDq+rTvZ1PbuwvQxbSB5n9a1ovM8dOve1AvPPbQwzKSE4uuknCwHQYllLg85VnUuKeIgR3buCXcO96DPnlkEfA/QXXnd9zi4mkRvykxuAf/yLVhUxOX/d1GQn9qB4wSVcNnEQ/1aB40kzBla/xpaOF3M9Ddh3KsWGVMZUVK5cIEtUmYs02c
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(396003)(39860400002)(366004)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(107886003)(26005)(83380400001)(41300700001)(478600001)(6512007)(9686003)(33716001)(6486002)(6506007)(5660300002)(82960400001)(86362001)(6636002)(66556008)(316002)(66946007)(66476007)(8676002)(6862004)(4326008)(8936002)(2906002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lhsc3qBZ59qMa35+8zrZHuoG/e5aHbQSam5nmYec2pk2JYohnVzxP74SsAH/?=
 =?us-ascii?Q?awmO3fEUUZ37kuBsHI2OU+n+aAk4jzUNUkap15ZyupcYcldhLdNmFEtFXshl?=
 =?us-ascii?Q?HEX3m9hGTZLUylIlwekdv60BNPNasWc+bYAK9nZei0GjSX6JV/DU7c3o84HJ?=
 =?us-ascii?Q?e6h5gnBl9FwqJe8Rvs8o+l/F7uCSlUtShwvAQmfGANADkBS5AqdydCBe0KMc?=
 =?us-ascii?Q?0H7QNcI19e2XS/YQL4HYDQ65V3Teck3y448uV4U03uvoedDdJgKgoxw2CPPO?=
 =?us-ascii?Q?8jjyXLm43c5+obVH3TiVDhhf1blz6SWEW9Ck3eclKX4ZI5MCtdh2Ak42dbdO?=
 =?us-ascii?Q?FTN2aqryQ5tbXwqPKmsGQHUj7JCvJjYU+daQSiY+jhEScAtHFV2NlZmAGYnl?=
 =?us-ascii?Q?V6fS1s0mt1qhN8z9Ybb53cxLDNqIer4hrgiX6Vu2QdE9S0DV4p8QjKcbiOFK?=
 =?us-ascii?Q?fa6xrpLQOkwJGqiBXasHQkEiVozoM5djSHPSF/tSSiWPZHPyiPYB7hGidgk0?=
 =?us-ascii?Q?wCoPv6dfglymIoVBPkkhwd1HRZkjjjMVTJWLN5UaqSTfZu/I2eR+cn7TR4mk?=
 =?us-ascii?Q?pnl79X+Lelpf4yOj2E+XsgLAWCm8i0YkYSqZiozvUL3TNIQ4uMn3S0ai3D/v?=
 =?us-ascii?Q?4ZJUMTYod1JG/AK92CsQxnioT7EcJMe3BXRDpX/hhHdzBMM39E0nF1CON6kJ?=
 =?us-ascii?Q?reYPY6jPji0m0R5FbMc4ODNvF8EGNNChjEQwa5EBoybq+TYWIgT8GRu1ELWK?=
 =?us-ascii?Q?SKhvpQmakwH+zcz2kJqsduu31anUtv7+kRGafBp0qN0Nld8XKznUKV7jjFJj?=
 =?us-ascii?Q?h00zzRjdPJLP7lMmGtNwKEYiSwUqN2FGGEbator/IqIrnjnmgXX8Zij3TtSd?=
 =?us-ascii?Q?+q1lJLs97l4Bk1/aHRiRViXYeUQqrO+Z4LxNw1l0ars4C8lOrK6AMUUZ03dX?=
 =?us-ascii?Q?PmBN5YWcIqDj7DUgP2FGT575S1AUBdf39teOBD8IozXqYN7MMpJVS3xzVYhL?=
 =?us-ascii?Q?4WY2P9iJb0RYK0M7GRmLENVbKm6m9nnu5GHj23zm85TkrbbLN1CXL4QVD3Tj?=
 =?us-ascii?Q?Lg9mpn5Tfx8SityyJHT+HFd1j3pVAMZ8tU9m0+hO8u8XT4AgEBQ0H57aBeuC?=
 =?us-ascii?Q?B+mP/+75tZI2qno+lhtDB2L1zobFoq5XcgAzjvJO5qX0FZrQGDek1j1nWgOz?=
 =?us-ascii?Q?1mCL7zL+2B/pEirhNkJkifZSbVUAsO0HaQCimVQVuKIPuIVEV1kL4q1qtekd?=
 =?us-ascii?Q?XrekYh+uv0lZZz3lV1yepPAP3Dxr352pQ+xkf1pOnJGYsm3SHu4mXWdw7vEi?=
 =?us-ascii?Q?l1ezLr/X4CgDiayo1NwXE1rcc2sx+6IgqrMf3jAOGbw98O9dEDrw6QX6PJjA?=
 =?us-ascii?Q?MNMjTm5jMr8jpC4NZpjNLfzVpfyYqvRdCNRc+cq0qtXSkxPHkxlkhWKOx5fV?=
 =?us-ascii?Q?efvD30am/ieWvpbqUNcdLW9CWFMNRJYpW9W3/aqXrIho/RSfSXbFGYXIqhHb?=
 =?us-ascii?Q?Sg6pV58GIceZ2k7Grph2Il0t/aYcc5L71NCPSwAwUKPadYk+PL1rV79lf8E8?=
 =?us-ascii?Q?64A0dbptcwHQLTUQiloElX8QRKXa3g9iuMtakJ8e3ZI88XahdgKeLhsCfrL1?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ffb98b-482c-4534-5238-08dc18683c2c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 20:58:34.6283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufEDWrQZRPWL2QBlbBhzwS35PX4QLNPKg0+1lBmfOfLmdAjr9J6/kUceVOkDW2AL2T8A02fp7CcXIhV0jYtZiMfO/t0VMgbl5SstBNgBanE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5892
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 07:10:27PM +0000, Matthew Brost wrote:
>On Thu, Jan 18, 2024 at 12:16:27PM -0600, Lucas De Marchi wrote:
>> On Thu, Jan 18, 2024 at 09:31:09AM -0500, Rodrigo Vivi wrote:
>> > On Wed, Jan 17, 2024 at 05:42:00PM -0600, Lucas De Marchi wrote:
>> > > On Wed, Jan 17, 2024 at 03:40:59PM -0500, Rodrigo Vivi wrote:
>> > > > This information is already present at
>> > > > /sys/kernel/debug/dri/0/gt0/uc/guc_log if needed.
>> > >
>> > > but is it persisted if we couldn't load guc?
>> >
>> > well, it was there here with the same content that was spit to dmesg.
>> > Maybe just because I got this after a resume?
>>
>> not sure. I remember past debugs I had to rely on the guc log being
>> relayed to to kernel log when debugging issues on the golden LRC
>> submission. Honestly I don't remember if that was with i915 or xe.
>>
>> commit 4bc3a34f1237 ("drm/xe: Dump GuC log to dmesg on load / auth failure")
>> seems to be the one adding it before drm-xe-next creation, but maybe
>> we just didn't have a better alternative at the time.
>>
>> >
>> > If so I would still prefer to make that persistent instead
>> > of the flooded dmesg that gets really messed up and hard
>> > to navigate to find the real useful information of the
>> > failures.
>>
>> that would be my preference too. If it works, I'm fine with that. At
>> least the end user should never be exposed to that amount of info we
>> print.
>>
>> could we add the guc log to a devcoredump if we failed earlier?
>>
>
>I agree that if we can avoid flooding dmesg either via debugfs being
>available or creating a devcoredump that is the preference.
>
>I added this code originally to debug failures on driver load during
>early Xe bring up. I haven't used this in a very long time.

humn... Aside from that debug I mentioned, I don't remember really
making use of this. If nobody is actively using, then maybe let's make
it simpler and proceed with this patch. If the needs arise, then it
should rather be added to devcoredump. Agreed?

>
>Matt
>
>> Lucas De Marchi
>>
>> >
>> > >
>> > > >
>> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/xe_guc.c | 1 -
>> > > > 1 file changed, 1 deletion(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> > > > index 235d27b17ff99..2a71348c5deda 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_guc.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
>> > > > @@ -466,7 +466,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
>> > > > 			ret = -ENXIO;
>> > > > 		}
>> > > >
>> > >
>> > > trailing newline above
>> >
>> > not actually a newline, but I can remove that extra line there
>> > while removing this.
>> > Wonder if I also should remove the spaces between the if/else
>> > above this block as well... The "style" there looked strange,
>> > but I decided to not touch.


not sure I follow. Looking at the code now it seems the style became
weird because you removed xe_guc_log_print(&guc->log, &p) without
removing the line before

Lucas De Marchi
