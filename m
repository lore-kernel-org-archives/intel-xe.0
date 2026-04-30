Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7182CFF8873
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 13:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F8610E96A;
	Thu, 30 Apr 2026 13:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1eYyJmF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B3C10E96A
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 13:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777556049; x=1809092049;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Ux3DSLBhokPMS7DsL8ppAopvMhJwhw9HHt0c1s9EPGg=;
 b=A1eYyJmFbsIuz/QivhpqVzZpkRSq2t2vA5QXQHWK1yjgZBVXwW81ppvR
 tgbGSYRqPf5qtqEqvaMf7M+dMHVklkybXcHvKTYV7Hp3oRqnlgkRdQ01S
 EgmeYHnw6+4t/8zgC6T2qRwOg8GMpr23/7oL6OrlNqVwzVFMlEFMYNvui
 MK0CqFzc8UEm0oEeCy1UkV5yLHXtiRBwfOzO2BELnuEuOSgPeKjRlHNla
 C7bK+0wexyUvDYwS7z1H7XyYfedMv037bcoOXgTZu7TwACSBL7w/rBLvi
 B1mX6VpOoWkUMcz8QHeFZ7tttjWKndVSh+cKF9AJZCMXPEcwslTO+5vs4 g==;
X-CSE-ConnectionGUID: tOmYEz8tTX2+JobFCq9JIg==
X-CSE-MsgGUID: V3j1CLW6QbKnfjvREQGWOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89880176"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="89880176"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:34:08 -0700
X-CSE-ConnectionGUID: gUvvVND/QwCIv7E1kW/HxA==
X-CSE-MsgGUID: dtHaOYoURpC81IhnT6oEcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="233553746"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 06:34:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 06:34:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 06:34:07 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 06:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gi4yTGd1DWDHACyTXJHfAhn83kFEdMoRdvjFfWmwv9HPmrqISBNyb7KQi5bzbNwBq7gVz36lSinF8Hl5kLaQepT2kJ8XrQCWhdGkC5TY+e/jWWcw8ciBvEUZhlrE61qY6Al3NHTvRL3MUikN/P4DOZUgUuUZsx1bfCH8i9H616SnZe8YK+Bx+l+WmjAVIyTlNmnseoH4aoD5ucfav0mi6xI6agyBrlnqR0OjDV72q8If33GBSxqJgMlMGYhlnPjnBpVbWWAs6lHtfPPQp4KP8prj5Uwz95u8uX50hES0b4TDXcG5XGIdI/osJAl8sHAX/8RHwftkGu6tqdQhBYNL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i15l54VBVlM8xOhDvOIiOWEk2SAVy9KPq/DL9mMv79g=;
 b=METRdsU21MfuOnztOpqeXWKoiZMMShLigpEfonCsjWk/yPEEdj9skIoeMJW6OR/jbE+mNpgJu80EvVJ2geHzbianicTPisT8BsfR0KbHs+DoWNxqUJbYaPEBJIWZGf8MOx44+Q0Ns9DCzHfkTAw3ZjjoDkQIu0R0uMktmbGdvqN1sOkvofel3O5fzpP4w2ZT2L0qbWHhy9JSrSLu6Gjd+1reYFJ1tN8M6aE4T6HgFK7FtBvGqfn1FvMjss5//Nl9pBfWBYpp75Kjn2tGuW3dw5MlcTGQOGG2E+mv/oBJFSm7elVn61rsPZx55095Dnzf3kDW/VAr2mS+ByjBvVZHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 13:34:03 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 13:34:03 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe/rtp: Fully parse the ruleset
In-Reply-To: <20260210223453.GI4694@mdroper-desk1.amr.corp.intel.com>
References: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
 <20260114-rtp-rule-parser-v1-5-fa9029586bff@intel.com>
 <20260210223453.GI4694@mdroper-desk1.amr.corp.intel.com>
