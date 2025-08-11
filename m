Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0981DC87FDB
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 14:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74C710E080;
	Mon, 11 Aug 2025 14:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzYC9+yl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F3010E080
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 14:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754923194; x=1786459194;
 h=message-id:subject:from:to:cc:in-reply-to:references:
 content-transfer-encoding:mime-version:date;
 bh=BwSD8QPFQ4rAxykCXfv/VUqEleoPcYZKT9Bh36DdN6U=;
 b=QzYC9+ylxtwwKVkCaBeRCPEV9m7QF6qPck6Valhp8kUIueMU+pICAZz/
 hFFR+hXrPZBS/eifq8rfjwtB4VI+FgxnLmmqeEfEeDBkE1XzO09WPaGeN
 q/vActf4cc+m0c4hGfkDFFx3kU7p+4Q4CXCF7xdfsVPkaBG68M6ZFeFVa
 bIOgbISEctPQw7YXZ+PFy4oRZgWV6ttya4htVmjL3z2teH1XINg/OyFBJ
 g9iHWc7zx/E2xYYbMKRddkKLvgY9iHOaT+f0v0MjNurFb0mLxp74N9bXf
 Izars0ZD6kQzTLL6f4RCBYvLtrA0ExYjxQwuGm/NTWxqOnxBVelQT7Jkh g==;
X-CSE-ConnectionGUID: Kv/fPrY5RliO7dDDX/35fw==
X-CSE-MsgGUID: Nd7kmBleRR+Yp6Gob2zGVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="60979182"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="60979182"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 07:39:54 -0700
X-CSE-ConnectionGUID: zz/dGTkBSuizsIYw0hJwtg==
X-CSE-MsgGUID: qHnosE+8RHWT/FEj3jkrJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165565593"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.228])
 ([10.245.244.228])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 07:39:51 -0700
Message-ID: <e62cbfa7867055bb368762c86a91e78c7afbf087.camel@linux.intel.com>
Subject: Re: [PATCH] locking/mutex: Add p->blocked_on wrappers for
 correctness checks
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Cc: intel-xe@lists.freedesktop.org, Connor O'Brien <connoro@google.com>, 
 John Stultz <jstultz@google.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, K Prateek Nayak	 <kprateek.nayak@amd.com>
In-Reply-To: <274f61b98745426050e545a37131b9408c3666f9.camel@arm.com>
References: <274f61b98745426050e545a37131b9408c3666f9.camel@arm.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Mon, 11 Aug 2025 16:39:13 +0200
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Hi Valentin,

On Sat, 2025-07-12 at 03:33 +0000, Valentin Schneider wrote:
> This lets us assert mutex::wait_lock is held whenever we access
> p->blocked_on, as well as warn us for unexpected state changes.
>=20
> [fix conflicts, call in more places]
> [jstultz: tweaked commit subject, reworked a good bit]
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> Signed-off-by: Connor O'Brien <connoro@google.com>
> Signed-off-by: John Stultz <jstultz@google.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Link:
> https://lkml.kernel.org/r/20250712033407.2383110-4-jstultz@google.com
> ---
> =C2=A0include/linux/sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6=
4
> ++++++++++++++++++++++++++++++++++--
> =C2=A0kernel/locking/mutex-debug.c |=C2=A0 4 +--
> =C2=A0kernel/locking/mutex.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32 +++=
+++++----------
> =C2=A0kernel/locking/ww_mutex.h=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++---
> =C2=A04 files changed, 81 insertions(+), 27 deletions(-)
>=20

Our CI is hitting a lot of these:

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5826

From looking at the code, the wound-wait code after wounding the mutex
owner, wakes it up opportunistically, so that *if* it is waiting on
another wound-wait mutex, should re-evaluate whether it should
rollback.=C2=A0Ideally in this case, the blocked-on status should be remove=
d
by the process that was woken up?

Otherwise if the wound-wait code misbehaves in doing this we need to
fix it.

Thanks,
Thomas


> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 33ad240ec900..5b4e1cd52e27 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -34,6 +34,7 @@
> =C2=A0#include <linux/sched/prio.h>
> =C2=A0#include <linux/sched/types.h>
> =C2=A0#include <linux/signal_types.h>
> +#include <linux/spinlock.h>
> =C2=A0#include <linux/syscall_user_dispatch_types.h>
> =C2=A0#include <linux/mm_types_task.h>
> =C2=A0#include <linux/netdevice_xmit.h>
> @@ -2129,6 +2130,67 @@ extern int
> __cond_resched_rwlock_write(rwlock_t *lock);
> =C2=A0 __cond_resched_rwlock_write(lock); \
> =C2=A0})
> =C2=A0
> +#ifndef CONFIG_PREEMPT_RT
> +static inline struct mutex *__get_task_blocked_on(struct task_struct
> *p)
> +{
> + struct mutex *m =3D p->blocked_on;
> +
> + if (m)
> + lockdep_assert_held_once(&m->wait_lock);
> + return m;
> +}
> +
> +static inline void __set_task_blocked_on(struct task_struct *p,
> struct mutex *m)
> +{
> + WARN_ON_ONCE(!m);
> + /* The task should only be setting itself as blocked */
> + WARN_ON_ONCE(p !=3D current);
> + /* Currently we serialize blocked_on under the mutex::wait_lock */
> + lockdep_assert_held_once(&m->wait_lock);
> + /*
> + * Check ensure we don't overwrite existing mutex value
> + * with a different mutex. Note, setting it to the same
> + * lock repeatedly is ok.
> + */
> + WARN_ON_ONCE(p->blocked_on && p->blocked_on !=3D m);
> + p->blocked_on =3D m;
> +}
> +
> +static inline void set_task_blocked_on(struct task_struct *p, struct
> mutex *m)
> +{
> + guard(raw_spinlock_irqsave)(&m->wait_lock);
> + __set_task_blocked_on(p, m);
> +}
> +
> +static inline void __clear_task_blocked_on(struct task_struct *p,
> struct mutex *m)
> +{
> + WARN_ON_ONCE(!m);
> + /* Currently we serialize blocked_on under the mutex::wait_lock */
> + lockdep_assert_held_once(&m->wait_lock);
> + /*
> + * There may be cases where we re-clear already cleared
> + * blocked_on relationships, but make sure we are not
> + * clearing the relationship with a different lock.
> + */
> + WARN_ON_ONCE(m && p->blocked_on && p->blocked_on !=3D m);
> + p->blocked_on =3D NULL;
> +}
> +
> +static inline void clear_task_blocked_on(struct task_struct *p,
> struct mutex *m)
> +{
> + guard(raw_spinlock_irqsave)(&m->wait_lock);
> + __clear_task_blocked_on(p, m);
> +}
> +#else
> +static inline void __clear_task_blocked_on(struct task_struct *p,
> struct rt_mutex *m)
> +{
> +}
> +
> +static inline void clear_task_blocked_on(struct task_struct *p,
> struct rt_mutex *m)
> +{
> +}
> +#endif /* !CONFIG_PREEMPT_RT */
> +
> =C2=A0static __always_inline bool need_resched(void)
> =C2=A0{
> =C2=A0 return unlikely(tif_need_resched());
> @@ -2168,8 +2230,6 @@ extern bool sched_task_on_rq(struct task_struct
> *p);
> =C2=A0extern unsigned long get_wchan(struct task_struct *p);
> =C2=A0extern struct task_struct *cpu_curr_snapshot(int cpu);
> =C2=A0
> -#include <linux/spinlock.h>
> -
> =C2=A0/*
> =C2=A0 * In order to reduce various lock holder preemption latencies
> provide an
> =C2=A0 * interface to see if a vCPU is currently running or not.
> diff --git a/kernel/locking/mutex-debug.c b/kernel/locking/mutex-
> debug.c
> index 758b7a6792b0..949103fd8e9b 100644
> --- a/kernel/locking/mutex-debug.c
> +++ b/kernel/locking/mutex-debug.c
> @@ -54,13 +54,13 @@ void debug_mutex_add_waiter(struct mutex *lock,
> struct mutex_waiter *waiter,
> =C2=A0 lockdep_assert_held(&lock->wait_lock);
> =C2=A0
> =C2=A0 /* Current thread can't be already blocked (since it's executing!)
> */
> - DEBUG_LOCKS_WARN_ON(task->blocked_on);
> + DEBUG_LOCKS_WARN_ON(__get_task_blocked_on(task));
> =C2=A0}
> =C2=A0
> =C2=A0void debug_mutex_remove_waiter(struct mutex *lock, struct
> mutex_waiter *waiter,
> =C2=A0 struct task_struct *task)
> =C2=A0{
> - struct mutex *blocked_on =3D READ_ONCE(task->blocked_on);
> + struct mutex *blocked_on =3D __get_task_blocked_on(task);
> =C2=A0
> =C2=A0 DEBUG_LOCKS_WARN_ON(list_empty(&waiter->list));
> =C2=A0 DEBUG_LOCKS_WARN_ON(waiter->task !=3D task);
> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> index e2f59863a866..80d778fedd60 100644
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -644,8 +644,7 @@ __mutex_lock_common(struct mutex *lock, unsigned
> int state, unsigned int subclas
> =C2=A0 goto err_early_kill;
> =C2=A0 }
> =C2=A0
> - WARN_ON(current->blocked_on);
> - current->blocked_on =3D lock;
> + __set_task_blocked_on(current, lock);
> =C2=A0 set_current_state(state);
> =C2=A0 trace_contention_begin(lock, LCB_F_MUTEX);
> =C2=A0 for (;;) {
> @@ -685,9 +684,9 @@ __mutex_lock_common(struct mutex *lock, unsigned
> int state, unsigned int subclas
> =C2=A0 /*
> =C2=A0 * As we likely have been woken up by task
> =C2=A0 * that has cleared our blocked_on state, re-set
> - * it to the lock we are trying to aquire.
> + * it to the lock we are trying to acquire.
> =C2=A0 */
> - current->blocked_on =3D lock;
> + set_task_blocked_on(current, lock);
> =C2=A0 set_current_state(state);
> =C2=A0 /*
> =C2=A0 * Here we order against unlock; we must either see it change
> @@ -699,11 +698,15 @@ __mutex_lock_common(struct mutex *lock,
> unsigned int state, unsigned int subclas
> =C2=A0
> =C2=A0 if (first) {
> =C2=A0 trace_contention_begin(lock, LCB_F_MUTEX | LCB_F_SPIN);
> - /* clear blocked_on as mutex_optimistic_spin may schedule() */
> - current->blocked_on =3D NULL;
> + /*
> + * mutex_optimistic_spin() can call schedule(), so
> + * clear blocked on so we don't become unselectable
> + * to run.
> + */
> + clear_task_blocked_on(current, lock);
> =C2=A0 if (mutex_optimistic_spin(lock, ww_ctx, &waiter))
> =C2=A0 break;
> - current->blocked_on =3D lock;
> + set_task_blocked_on(current, lock);
> =C2=A0 trace_contention_begin(lock, LCB_F_MUTEX);
> =C2=A0 }
> =C2=A0
> @@ -711,7 +714,7 @@ __mutex_lock_common(struct mutex *lock, unsigned
> int state, unsigned int subclas
> =C2=A0 }
> =C2=A0 raw_spin_lock_irqsave(&lock->wait_lock, flags);
> =C2=A0acquired:
> - current->blocked_on =3D NULL;
> + __clear_task_blocked_on(current, lock);
> =C2=A0 __set_current_state(TASK_RUNNING);
> =C2=A0
> =C2=A0 if (ww_ctx) {
> @@ -741,11 +744,11 @@ __mutex_lock_common(struct mutex *lock,
> unsigned int state, unsigned int subclas
> =C2=A0 return 0;
> =C2=A0
> =C2=A0err:
> - current->blocked_on =3D NULL;
> + __clear_task_blocked_on(current, lock);
> =C2=A0 __set_current_state(TASK_RUNNING);
> =C2=A0 __mutex_remove_waiter(lock, &waiter);
> =C2=A0err_early_kill:
> - WARN_ON(current->blocked_on);
> + WARN_ON(__get_task_blocked_on(current));
> =C2=A0 trace_contention_end(lock, ret);
> =C2=A0 raw_spin_unlock_irqrestore_wake(&lock->wait_lock, flags, &wake_q);
> =C2=A0 debug_mutex_free_waiter(&waiter);
> @@ -956,14 +959,7 @@ static noinline void __sched
> __mutex_unlock_slowpath(struct mutex *lock, unsigne
> =C2=A0 next =3D waiter->task;
> =C2=A0
> =C2=A0 debug_mutex_wake_waiter(lock, waiter);
> - /*
> - * Unlock wakeups can be happening in parallel
> - * (when optimistic spinners steal and release
> - * the lock), so blocked_on may already be
> - * cleared here.
> - */
> - WARN_ON(next->blocked_on && next->blocked_on !=3D lock);
> - next->blocked_on =3D NULL;
> + __clear_task_blocked_on(next, lock);
> =C2=A0 wake_q_add(&wake_q, next);
> =C2=A0 }
> =C2=A0
> diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
> index 45fe05e51db1..086fd5487ca7 100644
> --- a/kernel/locking/ww_mutex.h
> +++ b/kernel/locking/ww_mutex.h
> @@ -283,15 +283,13 @@ __ww_mutex_die(struct MUTEX *lock, struct
> MUTEX_WAITER *waiter,
> =C2=A0 if (waiter->ww_ctx->acquired > 0 && __ww_ctx_less(waiter->ww_ctx,
> ww_ctx)) {
> =C2=A0#ifndef WW_RT
> =C2=A0 debug_mutex_wake_waiter(lock, waiter);
> +#endif
> =C2=A0 /*
> =C2=A0 * When waking up the task to die, be sure to clear the
> =C2=A0 * blocked_on pointer. Otherwise we can see circular
> =C2=A0 * blocked_on relationships that can't resolve.
> =C2=A0 */
> - WARN_ON(waiter->task->blocked_on &&
> - waiter->task->blocked_on !=3D lock);
> -#endif
> - waiter->task->blocked_on =3D NULL;
> + __clear_task_blocked_on(waiter->task, lock);
> =C2=A0 wake_q_add(wake_q, waiter->task);
> =C2=A0 }
> =C2=A0
> @@ -345,7 +343,7 @@ static bool __ww_mutex_wound(struct MUTEX *lock,
> =C2=A0 * blocked_on pointer. Otherwise we can see circular
> =C2=A0 * blocked_on relationships that can't resolve.
> =C2=A0 */
> - owner->blocked_on =3D NULL;
> + __clear_task_blocked_on(owner, lock);
> =C2=A0 wake_q_add(wake_q, owner);
> =C2=A0 }
> =C2=A0 return true;