Date: Thu, 30 Apr 2026 10:33:58 -0300
Message-ID: <871pfw4lo9.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0872b8-1afe-46df-5154-08dea6bd2499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: E90jfmi18MuMZtcHDWkU0+wd2k5aQeHdS3H2Ze7FrTgSXFuo72Z57dlsJnxHM3P9caaCNMnl5Faj/xPHbMCidJ4y1yLSjern4FlDIS7f1sKB/YaNGf6YLx0VEEFOoEdqEP6G/IRn6Ze7Jj19qGWcGcz0cHhW71zE2atFyme0zv6znEHOOowL1JrqwGWku8D3+XhUHqQNacL3cTVpMRjIr2/lkzwdz1cw1nMXNWK4zzPLMya609zlz1ixYvRpiI9ktRWkg7EdJ0h1wlJT1Wgme80PZIgx1T2zjvOqJxX9wjL5BYgexlFA88bnJCJ4Vph++m4s1DIlPfHrQNOqDa8fdJxZquZlAEsCTMhdX4v5CaZnziIfShUy7GDT/eHLFvFG4R0Ukd8Y4LJoAPMwNUlrNNqs4GIiO3OvWXM6puZv8otFVIPFBxvt/5dNrbHSzTKD+TSQ9vZ8UretU2orr32OAZuZIAx1blbJOtQbiZ3iEeso4nB/9CdN636gxqQWH3R9FcS84ktc6SbRCiSdybk7yc3LIvGf+g//GxVBj4lxmIVuX+UG/kZJ/QXgCGxeg+VXTUFaOy/ys9UrQyw6UCnol6jYSGk6Ra5OMcVr8hF6O+4heFo0wyeedIQn4i23HPVUgu4OJUuRJbkuQHqSnP0W/2fdo47BV6JDwHV+f42NiSwRi2o59A7kVzdLtfXfwpP9Wl8/qUvwLk7GDOOFH3c8iQTp3gtszo8exwh/teY7Jy8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QmjQW1aaFq4YHLu8c9+78WRfgE6Y/Z4AxJznXLmbmsbSjOiHGuQtyBEarwPM?=
 =?us-ascii?Q?pJBIy8kct6VbaLFCAaPxig4d/6MJsMjg4TigHevQ1+5WTMDFJWBRKVOtAKLD?=
 =?us-ascii?Q?VR6Ci+g4TLrC2gvfOLBd3F/DAQ6gio3KkSsHrRH/qHFO+FtjljB/2cBUBUo6?=
 =?us-ascii?Q?B8nX4c92z1HG14gLcZLBE1OU7kBDsWKHB3IZEFib/9DqAt1BQ/C6K7oKbDBq?=
 =?us-ascii?Q?bi1xVeXQ/5BloDuEdZEX4igaP/yw6DPEcTJAhPjNXdwp1x4hZR7AxaSzoIq0?=
 =?us-ascii?Q?4DifkfwFP2ITEpBL/MvgQM4VkmIaKTjT3MdsvZyYgW1Is2riAAlEPAVcbbcZ?=
 =?us-ascii?Q?+gwGQygsQGYrHwgRzaWLvFsIukuxeCSj9QR3qzpsjf6TuwCvcSTQEaK60hBf?=
 =?us-ascii?Q?205xvuBb3zIycv4Z+f1CxMWT5OKNGCxFLLR3pEBcZz2RIWOwJjgw+NPOwcph?=
 =?us-ascii?Q?8GY69oHmDIAAs62qLCU5tsSxT3/v4B8dT1FiXptwGLdNL0LPG9PywgDZs20D?=
 =?us-ascii?Q?Acr6KhD9jhORSjZiZYvPPKok2kCscp7YBtjSRKyJzo8343/RWUwwGwzQ0lfv?=
 =?us-ascii?Q?DMb6WE0HB8zT23g85OQKtolAfRHvM/0s+44813SwCXJPc+MMf6CxZHO7Ij3p?=
 =?us-ascii?Q?cPUWpjckLsA6arpdFNh+LRhfTI4lFy09GyRyytQDcYmMy7t8S3UMG8SjD/pS?=
 =?us-ascii?Q?TW1phzjJW1Bl2WY7VLRmVniBe7jUi2BjdQLmwtC73kpdZkBOH1LUtGoiUM+7?=
 =?us-ascii?Q?tDhVDL++f5k5rQDHm5FA6ZY1mG4cfGzb/D1XiJah4FPsB9x5/jq2xVeRg7Yj?=
 =?us-ascii?Q?NJi0fk5AxfM40V/rkG4XcMH9guWemth2GYEu35Q8mR2MhU0MSvQXRkcaKcRZ?=
 =?us-ascii?Q?g3U6C2HO9VhW0UXBOHV2Ls4SdrUuXpJuTCww46om41bdLm9mbFRmc09w/BEi?=
 =?us-ascii?Q?fZu+eTd7ztEO8OP+r3HgE0tLI8yKD7urOAadcV3Utse+Qp2w9V6hwJVHTogm?=
 =?us-ascii?Q?N5GaagijYK7Mus74Gf5BT9vKoPwSN79uNNm0JiWaqP5WTigPnXE8TQwedyGR?=
 =?us-ascii?Q?ezBlnplKSWHN+uxpnWNBCrmM+twsLffGJuJGtZZ7DII1ZRh7zjmvOebfEIG3?=
 =?us-ascii?Q?/zuiFMcQwH4+z4l37yXd/2VWoNB1kIh/oXgXxsVBfFAYl5IZLIsFai8c1otY?=
 =?us-ascii?Q?HIF+4c3PPqaXE/nLaVFMvrvfpz+RCjj7zHXte9BDxfnKkGUG4E/xwXQru28T?=
 =?us-ascii?Q?bll7Z0cH17f6GICRD9k9/dlKfjD00f2yMkwttYPzBmtcyC5DshToa4zZ9pLU?=
 =?us-ascii?Q?ME4wSsB0noLwvQk1r5vC3/BIJyBtk/FPV6L0z9wDVr3CSKXgJ8R847kM7Au4?=
 =?us-ascii?Q?UAzA+bqF5H3jNziQi1xrpCxdG8j3naRjbWl15ddcwJ/xfVfAcO7NMnowctM5?=
 =?us-ascii?Q?1YgihfQx4JHGrF8vAYXm/qBop2FM+ExnDP1tBgqsg252WifwvejNkIG6sHxh?=
 =?us-ascii?Q?+OWCPCPKNSxnPBxvwoGiDk9uJURUByvDdMXxMDsPG0HT6RGl8B5JCePvkQne?=
 =?us-ascii?Q?q+8bwnaTb6t+rU+gShPsfagUeXEQSx4r5PUMmKjxkDejGPQW148ebcdEfWG/?=
 =?us-ascii?Q?WSEaXQZGPaRuJNFb1RTFB8ki3CI+5Mk8Ft3Nup6BFBXc8po9jCDcn2M9fzwY?=
 =?us-ascii?Q?tXJvVZkfVUn/zluYOALgnc1H4bmM6pHGHmAOe3XW//WTQMr82k5SpTnHr8kw?=
 =?us-ascii?Q?oUzCFz12Vg=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZRV9NBAOjifGcGuHBAprN3/Ijnjgzg2QYBffLN42aCuU/wB/KUpANRsIjLPdt0fAwVVJGPAv6Ls9cCCKULAJt9btQ0hHIGUNisnBX8P5BX0V4LOQhwwLKmTO823mJ5Fjb/FcBmC35m0y4H19Zg7OSYCYZ55LI7gyW7ziX7EWXyrf5K2ILqhBObB8qasgJuoPgaqid1bBkhE+vRBrUv34PkWTnCghKM2lm9rdKqL6yQXcGJVa3mKlCxqYNpTWQO10be6VyEtjrWoKL88vhxJLh8RbvXRhSt8gqQgGvPrsv93QvblJzFIu50FQuJk9XgvTRtk1oi2+vKn6Ya/IHEH8rg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0872b8-1afe-46df-5154-08dea6bd2499
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 13:34:02.9218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ehp1yphQh6EfUiXutAmXSp4E/t5l2bpcp/Y4HPc5tUfp57DIcxiMjq763rToKhTh5iwUaUr8HiEFyv3T/Xpxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7029
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Wed, Jan 14, 2026 at 07:49:55PM -0300, Gustavo Sousa wrote:
>> The function rule_matches() short-circuits evaluation of the implicit
>> conjunctions (each substring of rules not containing OR) and the
>> explicit disjunctions (implicit conjunctions joined by OR). In other
>> words:
>> 
>>   - in a conjunction, once a rule evaluate to false, we skip to the next
>>     OR (if any) to evaluate the next conjunction;
>>   - in a disjunction, once a conjunction evaluates to true, we return
>>     true and skip evaluating all the remaining rules.
>> 
>> While this behavior results in a correct logical value, it has the
>> side-effect that rule set does not get fully "parsed", allowing
>> incomplete constructs like (rule1, OR) to evaluate to true when rule1 is
>> true.  We should treat such constructs as invalid and treat them the
>> same way we do for stuff like (OR, rule1).
>> 
>> As such, update rule_matches() to "parse" the whole rule set, and that
>> while keeping the short-circuit aspect of evaluation.
>
> I took "keeping the short-circuit aspect of evaluation" to mean that a
> "yes-or" rule would still be treated as a match functionally, but
> flagged as an error for kunit checks.  But it seems we're also changing
> the behavior to reject the whole record in that case, which seems like
> it would just make the mistake worse in non-kunit settings.

Right.  Indeed, this patch changes that behavior.

>
> I think it would be better to treat "or-yes" and "yes-or" type mistakes
> as a match, but flag them as errors in kunit.  I'd expect the most

Makes sense.  After reading this, I realized that we have some kind of
inconsistency in the current RTP code: "yes-or" would produce a match,
but "or-yes" would not.

I think we can add a preliminary patch to fix that: treat empty
conjunctions as false, meaning that, in the "or-yes" case, there would
be no short-circuit to false (the current behavior) and evaluation would
continue to catch the "yes" match.

With that in place, this patch would be only about making sure that we
fully parse the reulset without changing the matching behavior. I'll do
that in v2.

--
Gustavo Sousa

> common case we'd have such a mistake would be if someone is deleting
> something that no longer applies (e.g., a pre-production workaround set
> of rules) and they just forget to also remove the adjacent OR.  The
> remaining parts of the rule should still be valid with that kind of
> mistake, so treating the whole rule as not a match seems wrong.
>
>
> Matt
>
>> 
>> Let's also update the kunit test to include instances of those
>> incomplete constructs to reflect this change.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 12 +++++++
>>  drivers/gpu/drm/xe/xe_rtp.c            | 61 +++++++++++++++++++---------------
>>  2 files changed, 46 insertions(+), 27 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> index 19c7142b2fe4..f0122553644e 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> @@ -177,6 +177,18 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
>>  		.expected_err = -EINVAL,
>>  		XE_RTP_RULES(OR, FUNC(match_yes)),
>>  	},
>> +	{
>> +		.name = "anything-or",
>> +		.expected_match = false,
>> +		.expected_err = -EINVAL,
>> +		XE_RTP_RULES(FUNC(match_yes), OR),
>> +	},
>> +	{
>> +		.name = "anything-or-or-anything",
>> +		.expected_match = false,
>> +		.expected_err = -EINVAL,
>> +		XE_RTP_RULES(FUNC(match_yes), OR, OR, FUNC(match_yes)),
>> +	},
>>  
>>  	/* No match because hwe is NULL. */
>>  	{
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index dabc2e74e2ce..55df9c16a3cc 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -123,47 +123,54 @@ static bool rule_matches_with_err(const struct xe_device *xe,
>>  {
>>  	const struct xe_rtp_rule *r;
>>  	unsigned int i, rcount = 0;
>> +	bool parse_only = false;
>> +	bool match = false;
>>  
>>  	if (err)
>>  		*err = 0;
>>  
>>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
>> -		if (r->match_type == XE_RTP_MATCH_OR)
>> -			/*
>> -			 * This is only reached if a complete set of
>> -			 * rules passed or none were evaluated. For both cases,
>> -			 * shortcut the other rules and return the proper value.
>> -			 */
>> -			goto done;
>> +		if (r->match_type == XE_RTP_MATCH_OR) {
>> +			if (drm_WARN_ON(&xe->drm, !rcount)) {
>> +				parse_only = true;
>> +				match = false;
>> +				if (err)
>> +					*err = -EINVAL;
>> +			} else if (match) {
>> +				parse_only = true;
>> +			}
>> +
>> +			rcount = 0;
>> +
>> +			continue;
>> +		}
>> +
>> +		rcount++;
>> +
>> +		if (parse_only || !rule_match_item(xe, gt, hwe, r)) {
>> +			if (!parse_only)
>> +				match = false;
>>  
>> -		if (rule_match_item(xe, gt, hwe, r)) {
>> -			rcount++;
>> -		} else {
>>  			/*
>>  			 * Advance rules until we find XE_RTP_MATCH_OR to check
>>  			 * if there's another set of conditions to check
>>  			 */
>> -			while (++i < n_rules && rules[i].match_type != XE_RTP_MATCH_OR)
>> -				;
>> -
>> -			if (i >= n_rules)
>> -				return false;
>> -
>> -			rcount = 0;
>> +			while (i + 1 < n_rules && rules[i + 1].match_type != XE_RTP_MATCH_OR) {
>> +				i++;
>> +				rcount++;
>> +			}
>> +		} else {
>> +			match = true;
>>  		}
>>  	}
>>  
>> -done:
>> -	if (drm_WARN_ON(&xe->drm, !rcount))
>> -		goto error;
>> -
>> -	return true;
>> -
>> -error:
>> -	if (err)
>> -		*err = -EINVAL;
>> +	if (drm_WARN_ON(&xe->drm, !rcount)) {
>> +		match = false;
>> +		if (err)
>> +			*err = -EINVAL;
>> +	}
>>  
>> -	return false;
>> +	return match;
>>  }
>>  
>>  static bool rule_matches(const struct xe_device *xe,
>> 
>> -- 
>> 2.52.0
>> 
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
